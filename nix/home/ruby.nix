{ self, ... }:

{
    # RubyGems config for macOS's system Ruby.
    home.file.".gemrc".source = "${self}/.gemrc";
}
