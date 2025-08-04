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
                fake_tty::command("sudo rc-update add docker default", None)?,
                fake_tty::command(
                    &format!("sudo usermod -aG docker {}", whoami::username()),
                    None,
                )?,
            ],
        )
        .install()?;
        GentooPackage::packages_with_post_commands(
            vec!["sys-apps/flatpak"],
            vec![
                fake_tty::command("flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user", None)?,
                fake_tty::command("flatpak install flathub com.google.AndroidStudio", None)?,
                fake_tty::command("flatpak install flathub cc.arduino.IDE2", None)?,
            ],
        )
        .install()?;
        GentooPackage::packages(vec![
            "app-editors/vscode",
            "sys-apps/xdg-desktop-portal",
            "games-util/game-device-udev-rules",
            "gnome-extra/gnome-software",
            "www-client/google-chrome",
            "sys-devel/clang",
            "dev-embedded/u-boot-tools",
            "sys-apps/fakeroot",
            // "app-shells/nushell",
        ])
        .install()?;
    }
    Ok(())
}
