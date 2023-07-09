local highlights = require("nord").bufferline.highlights({
  italic = true,
  bold = true,
})

require("bufferline").setup({
  options = {
    separator_style = "thin",
  },
  highlights = highlights,
})
