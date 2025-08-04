use anyhow::{anyhow, Result};
use sys_info::linux_os_release;

#[derive(PartialEq, Debug)]
pub enum Os {
    Linux,
    MacOS,
    Windows,
    Unknown,
}

impl Os {
    pub fn probe() -> Self {
        if cfg!(target_os = "linux") {
            Self::Linux
        } else if cfg!(target_os = "macos") {
            Self::MacOS
        } else if cfg!(target_os = "windows") {
            Self::Windows
        } else {
            Self::Unknown
        }
    }

    pub fn get_distribution_name(&self) -> Result<String> {
        match self {
            Os::Linux => {
                let linux_os_release_info = linux_os_release()?;
                Ok(linux_os_release_info.id().to_owned())
            }
            Os::MacOS => Ok("macos".to_owned()),
            Os::Windows => Ok("windows".to_owned()),
            Os::Unknown => Err(anyhow!("unknown OS")),
        }
    }
}
