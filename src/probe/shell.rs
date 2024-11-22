use std::{env, path::Path, process::Command};

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
        Ok(Self::from_str(&env::var("SHELL")?))
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
        Ok(Self::from_str(
            path.file_name()
                .ok_or(anyhow!("invalid path"))?
                .to_str()
                .ok_or(anyhow!("invalid str"))?,
        ))
    }

    fn from_str(s: &str) -> Self {
        match s {
            "zsh" => {
                return Self::Zsh;
            }
            "bash" => {
                return Self::Bash;
            }
            _ => {
                return Shell::Unknown;
            }
        }
    }
}
