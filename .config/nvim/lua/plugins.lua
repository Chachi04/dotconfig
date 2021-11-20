require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Telescope plugins
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- Lsp plugins
    use "neovim/nvim-lspconfig"
    use "nvim-lua/lsp_extensions.nvim"
    use {
      "kabouzeid/nvim-lspinstall",
      config = function()
        require "lspinstall".setup()

        local servers = require "lspinstall".installed_servers()

        for _, server in pairs(servers) do
          require "lspconfig"[server].setup {}
        end
      end
    }

    -- Completion plugins
    use {
      "hrsh7th/nvim-compe",
      config = function()
        require "compe".setup(
          {
            enabled = true,
            source = {
              path = true,
              buffer = true,
              tag = true,
              nvim_lsp = true,
              nvim_lua = true,
              vsnip = true
            }
          }
        )
      end
   }

    -- Snippets
    use "rafamadriz/friendly-snippets"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"

    -- Treesitter plugin
    use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require "nvim-treesitter.configs".setup {
          highlight = {
            enable = true,
            use_languagetree = true -- Use this to enable language injection
            -- custom_captures = {
            --     -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            --     ["foo.bar"] = "Identifier",
            -- },
          },
          indent = {
            enable = true
          }
        }
      end
    }

    -- Debug plugins
    -- use "puremourning/vimspector"
    use "szw/vim-maximizer"

    -- Git plugins
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require "gitsigns".setup {
          signs = {
            add = {
              hl = "GitSignsAdd",
              text = "+",
              numhl = "GitSignsAddNr",
              linehl = "GitSignsAddLn"
            },
            change = {
              hl = "GitSignsChange",
              text = "│",
              numhl = "GitSignsChangeNr",
              linehl = "GitSignsChangeLn"
            },
            delete = {
              hl = "GitSignsDelete",
              text = "-",
              numhl = "GitSignsDeleteNr",

              linehl = "GitSignsDeleteLn"
            },
            topdelete = {
              hl = "GitSignsDelete",
              text = "‾",
              numhl = "GitSignsDeleteNr",
              linehl = "GitSignsDeleteLn"
            },
            changedelete = {
              hl = "GitSignsChange",
              text = "~",
              numhl = "GitSignsChangeNr",
              linehl = "GitSignsChangeLn"
            }
          }
        }
      end
    }
    -- use "tpope/vim-fugitive"

    -- Statusline
    use {
      "hoob3rt/lualine.nvim",
      config = function()
        require "lualine".setup {
          options = {
            theme = "onedark",
            disabled_filetypes = {"NvimTree"},
            section_serparators = "",
            component_separators = ""
          },
          sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch"},
            lualine_c = {"filename"},
            lualine_x = {"filetype"},
            lualine_y = {"progress"},
            lualine_z = {"location"}
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
          },
          extentions = {
            "nvim-tree",
            "fzf"
          }
        }
      end
    }

    -- Terminal plugin
    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require "toggleterm".setup {
          open_mapping = "<A-i>",
          hide_numbers = true,
          shade_terminal = true,
          shading_factor = "3",
          start_in_insert = true,
          insert_mappings = true,
          persist_size = true,
          shell = vim.o.shell,
          direction = "float",
          float_opts = {
            border = "single",
            winblend = 3
          }
        }
      end
    }

    -- File Explorer plugin
    use {
      "kyazdani42/nvim-tree.lua",
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {
        disable_netrw       = true,
        hijack_netrw        = true,
        open_on_setup       = false,
        ignore_ft_on_setup  = {},
        auto_close          = false,
        open_on_tab         = false,
        hijack_cursor       = false,
        update_cwd          = false,
        update_to_buf_dir   = {
            enable = true,
            auto_open = true,
        },
        diagnostics = {
            enable = false,
            icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
            }
        },
        update_focused_file = {
            enable      = false,
            update_cwd  = false,
            ignore_list = {}
        },
        system_open = {
            cmd  = nil,
            args = {}
        },
        filters = {
            dotfiles = false,
            custom = {}
        },
        view = {
            width = 30,
            height = 30,
            hide_root_folder = false,
            side = 'left',
            auto_resize = false,
            mappings = {
            custom_only = false,
            list = {}
            }
        }
      } end
    }

    -- Laravel plugin
    -- use {"jwalton512/vim-blade", ft = {"laravel"}}

    -- Surround plugin
    use {
      "blackCauldron7/surround.nvim",
      config = function()
        vim.g.surround_mappings_style = "surround"
        require "surround".setup {}
      end
    }

    -- Html plugins
    use "alvan/vim-closetag"
    use "AndrewRadev/tagalong.vim"

    -- Autopair plugin
    use {
      "steelsojka/pears.nvim",
      config = function()
        require "pears".setup()
      end
    }

    -- Autotag plugin
    use {
      "windwp/nvim-ts-autotag",
      config = function()
        require "nvim-ts-autotag".setup()
      end
    }

    -- Comments plugin
    use {
      "terrortylor/nvim-comment",
      config = function()
        require "nvim_comment".setup(
          {
            marker_padding = true,
            create_mappings = false,
            comment_empty = false
          }
        )
      end
    }
    use {
      "JoosepAlviste/nvim-ts-context-commentstring",
      config = function()
        require "nvim-treesitter.configs".setup {
          context_commentstring = {
            enable = true
            -- enable_autocmd = false
          }
        }
      end
    }
    -- use "glepnir/prodoc.nvim"

    -- Colorschemes
    -- use "gruvbox-community/gruvbox"
    -- use "drewtempelmeyer/palenight.vim"
    use {
      "navarasu/onedark.nvim",
      config = function()
        vim.g.onedark_style = "warmer"
        require "onedark".setup()
        vim.cmd "hi Normal guibg=NONE ctermbg=NONE"
        vim.cmd "hi EndOfBuffer guibg=NONE ctermbg=NONE"
        vim.cmd "hi SignColumn guibg=NONE ctermbg=NONE"
        vim.cmd "hi NvimTreeNormal guibg=NONE ctermbg=NONE"
        vim.cmd "hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE"
      end
    }

    -- Markdown Previewer
    use {"iamcco/markdown-preview.nvim", ft = "markdown"}

    -- Formatter
    -- use "sbdchd/neoformat"
    use {
      "mhartington/formatter.nvim",
      config = function()
        require "formatter".setup(
          {
            logging = false,
            filetype = {
              javascript = {
                -- prettier
                function()
                  return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                    stdin = true
                  }
                end
              },
              javascriptreact = {
                -- prettier
                function()
                  return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                    stdin = true
                  }
                end
              },
              vue = {
                -- prettier
                function()
                  return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--double-quote"},
                    stdin = true
                  }
                end
              },
              lua = {
                -- luafmt
                function()
                  return {
                    exe = "luafmt",
                    args = {"--indent-count", 2, "--stdin"},
                    stdin = true
                  }
                end
              },
              python = {
                function()
                  return {
                    exe = "python -m black",
                    stdin = false
                  }
                end
              },
              cpp = {
                function()
                  return {
                    exe = "clang-format",
                    args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                    stdin = true,
                    cwd = vim.fn.expand("%:p:h")
                  }
                end
              }
            }
          }
        )
        vim.api.nvim_exec(
          [[
                    augroup Format
                        autocmd!
                        autocmd BufWritePost *.js,*.py,*.lua,*.cpp FormatWrite
                    augroup END
                ]],
          true
        )
      end
    }

    -- Smooth scroll plugin
    use {
      "karb94/neoscroll.nvim",
      config = function()
        require "neoscroll".setup(
          {
            hide_cursor = true,
            stop_eof = true,
            respect_scrolloff = false,
            cursor_scrolls_alone = true,
            easing = true
          }
        )
      end
    }

    -- Reload plugin
    use "famiu/nvim-reload"

    -- Misc
    -- use {
    --   "lukas-reineke/indent-blankline.nvim",
    --   config = function()
    --     vim.cmd "highlight IndentBlanklineChar guifg=#4d4d4d gui=nocombine"
    --     vim.cmd "highlight IndentBlanklineSpaceChar guifg=#4d4d4d gui=nocombine"
    --     vim.cmd "highlight IndentBlanklineContextChar guifg=#737373 gui=nocombine"
    --     vim.cmd "let g:indent_blankline_use_treesitter = v:true"
    --     vim.cmd "let g:indent_blankline_show_current_context = v:true"
    --     vim.cmd "let g:indent_blankline_buftype_exclude = ['terminal', 'nofile']"
    --     vim.cmd "let g:indent_blankline_filetype_exclude = ['help']"
    --     vim.cmd "let g:indent_blankline_char = '▏'"
    --     vim.cmd "let g:indent_blankline_space_char = ' '"
    --   end
    -- }
  end
)
