# macOS Setup Scripts

Heavily inspired by [this repo](https://github.com/JJGO/macOS-setup)

This repository contains Ansible-based automation scripts to configure a fresh macOS installation with development tools, applications, and system preferences optimized for productivity and development work.

## Features

- **Software Management**: Installs 400+ packages, applications, and tools via Homebrew
- **System Configuration**: Automates macOS system preferences and settings
- **Development Environment**: Sets up complete development stack with languages, tools, and IDEs
- **Window Management**: Configures yabai tiling window manager
- **Productivity Apps**: Installs and configures productivity applications
- **VS Code Extensions**: Automatically installs essential VS Code extensions

## What Gets Installed

### Development Tools
- Languages: Python (pyenv), Node.js (fnm), Go, Rust, Java tools
- Editors: VS Code, Neovim, Vim
- Terminals: iTerm2, Alacritty, Ghostty, Warp
- Version Control: Git, GitHub CLI
- Cloud Tools: AWS CLI, kubectl, k9s, Terraform

### Modern CLI Tools
- File management: `exa`, `bat`, `fd`, `ripgrep`, `fzf`
- System monitoring: `htop`, `bottom`
- Network tools: `httpie`, `curl`, `wget`
- Text processing: `jq`, `yq`, `pandoc`

### Applications
- Browsers: Firefox, Chrome, Brave
- Communication: Slack, Discord, Signal
- Productivity: Raycast, Alfred, Notion, Obsidian
- Media: VLC, Spotify
- Development: Docker, Postman, DBeaver

### System Optimizations
- Dock configuration and animations
- Finder preferences
- Keyboard and trackpad settings
- Energy management
- Security and privacy settings

## Usage

### Initial Setup (First-time use)
```bash
make init
```
This runs the bootstrap script which:
- Installs Xcode command line tools
- Installs Homebrew
- Installs Ansible
- Sets up initial system configurations

### Main Setup (Subsequent runs)
```bash
make main
```
Executes the main Ansible playbook with logging

### Direct Execution
```bash
./ansible-wrapper.sh
```
Runs the Ansible playbook directly with system sleep prevention and logging

## Structure

- `main.yml` - Main Ansible playbook
- `files/Brewfile` - Homebrew bundle file with all packages
- `tasks/` - Ansible task modules
- `scripts/` - Shell scripts for system configuration
- `ansible-wrapper.sh` - Execution wrapper with logging

## Customization

1. **Software**: Edit `files/Brewfile` to add/remove packages
2. **System Settings**: Modify `scripts/macos-settings.sh`
3. **Applications**: Update task files in `tasks/` directory

## Requirements

- macOS 12.0+ (tested on macOS 15.6)
- Admin privileges for system modifications
- Internet connection for downloads

## Notes

- All operations are logged to `/tmp/mac-ansible.log`
- The setup prevents system sleep during long installations
- Sudo privileges are maintained throughout execution
- Safe to run multiple times (idempotent operations)

