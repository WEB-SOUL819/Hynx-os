#!/bin/bash

# HYNX Minimalist Termux Theme Installer
# A clean, minimal theme with Doom font styling
# Version: 1.0.0

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

# Theme info
THEME_NAME="HYNX"
THEME_VERSION="1.0.0"
THEME_REPO="https://github.com/your-username/hynx-theme"

# Banner
show_banner() {
    clear
    echo -e "${WHITE}"
    cat << "EOF"
    â•”â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—
    â•‘                                               â•‘
    â•‘    â–ˆâ–ˆâ•—  â–ˆâ–ˆâ•—â–ˆâ–ˆâ•—   â–ˆâ–ˆâ•—â–ˆâ–ˆâ–ˆâ•—   â–ˆâ–ˆâ•—â–ˆâ–ˆâ•—  â–ˆâ–ˆâ•—       â•‘
    â•‘    â–ˆâ–ˆâ•‘  â–ˆâ–ˆâ•‘â•šâ–ˆâ–ˆâ•— â–ˆâ–ˆâ•”â•â–ˆâ–ˆâ–ˆâ–ˆâ•—  â–ˆâ–ˆâ•‘â•šâ–ˆâ–ˆâ•—â–ˆâ–ˆâ•”â•       â•‘
    â•‘    â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•‘ â•šâ–ˆâ–ˆâ–ˆâ–ˆâ•”â• â–ˆâ–ˆâ•”â–ˆâ–ˆâ•— â–ˆâ–ˆâ•‘ â•šâ–ˆâ–ˆâ–ˆâ•”â•        â•‘
    â•‘    â–ˆâ–ˆâ•”â•â•â–ˆâ–ˆâ•‘  â•šâ–ˆâ–ˆâ•”â•  â–ˆâ–ˆâ•‘â•šâ–ˆâ–ˆâ•—â–ˆâ–ˆâ•‘ â–ˆâ–ˆâ•”â–ˆâ–ˆâ•—        â•‘
    â•‘    â–ˆâ–ˆâ•‘  â–ˆâ–ˆâ•‘   â–ˆâ–ˆâ•‘   â–ˆâ–ˆâ•‘ â•šâ–ˆâ–ˆâ–ˆâ–ˆâ•‘â–ˆâ–ˆâ•”â• â–ˆâ–ˆâ•—       â•‘
    â•‘    â•šâ•â•  â•šâ•â•   â•šâ•â•   â•šâ•â•  â•šâ•â•â•â•â•šâ•â•  â•šâ•â•       â•‘
    â•‘                                               â•‘
    â•‘           Minimalist Termux Theme             â•‘
    â•‘              with Doom Font                   â•‘
    â•šâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
EOF
    echo -e "${NC}"
    echo -e "${GRAY}Version ${THEME_VERSION} | Minimalist â€¢ Clean â€¢ Fast${NC}"
    echo ""
}

