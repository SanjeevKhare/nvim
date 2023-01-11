  local capabilities = require('cmp_nvim_lsp').default_capabilities()

	local on_attach_old = function(client, bufnr)
		vim.keymap.setup("n", "K", vim.lsp.buf.hover)
		vim.keymap.setup("n", "gd", vim.lsp.buf.definition)
		vim.keymap.setup("n", "gt", vim.lsp.buf.type_definition)
		vim.keymap.setup("n", "gi", vim.lsp.buf.implementation)
		vim.keymap.setup("n", "<leader>dj", vim.lsp.buf.diagnostic.goto_next)
		vim.keymap.setup("n", "<leader>dk", vim.lsp.buf.diagnostic.goto_prev)
		vim.keymap.setup("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>")
		vim.keymap.setup("n", "<leader>r", vim.lsp.buf.rename)
	end

	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { noremap=true, silent=true }
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local on_attach = function(client, bufnr)
	  -- Enable completion triggered by <c-x><c-o>
	  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	  -- Mappings.
	  -- See `:help vim.lsp.*` for documentation on any of the below functions
	  local bufopts = { noremap=true, silent=true, buffer=bufnr }
	  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	  vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	  end, bufopts)
	  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
	  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>")
	end

  -- Set up Julia Language Server.
  require('lspconfig')['julials'].setup{
    capabilities = capabilities,
	on_attach = on_attach,
	-- cmd = { "julia", "--startup-file=no", "--history-file=no", "-e", 'begin ls_install_path = joinpath(get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")), "environments", "nvim-lspconfig")\n pushfirst!(LOAD_PATH, ls_install_path)\n using LanguageServer\n popfirst!(LOAD_PATH) \n depot_path = get(ENV, "JULIA_DEPOT_PATH", "")\n project_path = let dirname(something(Base.load_path_expand((p = get(ENV, "JULIA_PROJECT", nothing); (p === nothing) ? nothing : (isempty(p) ? nothing : p))), Base.current_project(), get(Base.load_path(), 1, nothing), Base.load_path_expand("@v#.#"),)) end\n @info "Running language server" VERSION pwd() project_path depot_path \n server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)\n server.runlinter = true \n run(server) end' }
}

local servers = {"luau_lsp", "ltex", "pyright"} --"pylsp"

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup{
    capabilities = capabilities,
	on_attach = on_attach,
}
end

--   -- Set up Latex Language Server.
--   require('lspconfig')['ltex'].setup{
--     capabilities = capabilities,
-- 	on_attach = on_attach,
--   }

--   -- Set up Python Language Server.
--   -- require('lspconfig')['pylsp'].setup {
--   require('lspconfig')['pyright'].setup{
--     capabilities = capabilities,
-- 	on_attach = on_attach,
--   }
