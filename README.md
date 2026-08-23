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
│   ├── darwin/
│   │   └── default.nix # nix-darwin configuration (system + Homebrew casks)
│   └── home/
│       ├── default.nix # Home Manager packages
│       ├── zsh.nix      # Zsh configuration
│       └── zellij.nix   # Zellij configuration
├── .config/nvim/         # Neovim configuration (only editor in use)
├── .config/              # Other XDG config files (ghostty, zellij, ...)
├── .gemrc                # RubyGems config (used by macOS's system Ruby)
└── ...
```

## What's Included

### Nix-Darwin

- macOS system defaults
- Homebrew casks for GUI apps (declared in `nix/darwin/default.nix`, installed via `brew bundle`) — Homebrew is not used for CLI formulae, only casks
- Touch ID for `sudo` authentication
- Nerd Font (JetBrainsMono, matching the Ghostty font)
- User shell configuration (zsh)

### Home Manager

- CLI tools (terraform, node, rust toolchain, gh, ghq, neovim, etc.)
- Shell: zsh
- Terminal multiplexer: zellij
- Git configuration