use anyhow::Result;

use os::Os;
use shell::Shell;
use tracing::info;

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

    pub fn is_unknow_shell(&self) -> bool {
        &self.shell == &Shell::Unknown
    }

    pub fn print(&self) -> Result<()> {
        info!("OS: {:?}", self.os);
        info!("  - {}", self.os.get_distribution_name()?);
        info!("Shell: {:?}", self.shell);
        info!("  - {:?}", self.shell.get_rc_file_path()?);
        Ok(())
    }
}

pub fn probe_all() -> Result<ProbeData> {
    Ok(ProbeData {
        os: Os::probe(),
        shell: Shell::probe()?,
    })
}
