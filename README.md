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

Clone into the [ghq](https://github.com/x-motemen/ghq)-style path (`~/src/github.com/<owner>/<repo>`). ghq itself is installed later by Home Manager, so use plain `git` for this first clone:

```bash
git clone https://github.com/Teshima-Tatsuya/dotfiles.git ~/src/github.com/Teshima-Tatsuya/dotfiles
cd ~/src/github.com/Teshima-Tatsuya/dotfiles
```

Once ghq is available, other repositories can be fetched with `ghq get <owner>/<repo>` (root: `~/src`).

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

## Not Managed by Nix

### Claude Code Remote Control server (Linux / LXC)

`.config/systemd/user/claude-remote-control-server.service` keeps `claude remote-control` running as a systemd **user** service, so sessions created from claude.ai/code or the Claude mobile app are accepted. Nix does not manage it; restore it by hand:

1. Prerequisites
   - Sign in once with `claude` (`/login`).
   - Trust the working directory once: `cd ~/src/github.com/Teshima-Tatsuya && claude`. The unit's `WorkingDirectory` must be a trusted workspace, otherwise the server exits with `Workspace not trusted`.
   - Login shell is zsh and `~/.config/op/claude-code-token` exists (`chmod 600`), so the unit's `zsh -lc` picks up `OP_SERVICE_ACCOUNT_TOKEN` via `~/.zshenv`.
2. Install and start

   ```bash
   mkdir -p ~/.config/systemd/user
   cp .config/systemd/user/claude-remote-control-server.service ~/.config/systemd/user/
   systemctl --user daemon-reload
   systemctl --user enable --now claude-remote-control-server.service
   sudo loginctl enable-linger "$USER"   # keep running after logout / start on boot
   ```

3. Check: `systemctl --user status claude-remote-control-server`. If `systemctl --user` fails with `Failed to connect to bus`, set `XDG_RUNTIME_DIR=/run/user/$(id -u)`.

The copy in this repository is a backup: after editing the live unit, copy it back here. Run only one `claude remote-control` server per machine (don't also add a system-level unit).