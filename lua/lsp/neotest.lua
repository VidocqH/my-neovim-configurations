require("neotest").setup({
  adapters = {
    require("neotest-python"),
    require("neotest-vim-test")({ ignore_filetypes = {"python"} }),
  }
})

