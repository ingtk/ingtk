require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"go",
		"lua"
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
}
