local config = function()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local diagnostic_signs = {
		[vim.lsp.protocol.DiagnosticSeverity.Error] = " ",
		[vim.lsp.protocol.DiagnosticSeverity.Warning] = " ",
		[vim.lsp.protocol.DiagnosticSeverity.Information] = " ",
		[vim.lsp.protocol.DiagnosticSeverity.Hint] = " ",
	}

	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- lua config
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- LaTeX
	lspconfig.texlab.setup({
		capabilities = capabilities,
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local vale = require("efmls-configs.linters.vale")
	local prettier = require("efmls-configs.formatters.prettier")

	-- another thing for lua (efm server)
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"tex",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				tex = { vale },
			},
		},
	})


	-- Markdown
end

-- Format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_active_clients({ name = "efm" })

		if vim.tbl_isempty(efm) then
			return
		end

		vim.lsp.buf.format({ name = "efm" })
	end,
})

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	 opts = {
    servers = {
      texlab = {
        keys = {
          { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
	},},},},
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
