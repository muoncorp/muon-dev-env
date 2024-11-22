mod probe;

use anyhow::Result;
use clap::{Parser, Subcommand};
use probe::probe_all;
use tracing::info;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Cli {
    #[command(subcommand)]
    command: Option<Commands>,
}

#[derive(Subcommand, Debug)]
enum Commands {
    /// Check environments (OS, Distribution, Shell, Etcs...)
    Check,
    /// Install development tools
    Install,
    /// Update development tools
    Update,
}

fn main() -> Result<()> {
    tracing_subscriber::fmt::init();

    let cli = Cli::parse();

    println!("args: {:?}", cli);

    if let Some(command) = cli.command {
        match command {
            Commands::Check => {
                let probe_data = probe_all()?;

                println!("probe: {:?}", probe_data);
                if probe_data.is_unknown_os() {
                    panic!("Unknown OS!");
                }
                info!("OS: {:?}", probe_data.os);
                info!("Shell: {:?}", probe_data.shell);
            }
            Commands::Install => {
                todo!();
            }
            Commands::Update => {
                todo!();
            }
        }
    }
    Ok(())
}
