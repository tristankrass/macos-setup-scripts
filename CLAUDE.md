# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a macOS setup automation repository that uses Ansible to configure a fresh macOS installation. It installs software via Homebrew, configures system settings, and sets up development tools.

## Key Commands

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
Executes the main Ansible playbook via `ansible-wrapper.sh`

### Direct Ansible Execution
```bash
./ansible-wrapper.sh
```
Runs the main Ansible playbook with proper logging and system management (prevents sleep, maintains sudo privileges)

## Architecture

### Core Structure
- **main.yml**: Main Ansible playbook that orchestrates all setup tasks
- **tasks/**: Ansible task modules for different setup categories:
  - `software.yml`: Homebrew package installation and shell configuration
  - `dock.yml`: macOS Dock customization
  - `dotfiles.yml`: Dotfiles management
  - `shell.yml`: Shell configuration
- **files/Brewfile**: Homebrew bundle file defining all packages, casks, and Mac App Store apps to install
- **scripts/**: Shell scripts for system configuration:
  - `bootstrap.sh`: Initial system setup and dependency installation
  - `macos-settings.sh`: macOS system preferences configuration
  - `app-settings.sh`: Application-specific settings

### Execution Flow
1. `make init` → `scripts/bootstrap.sh` (first-time setup)
2. `make main` → `ansible-wrapper.sh` → `main.yml` → tasks modules

### Key Features
- **Software Management**: Uses Homebrew Bundle (Brewfile) for declarative package management
- **System Configuration**: Automated macOS system preferences via shell scripts
- **Logging**: All output is logged to `/tmp/mac-ansible.log` during execution
- **Sleep Prevention**: Uses `caffeinate` to prevent system sleep during long installations
- **Privilege Management**: Maintains sudo privileges throughout execution

### Configuration Files
- **ansible.cfg**: Ansible configuration with YAML output formatting
- **local.inventory**: Local Ansible inventory file
- **Makefile**: Simple interface for common operations

## Development Notes
- All Ansible tasks run on localhost with no remote connections
- The repository expects to be run from `/macos-setup-scripts` directory (enforced by main.yml)
- Modifications to software installations should be made in `files/Brewfile`
- System preference changes should be added to `scripts/macos-settings.sh`