# HYNX - Minimalist Termux Theme

**A clean, minimal terminal theme for Termux with Doom font styling**

![HYNX Theme Preview](https://img.shields.io/badge/theme-HYNX-000000?style=for-the-badge&logo=terminal)
![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)
![Platform](https://img.shields.io/badge/platform-Termux-green?style=for-the-badge)

## ðŸŽ¨ About

HYNX is a minimalist terminal theme designed for Termux that emphasizes clean aesthetics, readability, and distraction-free computing. Inspired by modern dark themes with high contrast ratios and the iconic Doom font styling.

### Key Features

- **Minimalist Design**: Clean, distraction-free interface
- **High Contrast**: Excellent readability in all lighting conditions  
- **Doom Font**: Classic monospace font with gaming aesthetics
- **Performance Optimized**: Lightweight with fast rendering
- **Touch Friendly**: Optimized for mobile devices
- **Easy Installation**: One-command setup

## ðŸ“± Screenshots

```
â•”â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—
â•‘  ~ $ neofetch                        â•‘
â•‘  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â•‘
â•‘  â”‚ HYNX Theme Active               â”‚  â•‘
â•‘  â”‚ Minimalist â€¢ Clean â€¢ Fast       â”‚  â•‘
â•‘  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â•‘
â•‘  ~ $                                 â•‘
â•šâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
```

## ðŸš€ Quick Installation

### Automated Installation

```bash
curl -fsSL https://raw.githubusercontent.com/your-username/hynx-theme/main/install.sh | bash
```

### Manual Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/hynx-theme.git ~/.hynx
   cd ~/.hynx
   ```

2. **Run the installer**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Restart Termux** to apply changes

## ðŸŽ¨ Color Palette

The HYNX theme uses a carefully curated monochromatic palette:

| Color Name | Hex Code | Usage |
|------------|----------|--------|
| Deep Black | `#000000` | Background |
| Charcoal | `#1a1a1a` | Secondary background |
| Steel Gray | `#404040` | Comments, secondary text |
| Silver | `#808080` | Normal text |
| Pure White | `#ffffff` | Primary text, highlights |
| Error Red | `#ff4444` | Error messages |
| Success Green | `#44ff44` | Success messages |
| Warning Yellow | `#ffff44` | Warnings |

## ðŸ“ Repository Structure

```
hynx-theme/
â”œâ”€â”€ README.md                 # This file
â”œâ”€â”€ LICENSE                   # MIT License
â”œâ”€â”€ install.sh               # Automated installer
â”œâ”€â”€ uninstall.sh             # Uninstaller script
â”œâ”€â”€ themes/
â”‚   â”œâ”€â”€ colors.properties    # Termux color scheme
â”‚   â””â”€â”€ hynx-variants/       # Theme variations
â”œâ”€â”€ fonts/
â”‚   â”œâ”€â”€ DooM.ttf            # Doom font file
â”‚   â””â”€â”€ font-preview.png     # Font preview
â”œâ”€â”€ configs/
â”‚   â”œâ”€â”€ .zshrc              # ZSH configuration
â”‚   â”œâ”€â”€ .bashrc             # Bash configuration
â”‚   â””â”€â”€ .p10k.zsh           # PowerLevel10k config
â”œâ”€â”€ scripts/
â”‚   â”œâ”€â”€ hynx-menu.sh        # Theme menu system
â”‚   â”œâ”€â”€ system-info.sh      # Minimal system info
â”‚   â””â”€â”€ utilities.sh        # Helper functions
â”œâ”€â”€ docs/
â”‚   â”œâ”€â”€ customization.md    # Customization guide
â”‚   â”œâ”€â”€ troubleshooting.md  # Common issues
â”‚   â””â”€â”€ contributing.md     # Contribution guide
â””â”€â”€ extras/
    â”œâ”€â”€ wallpapers/         # Matching wallpapers
    â””â”€â”€ sounds/             # Optional sound effects
```

## âš™ï¸ Configuration Files

All configuration files are included and automatically installed:

- **Color Scheme**: Optimized for readability and minimal eye strain
- **Font Settings**: Doom font with proper spacing and rendering
- **Shell Integration**: Works with bash, zsh, and fish
- **Prompt Design**: Clean, information-dense prompt

## ðŸ› ï¸ Customization

### Changing Colors

Edit `~/.termux/colors.properties`:

```properties
# HYNX Base Colors
background=#000000
foreground=#ffffff
cursor=#ffffff

# Standard Colors (0-7)
color0=#000000
color1=#ff4444
color2=#44ff44
color3=#ffff44
color4=#4444ff
color5=#ff44ff
color6=#44ffff
color7=#ffffff

# Bright Colors (8-15)
color8=#404040
color9=#ff6666
color10=#66ff66
color11=#ffff66
color12=#6666ff
color13=#ff66ff
color14=#66ffff
color15=#ffffff
```

### Font Customization

The Doom font is automatically installed. To change fonts:

```bash
# List available fonts
hynx font list

# Change font
hynx font set <font-name>

# Reset to default
hynx font reset
```

## ðŸ“‹ Commands

HYNX includes several utility commands:

```bash
hynx status          # Show theme status
hynx menu           # Interactive menu
hynx update         # Update theme
hynx reset          # Reset to defaults
hynx uninstall      # Remove theme
hynx help           # Show help
```

## ðŸ”§ Advanced Usage

### Shell Integration

The theme works with multiple shells:

**ZSH** (Recommended)
```bash
# Auto-installed with Oh-My-ZSH integration
# Includes PowerLevel10k for enhanced prompts
```

**Bash**
```bash
# Lightweight configuration
# Minimal prompt with essential info
```

**Fish**
```bash
# Modern shell with smart completions
# Custom HYNX fish theme included
```

### System Monitoring

Built-in minimal system monitor:

```bash
hynx monitor         # Real-time system stats
hynx info           # System information
```

## ðŸŽ¯ Performance

HYNX is optimized for performance:

- **Startup Time**: < 0.5 seconds
- **Memory Usage**: < 10MB additional RAM
- **Battery Impact**: Minimal
- **Compatibility**: Android 7.0+

## ðŸ¤ Contributing

We welcome contributions! See [CONTRIBUTING.md](docs/contributing.md) for guidelines.

### Development Setup

```bash
git clone https://github.com/your-username/hynx-theme.git
cd hynx-theme
./scripts/dev-setup.sh
```

### Testing

```bash
# Run tests
./scripts/test.sh

# Test installation
./scripts/test-install.sh
```

## ðŸ“š Documentation

- [Customization Guide](docs/customization.md)
- [Troubleshooting](docs/troubleshooting.md)
- [API Reference](docs/api.md)
- [Theme Variants](docs/variants.md)

## ðŸ› Troubleshooting

### Common Issues

**Theme not loading**
```bash
# Reload Termux settings
termux-reload-settings

# Check configuration
hynx doctor
```

**Font issues**
```bash
# Reset font
hynx font reset

# Check font installation
ls ~/.termux/font.ttf
```

**Color problems**
```bash
# Verify color support
tput colors

# Reset colors
hynx colors reset
```

## ðŸ“„ License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ðŸ™ Acknowledgments

- **Doom Font**: Original Doom game franchise
- **Termux Team**: Amazing terminal emulator
- **Community**: Theme testing and feedback

## ðŸ“ž Support

- **Issues**: [GitHub Issues](https://github.com/WEB-SOUL819/hynx-os/issues)
- **Discussions**: [GitHub Discussions](https://github.com/WEB-SOUL819/hynx-os/discussions)
- **Email**: support@hynx-theme.com

## ðŸ”„ Changelog

### v1.0.0 (Latest)
- Initial release
- Doom font integration
- Minimalist color scheme
- Auto-installer
- Shell integration
- Documentation

---

**Made with â¤ï¸ for the Termux community**

*HYNX Theme - Where minimalism meets functionality*
