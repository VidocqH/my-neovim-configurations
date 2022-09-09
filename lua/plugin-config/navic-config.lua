require('nvim-navic').setup {
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = ' ',
    Interface = ' ',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' '
  },
  highlight = true,
}

vim.cmd("highlight NavicIconsFile          guibg = #0d0d0d")
vim.cmd("highlight NavicIconsModule        guibg = #0d0d0d")
vim.cmd("highlight NavicIconsNamespace     guibg = #0d0d0d")
vim.cmd("highlight NavicIconsPackage       guibg = #0d0d0d")
vim.cmd("highlight NavicIconsClass         guibg = #0d0d0d")
vim.cmd("highlight NavicIconsMethod        guibg = #0d0d0d guifg = #579ad1")
vim.cmd("highlight NavicIconsProperty      guibg = #0d0d0d")
vim.cmd("highlight NavicIconsField         guibg = #0d0d0d")
vim.cmd("highlight NavicIconsConstructor   guibg = #0d0d0d")
vim.cmd("highlight NavicIconsEnum          guibg = #0d0d0d")
vim.cmd("highlight NavicIconsInterface     guibg = #0d0d0d")
vim.cmd("highlight NavicIconsFunction      guibg = #0d0d0d")
vim.cmd("highlight NavicIconsVariable      guibg = #0d0d0d")
vim.cmd("highlight NavicIconsConstant      guibg = #0d0d0d")
vim.cmd("highlight NavicIconsString        guibg = #0d0d0d")
vim.cmd("highlight NavicIconsNumber        guibg = #0d0d0d")
vim.cmd("highlight NavicIconsBoolean       guibg = #0d0d0d")
vim.cmd("highlight NavicIconsArray         guibg = #0d0d0d")
vim.cmd("highlight NavicIconsObject        guibg = #0d0d0d")
vim.cmd("highlight NavicIconsKey           guibg = #0d0d0d")
vim.cmd("highlight NavicIconsNull          guibg = #0d0d0d")
vim.cmd("highlight NavicIconsEnumMember    guibg = #0d0d0d")
vim.cmd("highlight NavicIconsStruct        guibg = #0d0d0d")
vim.cmd("highlight NavicIconsEvent         guibg = #0d0d0d")
vim.cmd("highlight NavicIconsOperator      guibg = #0d0d0d")
vim.cmd("highlight NavicIconsTypeParameter guibg = #0d0d0d")
vim.cmd("highlight NavicText               guibg = #0d0d0d")
vim.cmd("highlight NavicSeparator          guibg = #0d0d0d")

vim.cmd("highlight StatusLine              guibg = #0d0d0d")

