use anyhow::Result;

use os::Os;
use shell::Shell;

pub mod os;
pub mod shell;

/// Contains probe result data.
#[derive(Debug)]
pub struct ProbeData {
    /// Current running OS
    pub os: Os,
    /// Current user's shell
    pub shell: Shell,
}

impl ProbeData {
    pub fn is_unknown_os(&self) -> bool {
        &self.os == &Os::Unknown
    }
}

pub fn probe_all() -> Result<ProbeData> {
    Ok(ProbeData {
        os: Os::probe(),
        shell: Shell::probe()?,
    })
}
