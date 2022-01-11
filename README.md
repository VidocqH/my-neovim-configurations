```bash
brew install neovim
brew install rust
```

Install `Packer` as neovim package manager

Copy all the files to `~/.config/nvim` (If things correct, `init.lua` path should be `~/.config/nvim/init.lua`)

Comment all the lines except `require 'plugins'` in `init.lua`

Run Neovim and type

```
:PackerSync
```

Decomment all the lines in `init.lua`

### Files recommend looking at

+ `lua/lsp/setup.lua`
    Use `:LspInstallInfo` to check and `:LspInstall <language>` to install LSP. After installation, you need to add it in `lua/lsp/setup.lua`

+ Use `:TSInstall <language>` to enable Treesitter highlighting.