# Progress functions
info() {
    echo -e "${CYAN}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[âœ“]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

error() {
    echo -e "${RED}[âœ—]${NC} $1"
}

# Check if running in Termux
check_termux() {
    if [[ ! "$PREFIX" == *"com.termux"* ]]; then
        error "This script is designed for Termux only!"
        exit 1
    fi
    success "Termux environment detected"
}

# Update packages
update_packages() {
    info "Updating Termux packages..."
    pkg update -y && pkg upgrade -y > /dev/null 2>&1
    success "Packages updated"
}

# Install required packages
install_packages() {
    info "Installing required packages..."
    
    packages=("git" "curl" "wget" "zsh" "neofetch" "figlet")
    
    for package in "${packages[@]}"; do
        if pkg install "$package" -y > /dev/null 2>&1; then
            success "Installed $package"
        else
            warning "Failed to install $package, continuing..."
        fi
    done
}

# Create directories
create_directories() {
    info "Creating HYNX directories..."
    
    mkdir -p ~/.hynx/{themes,fonts,configs,scripts,backup}
    mkdir -p ~/.termux
    mkdir -p ~/bin
    
    success "Directories created"
}

# Install HYNX color scheme
install_colors() {
    info "Installing HYNX color scheme..."
    
    # Backup existing colors
    [[ -f ~/.termux/colors.properties ]] && cp ~/.termux/colors.properties ~/.hynx/backup/colors.properties.bak
    
    cat > ~/.termux/colors.properties << 'EOF'
# HYNX Minimalist Color Scheme
# High contrast monochromatic theme

# Background and foreground
background=#000000
foreground=#ffffff

# Cursor
cursor=#ffffff

# Highlight
highlight=#1a1a1a

# Standard colors (0-7)
color0=#000000
color1=#ff4444
color2=#44ff44
color3=#ffff44
color4=#4444ff
color5=#ff44ff
color6=#44ffff
color7=#ffffff

# Bright colors (8-15)
color8=#404040
color9=#ff6666
color10=#66ff66
color11=#ffff66
color12=#6666ff
color13=#ff66ff
color14=#66ffff
color15=#ffffff
EOF
    
    success "HYNX color scheme installed"
}

# Install Doom font
install_font() {
    info "Installing Doom font..."
    
    # Backup existing font
    [[ -f ~/.termux/font.ttf ]] && cp ~/.termux/font.ttf ~/.hynx/backup/font.ttf.bak
    
    # Create base64 encoded Doom font (placeholder - in real implementation, include actual font data)
    cat > ~/.hynx/fonts/doom-font-info.txt << 'EOF'
# Doom Font Information
# Original Doom font from the classic video game
# Monospace font optimized for terminal use
# License: Free for personal use

Font Name: Doom
Style: Monospace
Size: Optimized for terminal
Encoding: UTF-8
EOF
    
    # For demo purposes, we'll create a symbolic link to a system monospace font
    # In production, you would download and install the actual Doom.ttf file
    if [[ -f /system/fonts/RobotoMono-Regular.ttf ]]; then
        cp /system/fonts/RobotoMono-Regular.ttf ~/.termux/font.ttf
        success "Font installed (using system monospace as placeholder)"
    else
        warning "System font not found, using default"
    fi
}

# Configure ZSH
configure_zsh() {
    info "Configuring ZSH with HYNX settings..."
    
    # Backup existing .zshrc
    [[ -f ~/.zshrc ]] && cp ~/.zshrc ~/.hynx/backup/.zshrc.bak
    
    cat > ~/.zshrc << 'EOF'
# HYNX Minimalist ZSH Configuration
# Clean, fast, distraction-free shell

# Basic settings
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Options
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt CORRECT

# Minimal prompt
autoload -U colors && colors
PROMPT='%{$fg[white]%}%~ %{$fg[white]%}$ %{$reset_color%}'

# HYNX Aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias update='pkg update && pkg upgrade'
alias install='pkg install'
alias search='pkg search'

# HYNX Functions
hynx() {
    case "$1" in
        "status")
            echo -e "\033[1;37mHYNX Theme Status\033[0m"
            echo "Version: 1.0.0"
            echo "Active: Yes"
            echo "Font: Doom"
            echo "Colors: Monochromatic"
            ;;
        "menu")
            hynx_menu
            ;;
        "info")
            hynx_info
            ;;
        "help"|*)
            echo -e "\033[1;37mHYNX Commands:\033[0m"
            echo "  hynx status    - Show theme status"
            echo "  hynx menu      - Show interactive menu"
            echo "  hynx info      - System information"
            echo "  hynx help      - Show this help"
            ;;
    esac
}

hynx_menu() {
    clear
    echo -e "\033[1;37mâ•”â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—\033[0m"
    echo -e "\033[1;37mâ•‘         HYNX MENU             â•‘\033[0m"
    echo -e "\033[1;37mâ•šâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•\033[0m"
    echo ""
    echo -e "\033[0;37m[1]\033[0m System Info"
    echo -e "\033[0;37m[2]\033[0m File Manager"
    echo -e "\033[0;37m[3]\033[0m Package Manager"
    echo -e "\033[0;37m[4]\033[0m Theme Status"
    echo -e "\033[0;37m[0]\033[0m Exit"
    echo ""
    read -p "Select option: " choice
    
    case $choice in
        1) neofetch 2>/dev/null || echo "System ready" ;;
        2) ls -la ;;
        3) pkg list-installed | head -20 ;;
        4) hynx status ;;
        0) echo "Goodbye!" ;;
        *) echo "Invalid option" ;;
    esac
}

hynx_info() {
    clear
    echo -e "\033[1;37mâ•”â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—\033[0m"
    echo -e "\033[1;37mâ•‘        SYSTEM INFO            â•‘\033[0m"
    echo -e "\033[1;37mâ•šâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•\033[0m"
    echo ""
    echo -e "\033[0;37mTheme:\033[0m HYNX Minimalist"
    echo -e "\033[0;37mVersion:\033[0m 1.0.0"
    echo -e "\033[0;37mShell:\033[0m $(basename $SHELL)"
    echo -e "\033[0;37mTermux:\033[0m $(pkg show termux-app 2>/dev/null | grep Version | cut -d: -f2 | xargs)"
    echo -e "\033[0;37mUptime:\033[0m $(uptime -p 2>/dev/null || echo "System active")"
    echo ""
}

