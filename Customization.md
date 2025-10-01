# Customization Guide

This guide explains how to customize your HYNX theme to match your preferences.

## Color Customization

### Editing Colors

The main color configuration is stored in `~/.termux/colors.properties`. You can edit this file to change colors:

```bash
nano ~/.termux/colors.properties
```

### Color Palette Structure

HYNX uses a 16-color palette:

- **Colors 0-7**: Standard colors (black, red, green, yellow, blue, magenta, cyan, white)
- **Colors 8-15**: Bright variants of the standard colors

### Example Customizations

**Blue Accent Theme:**
```properties
color4=#0066ff  # Blue
color12=#3399ff # Bright Blue
```

**Green Accent Theme:**
```properties  
color2=#00ff66  # Green
color10=#33ff88 # Bright Green
```

## Font Customization

### Installing Custom Fonts

1. Download a TTF font file
2. Copy it to `~/.termux/font.ttf`
3. Reload Termux settings

```bash
# Example: Installing JetBrains Mono
wget https://github.com/JetBrains/JetBrainsMono/raw/master/fonts/ttf/JetBrainsMono-Regular.ttf
mv JetBrainsMono-Regular.ttf ~/.termux/font.ttf
termux-reload-settings
```

### Recommended Fonts

- **JetBrains Mono**: Modern coding font
- **Fira Code**: Font with programming ligatures  
- **Source Code Pro**: Adobe's monospace font
- **Hack**: Designed specifically for terminals

## Prompt Customization

### Editing the Prompt

The prompt is configured in `~/.zshrc`. Look for the `PROMPT` variable:

```bash
# Current minimal prompt
PROMPT='%{$fg[white]%}%~ %{$fg[white]%}$ %{$reset_color%}'

# Alternative prompts
PROMPT='%{$fg[cyan]%}%n@%m %{$fg[white]%}%~ %{$fg[white]%}$ %{$reset_color%}'  # With username
PROMPT='%{$fg[white]%}[%~] %{$fg[green]%}→ %{$reset_color%}'                   # With brackets
PROMPT='%{$fg[gray]%}%D{%H:%M} %{$fg[white]%}%~ %{$fg[white]%}$ %{$reset_color%}' # With time
```

### Prompt Elements

- `%n` - Username
- `%m` - Machine name  
- `%~` - Current directory (with ~ for home)
- `%D{format}` - Date/time
- `%?` - Exit code of last command

## Advanced Customization

### Custom Functions

Add custom functions to your `~/.zshrc`:

```bash
# Custom system info
myinfo() {
    echo "System: $(uname -a)"
    echo "Uptime: $(uptime -p)"
    echo "Memory: $(free -h | awk 'NR==2{print $3"/"$2}')"
}

# Quick navigation
home() { cd ~ }
downloads() { cd ~/downloads }
projects() { cd ~/projects }
```

### Aliases

Customize your aliases in `~/.zshrc`:

```bash
# File operations
alias mv='mv -i'          # Interactive move
alias cp='cp -i'          # Interactive copy
alias rm='rm -i'          # Interactive remove

# Git shortcuts
alias gst='git status'
alias gad='git add .'
alias gcm='git commit -m'
alias gps='git push'
alias gpl='git pull'

# System shortcuts
alias reload='source ~/.zshrc'
alias edit='nano ~/.zshrc'
alias colors='nano ~/.termux/colors.properties'
```

### Key Bindings

Add custom key bindings:

```bash
# Ctrl+E to edit current command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

# Alt+. to insert last argument
bindkey "^[." insert-last-word
```

## Theme Variants

### Creating Variants

You can create multiple color schemes:

```bash
# Save current colors
cp ~/.termux/colors.properties ~/.hynx/themes/hynx-default.properties

# Create a variant
cp ~/.termux/colors.properties ~/.hynx/themes/hynx-blue.properties
nano ~/.hynx/themes/hynx-blue.properties  # Edit colors

# Switch themes
cp ~/.hynx/themes/hynx-blue.properties ~/.termux/colors.properties
termux-reload-settings
```

### Theme Switcher Function

Add this to your `~/.zshrc`:

```bash
switch_theme() {
    if [[ -f ~/.hynx/themes/hynx-$1.properties ]]; then
        cp ~/.hynx/themes/hynx-$1.properties ~/.termux/colors.properties
        termux-reload-settings
        echo "Switched to theme: $1"
    else
        echo "Theme not found: $1"
        echo "Available themes:"
        ls ~/.hynx/themes/
    fi
}
```

Usage: `switch_theme blue`

## Environment Variables

### Useful Variables

```bash
# Set default editor
export EDITOR=nano

# Add custom paths
export PATH="$HOME/.local/bin:$PATH"

# Set language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# History settings
export HISTSIZE=10000
export HISTFILESIZE=10000
```

## Troubleshooting

### Colors Not Working

```bash
# Check color support
echo $TERM
tput colors

# Reset colors
hynx reset
```

### Font Not Loading

```bash
# Check font file
ls -la ~/.termux/font.ttf

# Reset font
rm ~/.termux/font.ttf
termux-reload-settings
```

### Prompt Issues

```bash
# Reset prompt
unset PROMPT
source ~/.zshrc
```

## Backup and Restore

### Creating Backups

```bash
# Backup current configuration
mkdir -p ~/.hynx/backup/$(date +%Y%m%d)
cp ~/.zshrc ~/.hynx/backup/$(date +%Y%m%d)/
cp ~/.termux/colors.properties ~/.hynx/backup/$(date +%Y%m%d)/
cp ~/.termux/font.ttf ~/.hynx/backup/$(date +%Y%m%d)/ 2>/dev/null || true
```

### Restoring Backups

```bash
# List backups
ls ~/.hynx/backup/

# Restore from specific date
cp ~/.hynx/backup/20231201/.zshrc ~/
cp ~/.hynx/backup/20231201/colors.properties ~/.termux/
termux-reload-settings
```

## Contributing Custom Themes

If you create a great theme variant, consider contributing it:

1. Fork the HYNX repository
2. Add your theme to `themes/variants/`
3. Update documentation
4. Submit a pull request

---

*For more help, run `hynx help` or visit the [HYNX GitHub repository](https://github.com/your-username/hynx-theme)*