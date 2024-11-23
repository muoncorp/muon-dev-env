use anyhow::Result;
use std::{
    ffi::OsStr,
    process::{Command, Stdio},
};

use tracing::info;

pub struct GentooPackage<'a, S>
where
    S: AsRef<OsStr>,
{
    pub packages: Vec<S>,
    pub post_commands: Vec<&'a mut Command>,
}

impl<'a, S: AsRef<OsStr>> GentooPackage<'a, S> {
    pub fn packages(packages: Vec<S>) -> Self {
        Self {
            packages,
            post_commands: vec![],
        }
    }

    pub fn packages_with_post_commands(
        packages: Vec<S>,
        post_commands: Vec<&'a mut Command>,
    ) -> Self {
        Self {
            packages,
            post_commands,
        }
    }

    pub fn install(self) -> Result<()> {
        let output = Command::new("sudo")
            .arg("emerge")
            .arg("--noreplace")
            .args(self.packages)
            .stdout(Stdio::inherit())
            .stderr(Stdio::inherit())
            .output()?;
        info!("{:?}", output.status);

        for mut command in self.post_commands {
            let output = command
                .stdout(Stdio::inherit())
                .stderr(Stdio::inherit())
                .output()?;
            info!("{:?}", output.status);
        }
        Ok(())
    }
}
