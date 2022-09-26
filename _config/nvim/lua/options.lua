local options = {
	number = true,
	clipboard = "unnamedplus",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
