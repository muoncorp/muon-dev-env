use std::{
    env,
    path::{Path, PathBuf},
    process::Command,
};

use anyhow::{anyhow, Result};
use tracing::debug;

#[derive(PartialEq, Debug)]
pub enum Shell {
    Bash,
    Zsh,
    PowerShell,
    Unknown,
}

impl Shell {
    pub fn probe() -> Result<Self> {
        if cfg!(target_os = "linux") {
            Self::probe_linux_shell()
        } else if cfg!(target_os = "macos") {
            Self::probe_macos_shell()
        } else if cfg!(target_os = "windows") {
            Ok(Self::PowerShell)
        } else {
            Ok(Self::Unknown)
        }
    }

    fn probe_linux_shell() -> Result<Self> {
        Self::from_shell_path(Path::new(&env::var("SHELL")?))
    }

    fn probe_macos_shell() -> Result<Self> {
        let output = Command::new("/usr/bin/dscl")
            .args([".", "-read", &env::var("HOME")?, "UserShell"])
            .output()?;
        let line = String::from_utf8(output.stdout)?;
        debug!("line: {:?}", line);
        let shell = line
            .split_whitespace()
            .nth(1)
            .ok_or(anyhow!("Failed to get shell on macos!"))
            .map(ToOwned::to_owned)?;
        let path: &Path = Path::new(&shell);
        Self::from_shell_path(path)
    }

    fn from_shell_path(path: &Path) -> Result<Self> {
        let name = path
            .file_name()
            .ok_or(anyhow!("invalid path"))?
            .to_str()
            .ok_or(anyhow!("invalid str"))?;
        Ok(match name {
            "zsh" => Self::Zsh,
            "bash" => Self::Bash,
            _ => Self::Unknown,
        })
    }

    pub fn get_rc_file_path(&self) -> Result<PathBuf> {
        let home_path = home::home_dir().ok_or(anyhow!("cannot get home dir"))?;

        match self {
            Shell::Bash => Ok(home_path.join(".bashrc")),
            Shell::Zsh => Ok(home_path.join(".zshrc")),
            Shell::PowerShell => Err(anyhow!("not implemented")),
            Shell::Unknown => Err(anyhow!("unknown shell")),
        }
    }
}
