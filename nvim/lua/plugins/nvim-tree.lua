return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = {
	 sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
	},
}
