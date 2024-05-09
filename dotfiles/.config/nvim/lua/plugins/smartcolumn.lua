-- Module for configuring the colour column smartly

return {
  "m4xshen/smartcolumn.nvim",
  event = "BufRead",
  opts = {
    disabled_filetypes = {
      "checkhealth",
      "dosini",
      "dotenv",
      "gitattributes",
      "gitconfig",
      "gitignore",
      "help",
      "json",
      "markdown",
      "mason",
      "mdx",
      "lazy",
      "log",
      "lspinfo",
      "scss",
      "sh",
      "starter",
      "terraform",
      "text",
      "Trouble",
      "tmux",
      "toml",
      "zsh",
    },
    custom_colorcolumn = {
      lua = 120,
      dockerfile = 120,
      python = 88,
      yaml = 90,
      markdown = 80,
      typescriptreact = 81,
      rust = 100,
    },
  },
}
