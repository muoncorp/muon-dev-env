use std::process::Command;

use crate::probe::os::Os;
use anyhow::Result;
use gentoo::GentooPackage;

mod gentoo;

pub fn install_os_packages(os: &Os) -> Result<()> {
    let distribution_name = os.get_distribution_name()?;
    if distribution_name == "gentoo" {
        GentooPackage::packages_with_post_commands(
            vec!["app-containers/docker", "app-containers/docker-compose"],
            vec![
                Command::new("sudo").args(&["rc-update", "add", "docker", "default"]),
                Command::new("sudo").args(&["usermod", "-aG", "docker", &whoami::username()]),
            ],
        )
        .install()?;
        GentooPackage::packages(vec![
            "app-editors/vscode",
            "sys-apps/flatpak",
            "sys-apps/xdg-desktop-portal",
        ])
        .install()?;
    }
    Ok(())
}
