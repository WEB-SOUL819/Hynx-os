#!/bin/bash

# HYNX Theme Uninstaller
# Removes HYNX theme and restores defaults

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;37m'
NC='\033[0m'

echo -e "${WHITE}HYNX Theme Uninstaller${NC}"
echo -e "${GRAY}This will remove HYNX theme and restore defaults${NC}"
echo ""

read -p "Are you sure you want to uninstall HYNX? (y/N): " -r

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Uninstall cancelled."
    exit 0
fi

echo ""
echo -e "${CYAN}[INFO]${NC} Starting HYNX uninstallation..."

# Restore backups if they exist
if [[ -f ~/.hynx/backup/.zshrc.bak ]]; then
    cp ~/.hynx/backup/.zshrc.bak ~/.zshrc
    echo -e "${GREEN}[✓]${NC} Restored .zshrc backup"
fi

if [[ -f ~/.hynx/backup/colors.properties.bak ]]; then
    cp ~/.hynx/backup/colors.properties.bak ~/.termux/colors.properties
    echo -e "${GREEN}[✓]${NC} Restored colors backup"
fi

if [[ -f ~/.hynx/backup/font.ttf.bak ]]; then
    cp ~/.hynx/backup/font.ttf.bak ~/.termux/font.ttf
    echo -e "${GREEN}[✓]${NC} Restored font backup"
fi

# Remove HYNX files
rm -rf ~/.hynx
echo -e "${GREEN}[✓]${NC} Removed HYNX directory"

# Remove hynx command
rm -f ~/bin/hynx
echo -e "${GREEN}[✓]${NC} Removed hynx command"

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                                       ║${NC}"
echo -e "${GREEN}║  HYNX theme uninstalled successfully  ║${NC}"
echo -e "${GREEN}║                                       ║${NC}"
echo -e "${GREEN}║  Please restart Termux to complete   ║${NC}"
echo -e "${GREEN}║  the uninstallation process.         ║${NC}"
echo -e "${GREEN}║                                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo -e "${GRAY}Thank you for trying HYNX!${NC}"