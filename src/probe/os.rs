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
}
