-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  chadtree = {
    config = { "\27LJ\2\no\0\0\a\0\t\0\f6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0005\6\b\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\tOpen\t<F5>\6n\bset\vkeymap\bvim\rchadtree\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/chadtree",
    url = "https://github.com/ms-jpq/chadtree"
  },
  coq_nvim = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  eslint = {
    config = { "\27LJ\2\nè\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0005\5\6\0=\5\a\4=\4\b\0035\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\16diagnostics\1\0\3\venable\2\vrun_on\ttype%report_unused_disable_directives\1\17code_actions\25disable_rule_comment\1\0\2\venable\2\rlocation\18separate_line\18apply_on_save\ntypes\1\5\0\0\14directive\fproblem\15suggestion\vlayout\1\0\1\venable\2\1\0\1\venable\2\1\0\2\bcmd\29eslint_d -f visualstudio\bbin\reslint_d\nsetup\veslint\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/eslint",
    url = "https://github.com/MunifTanjim/eslint.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n^\0\0\3\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0'\2\4\0B\0\2\1K\0\1\0\19file harpooned\nprint\radd_file\17harpoon.mark\frequirei\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0B\0\1\1K\0\1\0\16startinsert\bcmd\bvim\17gotoTerminal\17harpoon.term\frequireÙ\2\1\0\a\0\18\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0003\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0006\4\0\0'\6\n\0B\4\2\0029\4\v\4B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0006\4\0\0'\6\n\0B\4\2\0029\4\r\4B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\14\0006\4\0\0'\6\n\0B\4\2\0029\4\15\4B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0003\4\17\0B\0\4\1K\0\1\0\0\14<leader>t\rnav_prev\14<leader>k\rnav_next\14<leader>j\22toggle_quick_menu\15harpoon.ui\14<leader>'\0\14<leader>m\6n\bset\vkeymap\bvim\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  lspconfig = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nò\3\0\0\6\0\25\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\n\0005\5\t\0>\5\1\4=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0034\4\3\0005\5\16\0>\5\1\4=\4\17\0035\4\18\0=\4\19\3=\3\20\0025\3\21\0004\4\0\0=\4\b\0034\4\0\0=\4\v\0035\4\22\0=\4\r\0035\4\23\0=\4\15\0034\4\0\0=\4\17\0034\4\0\0=\4\19\3=\3\24\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\3\0\0\vbranch\tdiff\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\3\0\0\16diagnostics\16searchcount\14lualine_b\1\3\0\0\0\rfilesize\1\2\1\0\rfilename\tpath\3\1\14lualine_a\1\0\0\1\3\0\0\tmode\rlocation\foptions\1\0\0\1\0\2\ntheme\14solarized\17globalstatus\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\nŠ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\0\1\5\0\0\16sumneko_lua\rtsserver\17intelephense\veslint\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nê\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\2\17sync_install\1\17auto_install\2\1\a\0\0\thelp\15javascript\15typescript\6c\blua\bvim\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  plenary = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/plenary",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["reach.nvim"] = {
    config = { "\27LJ\2\nÊ\1\0\0\a\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0009\5\f\0005\6\r\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\nmarks\t<F3>\1\0\1\fnoremap\2\fbuffers\t<F2>\6n\bset\vkeymap\bvim\1\0\1\18notifications\2\nsetup\nreach\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/reach.nvim",
    url = "https://github.com/toppair/reach.nvim"
  },
  solarized = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/solarized",
    url = "https://github.com/shaunsingh/solarized.nvim"
  },
  ["solarized.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/opt/solarized.nvim",
    url = "https://github.com/shaunsingh/solarized.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n»\4\0\0\b\0\28\0N6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0006\5\0\0'\a\b\0B\5\2\0029\5\t\0055\6\n\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\v\0006\5\0\0'\a\b\0B\5\2\0029\5\f\0055\6\r\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\14\0006\5\0\0'\a\b\0B\5\2\0029\5\15\0055\6\16\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\17\0006\5\0\0'\a\b\0B\5\2\0029\5\18\0055\6\19\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\20\0006\5\0\0'\a\b\0B\5\2\0029\5\21\0055\6\22\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\23\0006\5\0\0'\a\b\0B\5\2\0029\5\24\0055\6\25\0B\1\5\0016\1\0\0'\3\1\0B\1\2\0029\1\26\1'\3\27\0B\1\2\1K\0\1\0\bfzf\19load_extension\1\0\1\fnoremap\2\vresume\afr\1\0\1\fnoremap\2\16grep_string\afs\1\0\1\fnoremap\2\14live_grep\afg\1\0\1\fnoremap\2\30current_buffer_fuzzy_find\afb\1\0\1\fnoremap\2\14git_files\15<leader>gf\1\0\1\fnoremap\2\15find_files\22telescope.builtin\aff\6n\bset\vkeymap\bvim\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nl\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\tsize\3P\14direction\rvertical\17open_mapping\n<C-'>\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nŒ\1\0\0\n\0\n\1\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\3\0006\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0009\b\b\0005\t\t\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\1\0\1\fnoremap\2\vtoggle\t<F4>\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    config = { "\27LJ\2\n]\0\0\5\0\a\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\1K\0\1\0\19UndotreeToggle\bcmd\14<leader>u\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nS\0\0\5\0\a\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\1K\0\1\0\bGit\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0+\1\1\0=\1\5\0K\0\1\0\twrap\awo\bvim\vtoggle\rzen-mode\frequire»\1\1\0\5\0\14\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0003\4\r\0B\0\4\1K\0\1\0\0\15<leader>zz\6n\bset\vkeymap\bvim\vwindow\1\0\0\foptions\1\0\2\vnumber\2\19relativenumber\2\1\0\1\nwidth\3Z\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nl\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\tsize\3P\14direction\rvertical\17open_mapping\n<C-'>\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n^\0\0\3\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0'\2\4\0B\0\2\1K\0\1\0\19file harpooned\nprint\radd_file\17harpoon.mark\frequirei\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0B\0\1\1K\0\1\0\16startinsert\bcmd\bvim\17gotoTerminal\17harpoon.term\frequireÙ\2\1\0\a\0\18\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0003\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0006\4\0\0'\6\n\0B\4\2\0029\4\v\4B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0006\4\0\0'\6\n\0B\4\2\0029\4\r\4B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\14\0006\4\0\0'\6\n\0B\4\2\0029\4\15\4B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0003\4\17\0B\0\4\1K\0\1\0\0\14<leader>t\rnav_prev\14<leader>k\rnav_next\14<leader>j\22toggle_quick_menu\15harpoon.ui\14<leader>'\0\14<leader>m\6n\bset\vkeymap\bvim\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\nŠ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\0\1\5\0\0\16sumneko_lua\rtsserver\17intelephense\veslint\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: chadtree
time([[Config for chadtree]], true)
try_loadstring("\27LJ\2\no\0\0\a\0\t\0\f6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0005\6\b\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\tOpen\t<F5>\6n\bset\vkeymap\bvim\rchadtree\frequire\0", "config", "chadtree")
time([[Config for chadtree]], false)
-- Config for: reach.nvim
time([[Config for reach.nvim]], true)
try_loadstring("\27LJ\2\nÊ\1\0\0\a\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0009\5\f\0005\6\r\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\nmarks\t<F3>\1\0\1\fnoremap\2\fbuffers\t<F2>\6n\bset\vkeymap\bvim\1\0\1\18notifications\2\nsetup\nreach\frequire\0", "config", "reach.nvim")
time([[Config for reach.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\n]\0\0\5\0\a\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\1K\0\1\0\19UndotreeToggle\bcmd\14<leader>u\6n\bset\vkeymap\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: eslint
time([[Config for eslint]], true)
try_loadstring("\27LJ\2\nè\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0005\5\6\0=\5\a\4=\4\b\0035\4\t\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\16diagnostics\1\0\3\venable\2\vrun_on\ttype%report_unused_disable_directives\1\17code_actions\25disable_rule_comment\1\0\2\venable\2\rlocation\18separate_line\18apply_on_save\ntypes\1\5\0\0\14directive\fproblem\15suggestion\vlayout\1\0\1\venable\2\1\0\1\venable\2\1\0\2\bcmd\29eslint_d -f visualstudio\bbin\reslint_d\nsetup\veslint\frequire\0", "config", "eslint")
time([[Config for eslint]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nS\0\0\5\0\a\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\1K\0\1\0\bGit\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\n\0\n\1\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\3\0006\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0009\b\b\0005\t\t\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\1\0\1\fnoremap\2\vtoggle\t<F4>\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\3€€À™\4\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n»\4\0\0\b\0\28\0N6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0006\5\0\0'\a\b\0B\5\2\0029\5\t\0055\6\n\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\v\0006\5\0\0'\a\b\0B\5\2\0029\5\f\0055\6\r\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\14\0006\5\0\0'\a\b\0B\5\2\0029\5\15\0055\6\16\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\17\0006\5\0\0'\a\b\0B\5\2\0029\5\18\0055\6\19\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\20\0006\5\0\0'\a\b\0B\5\2\0029\5\21\0055\6\22\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\23\0006\5\0\0'\a\b\0B\5\2\0029\5\24\0055\6\25\0B\1\5\0016\1\0\0'\3\1\0B\1\2\0029\1\26\1'\3\27\0B\1\2\1K\0\1\0\bfzf\19load_extension\1\0\1\fnoremap\2\vresume\afr\1\0\1\fnoremap\2\16grep_string\afs\1\0\1\fnoremap\2\14live_grep\afg\1\0\1\fnoremap\2\30current_buffer_fuzzy_find\afb\1\0\1\fnoremap\2\14git_files\15<leader>gf\1\0\1\fnoremap\2\15find_files\22telescope.builtin\aff\6n\bset\vkeymap\bvim\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nê\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\2\17sync_install\1\17auto_install\2\1\a\0\0\thelp\15javascript\15typescript\6c\blua\bvim\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0+\1\1\0=\1\5\0K\0\1\0\twrap\awo\bvim\vtoggle\rzen-mode\frequire»\1\1\0\5\0\14\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0003\4\r\0B\0\4\1K\0\1\0\0\15<leader>zz\6n\bset\vkeymap\bvim\vwindow\1\0\0\foptions\1\0\2\vnumber\2\19relativenumber\2\1\0\1\nwidth\3Z\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nò\3\0\0\6\0\25\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\n\0005\5\t\0>\5\1\4=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0034\4\3\0005\5\16\0>\5\1\4=\4\17\0035\4\18\0=\4\19\3=\3\20\0025\3\21\0004\4\0\0=\4\b\0034\4\0\0=\4\v\0035\4\22\0=\4\r\0035\4\23\0=\4\15\0034\4\0\0=\4\17\0034\4\0\0=\4\19\3=\3\24\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\3\0\0\vbranch\tdiff\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\3\0\0\16diagnostics\16searchcount\14lualine_b\1\3\0\0\0\rfilesize\1\2\1\0\rfilename\tpath\3\1\14lualine_a\1\0\0\1\3\0\0\tmode\rlocation\foptions\1\0\0\1\0\2\ntheme\14solarized\17globalstatus\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
