return function(utils)
	return utils.root_has_file({
		".eslintrc",
		".eslintrc.cjs",
		".eslintrc.js",
		".eslintrc.json",
		"eslint.config.cjs",
		"eslint.config.js",
		"eslint.config.mjs",
	})
end
