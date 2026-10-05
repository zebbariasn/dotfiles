# dotfiles

Mis configuraciones personales gestionadas con [GNU Stow](https://www.gnu.org/software/stow/).

## Instalación

```bash
git clone https://github.com/zebbariasn/dotfiles ~/.dotfiles
cd ~/.dotfiles
stow nvim
```

Stow crea los symlinks necesarios apuntando a `~/.config/nvim`.

---

## Neovim

Configuración modular basada en [lazy.nvim](https://github.com/folke/lazy.nvim) como gestor de plugins.

### Requisitos

- Neovim >= 0.10
- [Nerd Font](https://www.nerdfonts.com/) (para íconos)
- `git`, `make`, `node`, `python3`

### Estructura

```
nvim/.config/
├── nvim/
│   ├── init.lua
│   └── lua/zebb/
│       ├── core/
│       │   ├── keymaps.lua    # atajos de teclado globales
│       │   └── options.lua    # opciones de vim
│       ├── lazy.lua           # bootstrap de lazy.nvim
│       ├── lsp.lua            # configuración base de LSP
│       ├── profile.lua        # detecta el perfil activo
│       ├── plugins/           # comunes a todos los perfiles
│       │   ├── lsp/
│       │   │   ├── mason.lua      # instalador de servidores LSP
│       │   │   └── lspconfig.lua  # capacidades LSP + autocompletado
│       │   └── *.lua              # un archivo por plugin
│       └── profiles/
│           ├── web/           # perfil por defecto
│           │   ├── init.lua   # LSPs, tools, parsers, formatters, linters
│           │   └── plugins/   # plugins solo de este perfil
│           └── dotnet/
└── nvim-dotnet -> nvim        # mismo código, otro perfil
```

### Perfiles

Un solo código, varios perfiles vía `NVIM_APPNAME`. Cada perfil tiene sus propios
plugins, herramientas de Mason y estado (`~/.local/share/<appname>`).

| Comando | Perfil |
|---|---|
| `nvim` | `web` (por defecto) |
| `NVIM_APPNAME=nvim-dotnet nvim` | `dotnet` |

`profiles/<nombre>/init.lua` devuelve las listas que se suman a las comunes:
`lsp`, `tools`, `parsers`, `formatters`, `linters`. Los plugins extra van en
`profiles/<nombre>/plugins/` (opcional).

Nuevo perfil: crear `profiles/<nombre>/init.lua` y el enlace
`ln -s nvim nvim/.config/nvim-<nombre>`, luego `stow -R nvim`.

### Plugins principales

| Categoría | Plugin |
|---|---|
| Gestor de plugins | [lazy.nvim](https://github.com/folke/lazy.nvim) |
| Colorscheme | [aether.nvim](https://github.com/bjarneo/aether.nvim) |
| Explorador de archivos | [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) |
| Búsqueda | [Telescope](https://github.com/nvim-telescope/telescope.nvim) + fzf-native |
| Sintaxis | [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| Autocompletado | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) |
| Statusline | [lualine](https://github.com/nvim-lualine/lualine.nvim) |
| Bufferline | [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) (modo tabs) |
| Git | [gitsigns](https://github.com/lewis6991/gitsigns.nvim) + [lazygit](https://github.com/kdheepak/lazygit.nvim) |
| Diagnósticos | [trouble.nvim](https://github.com/folke/trouble.nvim) |
| Formateo | [conform.nvim](https://github.com/stevearc/conform.nvim) |
| Linting | [nvim-lint](https://github.com/mfussenegger/nvim-lint) |
| Dashboard | [alpha-nvim](https://github.com/goolord/alpha-nvim) |
| Sesiones | [auto-session](https://github.com/rmagatti/auto-session) |
| Which-key | [which-key.nvim](https://github.com/folke/which-key.nvim) |
| Bases de datos | [vim-dadbod](https://github.com/tpope/vim-dadbod) + [dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) + [completion](https://github.com/kristijanhusak/vim-dadbod-completion) |

### LSP y herramientas (via Mason)

**Comunes:** `lua_ls`, `stylua`

**Perfil web:** `ts_ls`, `html`, `cssls`, `tailwindcss`, `svelte`, `graphql`,
`emmet_ls`, `prismals`, `pyright`, `eslint` · formatters `prettier`, `isort`,
`black`, `eslint_d` · linter `pylint`

### Atajos de teclado

`<leader>` = `Space`

| Atajo | Acción |
|---|---|
| `jk` | Salir del modo inserción |
| `<leader>nh` | Limpiar highlights de búsqueda |
| `<leader>+` / `<leader>-` | Incrementar / decrementar número |
| **Splits** | |
| `<leader>sv` | Split vertical |
| `<leader>sh` | Split horizontal |
| `<leader>se` | Igualar tamaño de splits |
| `<leader>sx` | Cerrar split actual |
| **Tabs** | |
| `<leader>to` | Abrir nueva tab |
| `<leader>tx` | Cerrar tab actual |
| `<leader>tn` / `<leader>tp` | Siguiente / anterior tab |
| `<leader>tf` | Abrir buffer actual en nueva tab |
| **Bases de datos** | |
| `<leader>qq` | Abrir/cerrar panel de bases de datos |
| `<leader>qa` | Agregar conexión |
| `<leader>qf` | Buscar buffer de query en el panel |

> Los atajos específicos de cada plugin están documentados en sus respectivos archivos dentro de `lua/zebb/plugins/`.
