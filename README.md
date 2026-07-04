# intlimiter

A simple command-line tool to limit network interface bandwidth using Linux traffic control (tc).

## Features

- Limit download and upload speeds independently
- Support for both megabits (mbit) and megabytes (mbyte) per second
- Automatic network interface detection
- Easy to clear/remove limits
- Debug mode for troubleshooting

## Requirements

- Linux with `tc` (traffic control) and `ip` commands
- `sudo`, `bc`
- Root privileges for traffic control operations

## Installation

```bash
sudo cp intlimiter /usr/local/bin/
sudo chmod +x /usr/local/bin/intlimiter
```

## Usage

```bash
# Limit download to 50 megabits per second
intlimiter --down --mbit 50

# Limit upload to 10 megabytes per second
intlimiter --up --mbyte 10

# Specify a particular interface
intlimiter --down --mbit 50 --interface eth0

# Clear all limits
intlimiter --clear

# Show current limits and applied qdiscs
intlimiter --status

# Enable debug output
intlimiter --debug --down --mbit 50
```

## Options

| Option | Description |
| --- | --- |
| `--down` | Limit download speed |
| `--up` | Limit upload speed |
| `--mbit` | Speed in megabits per second |
| `--mbyte` | Speed in megabytes per second |
| `--interface <iface>` | Network interface (default: auto-detect) |
| `--clear` | Remove speed limits |
| `--status` | Show current limits and applied qdiscs |
| `--debug` | Enable debug output |
| `-h, --help` | Show help message |

## How it works

- Download limiting uses IFB (Intermediate Functional Block) to shape ingress traffic
- Upload limiting uses HTB (Hierarchical Token Bucket) on egress
- Requires root privileges for traffic control operations

## State and Concurrency

- Active limit state is stored in `/var/run/intlimiter.state`
- State mutations are guarded by a filesystem lock at `/var/run/intlimiter.locks/state`
- IFB device name is fixed as `ifb0` so apply and clear paths are deterministic
- `--clear` directly tears down qdiscs and IFB state instead of relying only on parsed state

## Development

```bash
bash -n intlimiter
```

This performs a syntax check on the main script.

## Contributing

Contributions are welcome via pull request or issue.

## License

MIT
