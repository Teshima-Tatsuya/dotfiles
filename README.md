# dotfiles

Personal dotfiles managed with Nix (nix-darwin + Home Manager).

## Requirements

- macOS (aarch64-darwin)
- [Nix](https://nixos.org/download.html) with flakes enabled

## Installation

### 1. Install Nix

```bash
curl -L https://nixos.org/nix/install | sh
```

### 2. Enable Flakes

Add to `~/.config/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

### 3. Clone this repository

```bash
git clone https://github.com/Teshima-Tatsuya/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 4. Apply configuration

```bash
darwin-rebuild switch --flake .#my-macbook
```

> Note: Use `--impure` flag if your configuration requires environment variables:
> ```bash
> darwin-rebuild switch --flake .#my-macbook --impure
> ```

## Usage

### Rebuild system

```bash
darwin-rebuild switch --flake .#my-macbook
```

### Update flake inputs

```bash
nix flake update
```

### Garbage collection

```bash
nix-collect-garbage -d
```

## Structure

```
.
├── flake.nix           # Flake configuration
├── flake.lock          # Locked dependencies
├── nix/
│   └── darwin/
│       └── default.nix # nix-darwin configuration
├── .zshrc              # Zsh configuration
├── .tmux.conf          # Tmux configuration
├── .vimrc              # Vim configuration
├── .config/            # XDG config files
└── ...
```

## What's Included

### Nix-Darwin

- System packages (tmux, etc.)
- macOS system defaults
- User shell configuration (zsh)

### Dotfiles

- Shell: zsh, bash
- Editor: vim
- Terminal: tmux
- Git configuration