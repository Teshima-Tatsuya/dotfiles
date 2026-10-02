{ self, pkgs, lib, ... }:

let
    # Same hooks `git secrets --install` writes. Declared directly because
    # git-secrets 1.3.0's --install exits non-zero (calls an undefined `say`),
    # which aborts Home Manager activation.
    hooks = {
        "commit-msg" = "commit_msg_hook";
        "pre-commit" = "pre_commit_hook";
        "prepare-commit-msg" = "prepare_commit_msg_hook";
    };
in
{
    home.packages = [ pkgs.git-secrets ];  # moved off brew

    # Read-only store copies on purpose: `git config --global` must not write
    # into this public repo. Machine/identity settings (user, signing) go in
    # ~/.gitconfig.local, which .gitconfig includes.
    home.file = {
        ".gitconfig".source = "${self}/.gitconfig";
        ".gitignore_global".source = "${self}/.gitignore_global";
    } // lib.mapAttrs' (hook: cmd:
        # init.templatedir in .gitconfig points here, so every new
        # clone/init gets the git-secrets hooks.
        lib.nameValuePair ".git-templates/git-secrets/hooks/${hook}" {
            executable = true;
            text = ''
                #!/usr/bin/env bash
                git secrets --${cmd} -- "$@"
            '';
        }) hooks;
}
