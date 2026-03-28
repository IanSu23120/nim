{ pkgs }:
with pkgs.vimPlugins;
[
  nvim-treesitter.withAllGrammars

  mini-icons
  mini-indentscope
  mini-cursorword
  mini-ai
  mini-hipatterns
  mini-trailspace
  mini-tabline
  mini-surround
  mini-move
  mini-jump2d
  mini-diff
  mini-clue

  # git
  neogit

  # completion
  blink-cmp
  # blink enhanced
  friendly-snippets
  colorful-menu-nvim
  lspkind-nvim

  # formatter
  conform-nvim

  fzf-lua

  # enhanced
  fidget-nvim
  tiny-inline-diagnostic-nvim
  codediff-nvim
  avante-nvim

  # lsp
  rustaceanvim
  lazydev-nvim

  # ui
  tokyonight-nvim
  lualine-nvim
  nvim-tree-lua

  # note
  markview-nvim
]
