# intlimiter

A simple command-line tool to limit network interface bandwidth using Linux traffic control (tc).

## Features

- Limit download and upload speeds independently
- Support for both megabits (mbit) and megabytes (mbyte) per second
- Automatic network interface detection
- Easy to clear/remove limits

## Requirements

- Linux with `tc` (traffic control) and `ip` commands
- Root privileges (uses sudo)

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
```

## Options

| Option | Description |
|--------|-------------|
| `--down` | Limit download speed |
| `--up` | Limit upload speed |
| `--mbit` | Speed in megabits per second |
| `--mbyte` | Speed in megabytes per second |
| `--interface <iface>` | Network interface (default: auto-detect) |
| `--clear` | Remove all speed limits |
| `-h, --help` | Show help message |

## How it works

- Download limiting uses IFB (Intermediate Functional Block) to shape ingress traffic
- Upload limiting uses HTB (Hierarchical Token Bucket) on egress
- Requires root privileges for traffic control operations

## License

MIT
