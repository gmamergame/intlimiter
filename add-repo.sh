#!/bin/bash
# Add intlimiter apt repository
# Usage: curl -sSL https://raw.githubusercontent.com/gmamergame/intlimiter/main/add-repo.sh | sudo bash

REPO_URL="https://raw.githubusercontent.com/gmamergame/intlimiter/main"
REPO_FILE="/etc/apt/sources.list.d/intlimiter.list"

echo "Adding intlimiter apt repository..."
echo "deb [trusted=yes] $REPO_URL/apt-repo stable main" > "$REPO_FILE"

sudo apt update -qq && sudo apt install -y intlimiter

echo "intlimiter installed successfully!"
echo "Usage: intlimiter --down --mbit 50"
