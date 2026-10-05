# Environment, mirroring Omarchy's bash setup ($OMARCHY_PATH/default/bash/envs).
# PATH (incl. mise shims and ~/.local/bin) already comes from the Hyprland session.

$env.EDITOR = ($env.EDITOR? | default "omarchy-launch-editor --inline")
$env.SUDO_EDITOR = $env.EDITOR
$env.BROWSER = ($env.BROWSER? | default "omarchy-launch-browser")
$env.BAT_THEME = "ansi"
$env.MANROFFOPT = "-c"
$env.MANPAGER = "sh -c 'col -bx | bat -l man -p'"

# ssh-agent socket (systemd user unit), also set for the Hyprland session
$env.SSH_AUTH_SOCK = ($env.SSH_AUTH_SOCK? | default $"($env.XDG_RUNTIME_DIR)/ssh-agent.socket")

# Generate init scripts for external tools into the vendor autoload dir
# (loaded automatically after config.nu, kept out of the dotfiles repo).
let autoload = ($nu.data-dir | path join "vendor/autoload")
mkdir $autoload

if (which starship | is-not-empty) {
  starship init nu | save -f ($autoload | path join "starship.nu")
}

if (which zoxide | is-not-empty) {
  zoxide init nushell | save -f ($autoload | path join "zoxide.nu")
}

if (which carapace | is-not-empty) {
  $env.CARAPACE_BRIDGES = "zsh,fish,bash"
  carapace _carapace nushell | save -f ($autoload | path join "carapace.nu")
}
