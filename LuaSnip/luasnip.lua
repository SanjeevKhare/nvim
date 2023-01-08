local ls = require "luasnip"
local types = require "luasnip.util.types"

  -- Load snippets
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip.loaders.from_snipmate").lazy_load()

  ls.filetype_extend("all", { "_" })

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}


-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/LuaSnip/luasnip.lua<CR>")
