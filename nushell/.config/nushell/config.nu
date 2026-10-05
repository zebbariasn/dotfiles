# Nushell config. Docs: https://www.nushell.sh/book/configuration.html
# Aliases that depend on tools loaded later (zoxide) live in autoload/.

$env.config.show_banner = false

# Vi mode, cursor changes shape like in nvim (Esc = normal, i = insert)
$env.config.edit_mode = "vi"
$env.config.cursor_shape = {
  vi_insert: line
  vi_normal: block
  emacs: line
}

$env.config.history.file_format = "sqlite"
$env.config.history.max_size = 100_000
$env.config.completions.algorithm = "fuzzy"
$env.config.table.mode = "rounded"
$env.config.footer_mode = "auto"

# Git
alias g = git
alias gcm = git commit -m
alias gcam = git commit -a -m
alias gcad = git commit -a --amend

# Tools
alias d = docker
alias cls = clear
alias lt = eza --tree --level=2 --long --icons --git
alias lta = eza --tree --level=2 --long --icons --git -a
alias ff = fzf --preview "bat --style=numbers --color=always {}"
alias cx = claude --permission-mode auto

# nvim: `n` opens the current dir, `nvc` uses the .NET profile
def --wrapped n [...args] {
  if ($args | is-empty) { ^nvim . } else { ^nvim ...$args }
}

def --wrapped nvc [...args] {
  with-env { NVIM_APPNAME: "nvim-dotnet" } {
    if ($args | is-empty) { ^nvim . } else { ^nvim ...$args }
  }
}

# Open a file picked with fzf in nvim
def eff [] {
  let file = (ff | str trim)
  if ($file | is-not-empty) { ^nvim $file }
}

# Open nvim straight into the database UI (dadbod)
def ndb [] {
  ^nvim +DBUI
}
