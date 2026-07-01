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
nvim/.config/nvim/
├── init.lua
└── lua/zebb/
    ├── core/
    │   ├── keymaps.lua    # atajos de teclado globales
    │   └── options.lua    # opciones de vim
    ├── lazy.lua           # bootstrap de lazy.nvim
    ├── lsp.lua            # configuración base de LSP
    └── plugins/
        ├── lsp/
        │   ├── mason.lua      # instalador de servidores LSP
        │   └── lspconfig.lua  # capacidades LSP + autocompletado
        └── *.lua              # un archivo por plugin
```

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

### LSP y herramientas (via Mason)

**Servidores LSP:** `ts_ls`, `html`, `cssls`, `tailwindcss`, `svelte`, `lua_ls`, `graphql`, `emmet_ls`, `prismals`, `pyright`, `eslint`

**Formatters:** `prettier`, `stylua`, `isort`, `black`, `eslint_d`

**Linters:** `pylint`

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

> Los atajos específicos de cada plugin están documentados en sus respectivos archivos dentro de `lua/zebb/plugins/`.
