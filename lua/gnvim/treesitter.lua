-- Syntax highlighting

require'nvim-treesitter.configs'.setup {
    -- one of "all" or a list of languages
    ensure_installed = { 
         "go", "vim", "c", "lua", "javascript",
     }, 
  
    highlight = { enable = true },
    indent = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    }
}
