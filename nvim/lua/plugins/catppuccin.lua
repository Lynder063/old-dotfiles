return { "catppuccin/nvim",
	nfme = "catppuccin", 
	priority = 1000,
	lazy = false,
	config = function()
		vim.cmd('colorscheme catppuccin-mocha')	
	end
}
