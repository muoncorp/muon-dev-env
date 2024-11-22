mod probe;

use anyhow::Result;
use clap::{Parser, Subcommand};
use probe::probe_all;

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

    let probe_data = probe_all()?;

    if let Some(command) = cli.command {
        match command {
            Commands::Check => {
                println!("probe: {:?}", probe_data);
                if probe_data.is_unknown_os() {
                    panic!("Unknown OS!"); // TODO: improve error message
                }
                if probe_data.is_unknow_shell() {
                    panic!("Unknown shell!"); // TODO: improve error message
                }
                probe_data.print();
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
