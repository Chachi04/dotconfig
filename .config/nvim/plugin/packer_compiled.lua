-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/chachi/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/chachi/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/chachi/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/chachi/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/chachi/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["formatter.nvim"] = {
    config = { "\27LJ\1\2Š\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\nstdin\2\bexe\rprettierŠ\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\nstdin\2\bexe\rprettierŠ\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--double-quote\1\0\2\nstdin\2\bexe\rprettierN\0\0\2\0\3\0\0043\0\0\0003\1\1\0:\1\2\0H\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\nstdin\2\bexe\vluafmt-\0\0\1\0\1\0\0023\0\0\0H\0\2\0\1\0\2\bexe\20python -m black\nstdin\1±\1\0\0\4\0\n\1\0163\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\0<\2\0\0:\1\5\0004\1\2\0007\1\6\0017\1\a\1%\2\b\0>\1\2\2:\1\t\0H\0\2\0\bcwd\n%:p:h\vexpand\afn\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\22--assume-filename\1\0\2\bexe\17clang-format\nstdin\2\5€€À™\4Þ\3\1\0\5\0\22\0'4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0002\3\3\0001\4\4\0;\4\1\3:\3\6\0022\3\3\0001\4\a\0;\4\1\3:\3\b\0022\3\3\0001\4\t\0;\4\1\3:\3\n\0022\3\3\0001\4\v\0;\4\1\3:\3\f\0022\3\3\0001\4\r\0;\4\1\3:\3\14\0022\3\3\0001\4\15\0;\4\1\3:\3\16\2:\2\17\1>\0\2\0014\0\18\0007\0\19\0007\0\20\0%\1\21\0)\2\2\0>\0\3\1G\0\1\0È\1                    augroup Format\n                        autocmd!\n                        autocmd BufWritePost *.js,*.py,*.lua,*.cpp FormatWrite\n                    augroup END\n                \14nvim_exec\bapi\bvim\rfiletype\bcpp\0\vpython\0\blua\0\bvue\0\20javascriptreact\0\15javascript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2‘\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2„\4\0\0\4\0\28\0)4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\3\0003\3\4\0:\3\5\2:\2\a\0013\2\t\0003\3\b\0:\3\n\0023\3\v\0:\3\f\0023\3\r\0:\3\14\0023\3\15\0:\3\16\0023\3\17\0:\3\18\0023\3\19\0:\3\20\2:\2\21\0013\2\22\0002\3\0\0:\3\n\0022\3\0\0:\3\f\0023\3\23\0:\3\14\0023\3\24\0:\3\16\0022\3\0\0:\3\18\0022\3\0\0:\3\20\2:\2\25\0013\2\26\0:\2\27\1>\0\2\1G\0\1\0\15extentions\1\3\0\0\14nvim-tree\bfzf\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\2\0\0\rNvimTree\1\0\3\25component_separators\5\24section_serparators\5\ntheme\fonedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\2†\1\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\5\veasing\2\25cursor_scrolls_alone\2\16hide_cursor\2\rstop_eof\2\22respect_scrolloff\1\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\1\2q\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\3\20create_mappings\1\19marker_padding\2\18comment_empty\1\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\1\2ƒ\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\vsource\1\0\6\nvsnip\2\rnvim_lua\2\rnvim_lsp\2\vbuffer\2\btag\2\tpath\2\1\0\1\fenabled\2\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\1\2¢\1\0\0\b\0\6\0\0244\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\1\0>\0\2\0027\0\3\0>\0\1\0024\1\4\0\16\2\0\0>\1\2\4D\4\a€4\6\0\0%\a\5\0>\6\2\0026\6\5\0067\6\2\0062\a\0\0>\6\2\1B\4\3\3N\4÷G\0\1\0\14lspconfig\npairs\22installed_servers\nsetup\15lspinstall\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\1\2Œ\2\0\0\3\0\t\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0004\2\4\0007\2\5\0027\2\6\2:\2\6\0013\2\a\0:\2\b\1>\0\2\1G\0\1\0\15float_opts\1\0\2\rwinblend\3\3\vborder\vsingle\nshell\6o\bvim\1\0\b\20insert_mappings\2\19shading_factor\0063\14direction\nfloat\17open_mapping\n<A-i>\20start_in_insert\2\17persist_size\2\19shade_terminal\2\17hide_numbers\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2Ð\4\0\0\5\0\25\0!4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\0\0:\2\4\0013\2\5\0:\2\6\0013\2\a\0003\3\b\0:\3\t\2:\2\n\0013\2\v\0002\3\0\0:\3\f\2:\2\r\0013\2\14\0002\3\0\0:\3\15\2:\2\16\0013\2\17\0002\3\0\0:\3\18\2:\2\19\0013\2\20\0003\3\21\0002\4\0\0:\4\22\3:\3\23\2:\2\24\1>\0\2\1G\0\1\0\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\5\vheight\3\30\tside\tleft\21hide_root_folder\1\16auto_resize\1\nwidth\3\30\ffilters\vcustom\1\0\1\rdotfiles\1\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\1\16diagnostics\nicons\1\0\4\tinfo\bïš\thint\bïª\nerror\bï—\fwarning\bï±\1\0\1\venable\1\22update_to_buf_dir\1\0\2\14auto_open\2\venable\2\23ignore_ft_on_setup\1\0\a\15update_cwd\1\16open_on_tab\1\18open_on_setup\1\15auto_close\1\18disable_netrw\2\18hijack_cursor\1\17hijack_netrw\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2•\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\2\21use_languagetree\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "\27LJ\1\2u\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\26context_commentstring\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\1\2ü\2\0\0\2\0\r\0\0304\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\0014\0\0\0007\0\a\0%\1\b\0>\0\2\0014\0\0\0007\0\a\0%\1\t\0>\0\2\0014\0\0\0007\0\a\0%\1\n\0>\0\2\0014\0\0\0007\0\a\0%\1\v\0>\0\2\0014\0\0\0007\0\a\0%\1\f\0>\0\2\1G\0\1\0003hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE.hi NvimTreeNormal guibg=NONE ctermbg=NONE*hi SignColumn guibg=NONE ctermbg=NONE+hi EndOfBuffer guibg=NONE ctermbg=NONE&hi Normal guibg=NONE ctermbg=NONE\bcmd\nsetup\fonedark\frequire\vwarmer\18onedark_style\6g\bvim\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pears.nvim"] = {
    config = { "\27LJ\1\0023\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\npears\frequire\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/pears.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\1\2h\0\0\2\0\6\0\v4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\3\0>\0\2\0027\0\5\0002\1\0\0>\0\2\1G\0\1\0\nsetup\frequire\rsurround\28surround_mappings_style\6g\bvim\0" },
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/chachi/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\1\2h\0\0\2\0\6\0\v4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\3\0>\0\2\0027\0\5\0002\1\0\0>\0\2\1G\0\1\0\nsetup\frequire\rsurround\28surround_mappings_style\6g\bvim\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2•\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\2\21use_languagetree\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2Ð\4\0\0\5\0\25\0!4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0002\2\0\0:\2\4\0013\2\5\0:\2\6\0013\2\a\0003\3\b\0:\3\t\2:\2\n\0013\2\v\0002\3\0\0:\3\f\2:\2\r\0013\2\14\0002\3\0\0:\3\15\2:\2\16\0013\2\17\0002\3\0\0:\3\18\2:\2\19\0013\2\20\0003\3\21\0002\4\0\0:\4\22\3:\3\23\2:\2\24\1>\0\2\1G\0\1\0\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\5\vheight\3\30\tside\tleft\21hide_root_folder\1\16auto_resize\1\nwidth\3\30\ffilters\vcustom\1\0\1\rdotfiles\1\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\1\16diagnostics\nicons\1\0\4\tinfo\bïš\thint\bïª\nerror\bï—\fwarning\bï±\1\0\1\venable\1\22update_to_buf_dir\1\0\2\14auto_open\2\venable\2\23ignore_ft_on_setup\1\0\a\15update_cwd\1\16open_on_tab\1\18open_on_setup\1\15auto_close\1\18disable_netrw\2\18hijack_cursor\1\17hijack_netrw\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\2†\1\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\5\veasing\2\25cursor_scrolls_alone\2\16hide_cursor\2\rstop_eof\2\22respect_scrolloff\1\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-ts-context-commentstring
time([[Config for nvim-ts-context-commentstring]], true)
try_loadstring("\27LJ\1\2u\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\26context_commentstring\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-context-commentstring")
time([[Config for nvim-ts-context-commentstring]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\1\2ƒ\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\vsource\1\0\6\nvsnip\2\rnvim_lua\2\rnvim_lsp\2\vbuffer\2\btag\2\tpath\2\1\0\1\fenabled\2\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2„\4\0\0\4\0\28\0)4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\3\0003\3\4\0:\3\5\2:\2\a\0013\2\t\0003\3\b\0:\3\n\0023\3\v\0:\3\f\0023\3\r\0:\3\14\0023\3\15\0:\3\16\0023\3\17\0:\3\18\0023\3\19\0:\3\20\2:\2\21\0013\2\22\0002\3\0\0:\3\n\0022\3\0\0:\3\f\0023\3\23\0:\3\14\0023\3\24\0:\3\16\0022\3\0\0:\3\18\0022\3\0\0:\3\20\2:\2\25\0013\2\26\0:\2\27\1>\0\2\1G\0\1\0\15extentions\1\3\0\0\14nvim-tree\bfzf\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\2\0\0\rNvimTree\1\0\3\25component_separators\5\24section_serparators\5\ntheme\fonedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\1\2Œ\2\0\0\3\0\t\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0004\2\4\0007\2\5\0027\2\6\2:\2\6\0013\2\a\0:\2\b\1>\0\2\1G\0\1\0\15float_opts\1\0\2\rwinblend\3\3\vborder\vsingle\nshell\6o\bvim\1\0\b\20insert_mappings\2\19shading_factor\0063\14direction\nfloat\17open_mapping\n<A-i>\20start_in_insert\2\17persist_size\2\19shade_terminal\2\17hide_numbers\2\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\1\2q\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\3\20create_mappings\1\19marker_padding\2\18comment_empty\1\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2‘\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6-\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: pears.nvim
time([[Config for pears.nvim]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\npears\frequire\0", "config", "pears.nvim")
time([[Config for pears.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\1\2ü\2\0\0\2\0\r\0\0304\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0>\0\1\0014\0\0\0007\0\a\0%\1\b\0>\0\2\0014\0\0\0007\0\a\0%\1\t\0>\0\2\0014\0\0\0007\0\a\0%\1\n\0>\0\2\0014\0\0\0007\0\a\0%\1\v\0>\0\2\0014\0\0\0007\0\a\0%\1\f\0>\0\2\1G\0\1\0003hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE.hi NvimTreeNormal guibg=NONE ctermbg=NONE*hi SignColumn guibg=NONE ctermbg=NONE+hi EndOfBuffer guibg=NONE ctermbg=NONE&hi Normal guibg=NONE ctermbg=NONE\bcmd\nsetup\fonedark\frequire\vwarmer\18onedark_style\6g\bvim\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\1\2Š\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\nstdin\2\bexe\rprettierŠ\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\nstdin\2\bexe\rprettierŠ\1\0\0\4\0\6\0\n3\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\2;\2\2\1:\1\5\0H\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--double-quote\1\0\2\nstdin\2\bexe\rprettierN\0\0\2\0\3\0\0043\0\0\0003\1\1\0:\1\2\0H\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\nstdin\2\bexe\vluafmt-\0\0\1\0\1\0\0023\0\0\0H\0\2\0\1\0\2\bexe\20python -m black\nstdin\1±\1\0\0\4\0\n\1\0163\0\0\0003\1\1\0004\2\2\0007\2\3\0027\2\4\2'\3\0\0>\2\2\0<\2\0\0:\1\5\0004\1\2\0007\1\6\0017\1\a\1%\2\b\0>\1\2\2:\1\t\0H\0\2\0\bcwd\n%:p:h\vexpand\afn\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\22--assume-filename\1\0\2\bexe\17clang-format\nstdin\2\5€€À™\4Þ\3\1\0\5\0\22\0'4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0002\3\3\0001\4\4\0;\4\1\3:\3\6\0022\3\3\0001\4\a\0;\4\1\3:\3\b\0022\3\3\0001\4\t\0;\4\1\3:\3\n\0022\3\3\0001\4\v\0;\4\1\3:\3\f\0022\3\3\0001\4\r\0;\4\1\3:\3\14\0022\3\3\0001\4\15\0;\4\1\3:\3\16\2:\2\17\1>\0\2\0014\0\18\0007\0\19\0007\0\20\0%\1\21\0)\2\2\0>\0\3\1G\0\1\0È\1                    augroup Format\n                        autocmd!\n                        autocmd BufWritePost *.js,*.py,*.lua,*.cpp FormatWrite\n                    augroup END\n                \14nvim_exec\bapi\bvim\rfiletype\bcpp\0\vpython\0\blua\0\bvue\0\20javascriptreact\0\15javascript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-lspinstall
time([[Config for nvim-lspinstall]], true)
try_loadstring("\27LJ\1\2¢\1\0\0\b\0\6\0\0244\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\1\0>\0\2\0027\0\3\0>\0\1\0024\1\4\0\16\2\0\0>\1\2\4D\4\a€4\6\0\0%\a\5\0>\6\2\0026\6\5\0067\6\2\0062\a\0\0>\6\2\1B\4\3\3N\4÷G\0\1\0\14lspconfig\npairs\22installed_servers\nsetup\15lspinstall\frequire\0", "config", "nvim-lspinstall")
time([[Config for nvim-lspinstall]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
