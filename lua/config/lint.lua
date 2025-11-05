local ok, lint = pcall(require, "lint")
if not ok then
	error("nvim-lint not found")
end

vim.env.ESLINT_D_PPID = tostring(vim.fn.getpid())

lint.linters_by_ft = {
	javascript = {
		"eslint_d",
	},
	typescript = {
		"eslint_d",
	},
	javascriptreact = {
		"eslint_d",
	},
	typescriptreact = {
		"eslint_d",
	},
}

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