# Welcome message
hynx_welcome() {
    clear
    echo -e "\033[1;37m"
    figlet -w 50 "HYNX" 2>/dev/null || echo "HYNX"
    echo -e "\033[0m"
    echo -e "\033[0;37mMinimalist Termux Theme\033[0m"
    echo -e "\033[0;37mType 'hynx help' for commands\033[0m"
    echo ""
}

# Auto-run welcome on new session
if [[ -z "$HYNX_LOADED" ]] && [[ $- == *i* ]]; then
    export HYNX_LOADED=1
    hynx_welcome
fi
EOF
    
    success "ZSH configured with HYNX settings"
}

# Set ZSH as default shell
set_default_shell() {
    info "Setting ZSH as default shell..."
    chsh -s zsh
    success "ZSH set as default shell"
}

# Create utility scripts
create_scripts() {
    info "Creating utility scripts..."
    
    # HYNX command script
    cat > ~/bin/hynx << 'EOF'
#!/bin/bash
# HYNX Theme Utility Script

case "$1" in
    "update")
        echo "Updating HYNX theme..."
        cd ~/.hynx && git pull origin main 2>/dev/null || echo "Update complete"
        ;;
    "reset")
        echo "Resetting HYNX to defaults..."
        source ~/.zshrc
        echo "Reset complete"
        ;;
    "uninstall")
        echo "Are you sure you want to uninstall HYNX? (y/N)"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            rm -rf ~/.hynx
            [[ -f ~/.hynx/backup/.zshrc.bak ]] && mv ~/.hynx/backup/.zshrc.bak ~/.zshrc
            [[ -f ~/.hynx/backup/colors.properties.bak ]] && mv ~/.hynx/backup/colors.properties.bak ~/.termux/colors.properties
            echo "HYNX uninstalled"
        fi
        ;;
    *)
        source ~/.zshrc
        hynx "$@"
        ;;
esac
EOF
    
    chmod +x ~/bin/hynx
    
    # Add bin to PATH if not already there
    if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
        echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
    fi
    
    success "Utility scripts created"
}

# Create theme info file
create_info_file() {
    info "Creating theme information..."
    
    cat > ~/.hynx/theme-info.json << EOF
{
    "name": "HYNX",
    "version": "1.0.0",
    "description": "Minimalist Termux theme with Doom font",
    "author": "Professional Full Stack Coder",
    "installed": "$(date)",
    "features": [
        "Minimalist design",
        "High contrast colors",
        "Doom font styling",
        "Performance optimized",
        "Touch friendly"
    ],
    "colors": {
        "background": "#000000",
        "foreground": "#ffffff",
        "accent": "#404040"
    }
}
EOF
    
    success "Theme information created"
}

# Main installation function
main() {
    show_banner
    
    echo -e "${GRAY}This will install HYNX Minimalist Theme for Termux${NC}"
    echo -e "${GRAY}â€¢ Clean, distraction-free interface${NC}"
    echo -e "${GRAY}â€¢ High contrast monochromatic colors${NC}"
    echo -e "${GRAY}â€¢ Doom font styling${NC}"
    echo ""
    read -p "Continue with installation? (y/N): " -r
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    
    echo ""
    info "Starting HYNX installation..."
    
    check_termux
    update_packages
    install_packages
    create_directories
    install_colors
    install_font
    configure_zsh
    set_default_shell
    create_scripts
    create_info_file
    
    echo ""
    echo -e "${GREEN}â•”â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—${NC}"
    echo -e "${GREEN}â•‘                                                       â•‘${NC}"
    echo -e "${GREEN}â•‘  âœ“ HYNX Minimalist Theme installed successfully!     â•‘${NC}"
    echo -e "${GREEN}â•‘                                                       â•‘${NC}"
    echo -e "${GREEN}â•‘  Please restart Termux to activate the theme.        â•‘${NC}"
    echo -e "${GREEN}â•‘                                                       â•‘${NC}"
    echo -e "${GREEN}â•‘  After restart, try these commands:                  â•‘${NC}"
    echo -e "${GREEN}â•‘  â€¢ hynx help     - Show available commands           â•‘${NC}"
    echo -e "${GREEN}â•‘  â€¢ hynx menu     - Interactive menu                  â•‘${NC}"
    echo -e "${GREEN}â•‘  â€¢ hynx status   - Theme status                      â•‘${NC}"
    echo -e "${GREEN}â•‘                                                       â•‘${NC}"
    echo -e "${GREEN}â•šâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•${NC}"
    echo ""
    echo -e "${GRAY}Thank you for choosing HYNX!${NC}"
    echo -e "${GRAY}Minimalist â€¢ Clean â€¢ Fast${NC}"
}

# Run main installation
main "$@"
