use anyhow::{anyhow, Result};
use std::{
    collections::VecDeque,
    io::{stdout, Read, Write},
    process::{Command, Stdio},
    thread,
};

use tracing::info;

use crate::divider::print_divider;

pub struct GentooPackage<S>
where
    S: ToString,
{
    pub packages: Vec<S>,
    pub post_commands: Vec<Command>,
}

impl<S: ToString> GentooPackage<S> {
    pub fn packages(packages: Vec<S>) -> Self {
        Self {
            packages,
            post_commands: vec![],
        }
    }

    pub fn packages_with_post_commands(packages: Vec<S>, post_commands: Vec<Command>) -> Self {
        Self {
            packages,
            post_commands,
        }
    }

    pub fn install(self) -> Result<()> {
        print_divider("Emerge packages");
        let packages: String = self
            .packages
            .iter()
            .map(ToString::to_string)
            .collect::<Vec<_>>()
            .join(" ");
        let mut child =
            fake_tty::command(&format!("sudo emerge -v --noreplace {}", packages), None)?
                .stdout(Stdio::piped())
                .stderr(Stdio::inherit())
                .spawn()?;

        let mut child_out = std::mem::take(&mut child.stdout).ok_or(anyhow!("take stdout"))?;

        let packages_installed = thread::spawn(move || -> Result<bool> {
            let mut buf = [0u8; 1];
            let mut result = true;
            let mut buf2: VecDeque<u8> = VecDeque::new();
            loop {
                let num_read = child_out.read(&mut buf)?;
                if num_read == 0 {
                    break;
                }
                stdout().write_all(&buf)?;
                buf2.push_back(buf[0]);
                if buf2.len() > 20 {
                    buf2.pop_front();
                }
                let buf3: Vec<u8> = buf2.iter().map(ToOwned::to_owned).collect();
                let utf8_buf = String::from_utf8_lossy(&buf3);
                if result && utf8_buf.contains("Total: 0 packages,") {
                    result = false;
                }
            }
            Ok(result)
        })
        .join()
        .expect("thread_err")?;

        if packages_installed {
            print_divider("Run post commands");
            for mut command in self.post_commands {
                let output = command
                    .stdout(Stdio::inherit())
                    .stderr(Stdio::inherit())
                    .output()
                    .expect("command output");
                info!("{:?}", output.status);
            }
        }

        Ok(())
    }
}
