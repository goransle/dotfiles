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
local package_path_str = "/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?.lua;/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?/init.lua;/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?.lua;/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/goranslettemark/.cache/nvim/packer_hererocks/2.1.1720049189/lib/lua/5.1/?.so"
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
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n˛\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\vsilent\2{<cmd>lua require\"gitlinker\".get_buf_range_url(\"n\", {action_callback = require\"gitlinker.actions\".open_in_browser})<cr>\15<leader>gx\6n\20nvim_set_keymap\bapi\bvim\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\nS\0\0\3\1\4\0\v-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0B\0\2\0016\0\2\0'\2\3\0B\0\2\1K\0\1\0\0¿\19file harpooned\nprint\badd\tlistK\0\0\6\1\3\0\n-\0\0\0009\0\0\0\18\2\0\0009\0\1\0-\3\0\0\18\5\3\0009\3\2\3B\3\2\0A\0\1\1K\0\1\0\0¿\tlist\22toggle_quick_menu\aui3\0\0\3\1\2\0\b-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0B\0\2\1K\0\1\0\0¿\tnext\tlist3\0\0\3\1\2\0\b-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0B\0\2\1K\0\1\0\0¿\tprev\tlist9\0\0\4\1\2\0\t-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0)\3\1\0B\0\3\1K\0\1\0\0¿\vselect\tlist9\0\0\4\1\2\0\t-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0)\3\2\0B\0\3\1K\0\1\0\0¿\vselect\tlist9\0\0\4\1\2\0\t-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0)\3\3\0B\0\3\1K\0\1\0\0¿\vselect\tlist9\0\0\4\1\2\0\t-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0)\3\4\0B\0\3\1K\0\1\0\0¿\vselect\tlist…\3\1\0\6\0\26\0B6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\n\0003\5\v\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\f\0003\5\r\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\14\0003\5\15\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\16\0003\5\17\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\18\0003\5\19\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\20\0003\5\21\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\22\0003\5\23\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\24\0003\5\25\0B\1\4\0012\0\0ÄK\0\1\0\0\14<leader>4\0\14<leader>3\0\14<leader>2\0\14<leader>1\0\14<leader>k\0\14<leader>j\0\14<leader>'\0\14<leader>m\6n\bset\vkeymap\bvim\rsettings\1\0\1\rsettings\0\1\0\2\21sync_on_ui_close\2\19save_on_toggle\2\nsetup\fharpoon\frequire\0" },
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
    config = { "\27LJ\2\n1\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\3\abg\f#282828\bgui\tbold\afg\f#1DB954∏\5\1\0\a\0\28\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\n\0005\5\t\0>\5\1\4=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0034\4\3\0005\5\16\0>\5\1\0045\5\17\0003\6\18\0=\6\19\5>\5\2\4=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3\24\0004\4\0\0=\4\b\0034\4\0\0=\4\v\0035\4\25\0=\4\r\0035\4\26\0=\4\15\0034\4\0\0=\4\20\0034\4\0\0=\4\22\3=\3\27\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_y\0\14lualine_b\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_c\0\rsections\14lualine_z\1\3\0\0\vbranch\tdiff\14lualine_y\ncolor\0\1\2\1\0\fspotify\ncolor\0\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\3\0\0\16diagnostics\16searchcount\14lualine_b\1\3\0\0\0\rfilesize\1\2\1\0\rfilename\tpath\3\1\14lualine_a\1\0\6\14lualine_y\0\14lualine_b\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_c\0\1\3\0\0\tmode\rlocation\foptions\1\0\3\rsections\0\foptions\0\22inactive_sections\0\1\0\1\ntheme\14solarized\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0" },
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
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navbuddy"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-navbuddy",
    url = "https://github.com/SmiteshP/nvim-navbuddy"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nå\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\4\17sync_install\1\21ensure_installed\0\14highlight\0\17auto_install\2\1\b\0\0\thelp\15javascript\15typescript\6c\blua\bvim\trust\nsetup\28nvim-treesitter.configs\frequire\0" },
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
  ["reach.nvim"] = {
    config = { "\27LJ\2\n \1\0\0\a\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0009\5\f\0005\6\r\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\nmarks\t<F3>\1\0\1\fnoremap\2\fbuffers\t<F2>\6n\bset\vkeymap\bvim\1\0\1\18notifications\2\nsetup\nreach\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/reach.nvim",
    url = "https://github.com/toppair/reach.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
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
    config = { "\27LJ\2\n∆\2\0\0\4\1\f\0$6\0\0\0009\0\1\0006\1\0\0009\1\1\0019\1\2\1\19\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0006\3\0\0009\3\1\0039\3\2\3\15\0\3\0X\4\3Ä-\3\0\0\14\0\3\0X\4\1Ä4\3\0\0=\3\a\2B\0\2\0016\0\b\0'\2\t\0006\3\0\0009\3\1\0039\3\2\3\15\0\3\0X\4\2Ä'\3\n\0X\4\1Ä'\3\v\0&\2\3\2B\0\2\1K\0\1\0\3¿\rdisabled\fenabled'Telescope ignore patterns are now \nprint\25file_ignore_patterns\1\0\1\25file_ignore_patterns\0\17set_defaults\21telescope.config\frequire\29telescope_ignore_enabled\6g\bvimÿ\a\1\0\v\0.\1x6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0024\2\3\0006\3\3\0009\5\4\0019\5\5\5B\3\2\0?\3\0\0006\3\6\0009\3\a\3\18\5\2\0'\6\b\0B\3\3\0016\3\6\0009\3\a\3\18\5\2\0'\6\t\0B\3\3\0016\3\6\0009\3\a\3\18\5\2\0'\6\n\0B\3\3\0019\3\v\0005\5\r\0005\6\f\0=\2\5\6=\6\14\0055\6\16\0005\a\15\0=\a\17\6=\6\18\5B\3\2\0014\3\0\0006\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a\23\0003\b\24\0005\t\25\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a\26\0006\b\0\0'\n\27\0B\b\2\0029\b\17\b5\t\28\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a\29\0006\b\0\0'\n\27\0B\b\2\0029\b\30\b5\t\31\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a \0006\b\0\0'\n\27\0B\b\2\0029\b!\b5\t\"\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a#\0006\b\0\0'\n\27\0B\b\2\0029\b$\b5\t%\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a&\0006\b\0\0'\n\27\0B\b\2\0029\b'\b5\t(\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a)\0006\b\0\0'\n\27\0B\b\2\0029\b*\b5\t+\0B\4\5\0016\4\0\0'\6\1\0B\4\2\0029\4,\4'\6-\0B\4\2\0012\0\0ÄK\0\1\0\bfzf\19load_extension\1\0\1\fnoremap\2\vresume\afr\1\0\1\fnoremap\2\16grep_string\afs\1\0\1\fnoremap\2\14live_grep\afg\1\0\1\fnoremap\2\30current_buffer_fuzzy_find\afb\1\0\1\fnoremap\2\14git_files\15<leader>gf\1\0\1\fnoremap\2\22telescope.builtin\aff\1\0\2\fnoremap\2\tdesc%Toggle telescope ignore patterns\0\16<leader>tfi\6n\bset\vkeymap\bvim\fpickers\15find_files\1\0\1\15find_files\0\1\0\1\vhidden\2\rdefaults\1\0\2\fpickers\0\rdefaults\0\1\0\1\22vimgrep_arguments\0\nsetup\15!**/.git/*\v--glob\r--hidden\vinsert\ntable\22vimgrep_arguments\vvalues\vunpack\21telescope.config\14telescope\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments"] = {
    config = { "\27LJ\2\n∫\4\0\0\6\0\26\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\24\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0005\5\r\0=\5\5\4=\4\14\0035\4\15\0005\5\16\0=\5\5\4=\4\17\0035\4\18\0005\5\19\0=\5\5\4=\4\20\0035\4\21\0005\5\22\0=\5\5\4=\4\23\3=\3\25\2B\0\2\1K\0\1\0\rkeywords\1\0\1\rkeywords\0\tTEST\1\2\0\0\fTESTING\1\0\3\ncolor\thint\ticon\tüß™\balt\0\tNOTE\1\2\0\0\tINFO\1\0\3\ncolor\thint\ticon\tüìù\balt\0\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\3\ncolor\thint\ticon\füèéÔ∏è\balt\0\tWARN\1\3\0\0\fWARNING\bXXX\1\0\3\ncolor\fwarning\ticon\v‚ö†Ô∏è\balt\0\tHACK\1\0\2\ticon\tüî•\ncolor\fwarning\tTODO\1\0\2\ticon\tüíÄ\ncolor\thint\bFIX\1\0\a\tHACK\0\tNOTE\0\tPERF\0\tTEST\0\tWARN\0\tTODO\0\bFIX\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\3\ncolor\nerror\ticon\tüêû\balt\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/todo-comments",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nå\1\0\0\n\0\n\1\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\3\0006\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0009\b\b\0005\t\t\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\1\0\1\fnoremap\2\vtoggle\t<F4>\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\3ÄÄ¿ô\4\0" },
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
    config = { "\27LJ\2\nÑ\1\0\0\5\0\a\0\0176\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\3\1'\3\4\0\18\4\0\0&\3\4\3B\1\2\0016\1\5\0'\3\6\0\18\4\0\0&\3\4\3B\1\2\1K\0\1\0\15Git added \nprint\14:Git add \bcmd\22nvim_buf_get_name\bapi\bvim–\2\1\0\6\0\17\0.6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\0013\0\a\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\b\0\18\5\0\0B\1\4\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\t\0'\5\n\0B\1\4\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\v\0'\5\f\0B\1\4\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\r\0'\5\14\0B\1\4\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\15\0'\5\16\0B\1\4\1K\0\1\0\19:Git checkout \16<leader>gco\19:Git pull <CR>\15<leader>gP\14:Git push\15<leader>gp\16:Git commit\15<leader>gc\15<leader>ga\0\bGit\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-tabby"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/vim-tabby",
    url = "https://github.com/TabbyML/vim-tabby"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\3\abg\f#282828\bgui\tbold\afg\f#1DB954∏\5\1\0\a\0\28\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\n\0005\5\t\0>\5\1\4=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0034\4\3\0005\5\16\0>\5\1\0045\5\17\0003\6\18\0=\6\19\5>\5\2\4=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3\24\0004\4\0\0=\4\b\0034\4\0\0=\4\v\0035\4\25\0=\4\r\0035\4\26\0=\4\15\0034\4\0\0=\4\20\0034\4\0\0=\4\22\3=\3\27\2B\0\2\1K\0\1\0\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_y\0\14lualine_b\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_c\0\rsections\14lualine_z\1\3\0\0\vbranch\tdiff\14lualine_y\ncolor\0\1\2\1\0\fspotify\ncolor\0\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\3\0\0\16diagnostics\16searchcount\14lualine_b\1\3\0\0\0\rfilesize\1\2\1\0\rfilename\tpath\3\1\14lualine_a\1\0\6\14lualine_y\0\14lualine_b\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_c\0\1\3\0\0\tmode\rlocation\foptions\1\0\3\rsections\0\foptions\0\22inactive_sections\0\1\0\1\ntheme\14solarized\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nå\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\4\17sync_install\1\21ensure_installed\0\14highlight\0\17auto_install\2\1\b\0\0\thelp\15javascript\15typescript\6c\blua\bvim\trust\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\nS\0\0\3\1\4\0\v-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0B\0\2\0016\0\2\0'\2\3\0B\0\2\1K\0\1\0\0¿\19file harpooned\nprint\badd\tlistK\0\0\6\1\3\0\n-\0\0\0009\0\0\0\18\2\0\0009\0\1\0-\3\0\0\18\5\3\0009\3\2\3B\3\2\0A\0\1\1K\0\1\0\0¿\tlist\22toggle_quick_menu\aui3\0\0\3\1\2\0\b-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0B\0\2\1K\0\1\0\0¿\tnext\tlist3\0\0\3\1\2\0\b-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0B\0\2\1K\0\1\0\0¿\tprev\tlist9\0\0\4\1\2\0\t-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0)\3\1\0B\0\3\1K\0\1\0\0¿\vselect\tlist9\0\0\4\1\2\0\t-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0)\3\2\0B\0\3\1K\0\1\0\0¿\vselect\tlist9\0\0\4\1\2\0\t-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0)\3\3\0B\0\3\1K\0\1\0\0¿\vselect\tlist9\0\0\4\1\2\0\t-\0\0\0\18\2\0\0009\0\0\0B\0\2\2\18\2\0\0009\0\1\0)\3\4\0B\0\3\1K\0\1\0\0¿\vselect\tlist…\3\1\0\6\0\26\0B6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\n\0003\5\v\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\f\0003\5\r\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\14\0003\5\15\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\16\0003\5\17\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\18\0003\5\19\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\20\0003\5\21\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\22\0003\5\23\0B\1\4\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\24\0003\5\25\0B\1\4\0012\0\0ÄK\0\1\0\0\14<leader>4\0\14<leader>3\0\14<leader>2\0\14<leader>1\0\14<leader>k\0\14<leader>j\0\14<leader>'\0\14<leader>m\6n\bset\vkeymap\bvim\rsettings\1\0\1\rsettings\0\1\0\2\21sync_on_ui_close\2\19save_on_toggle\2\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\n˛\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\vsilent\2{<cmd>lua require\"gitlinker\".get_buf_range_url(\"n\", {action_callback = require\"gitlinker.actions\".open_in_browser})<cr>\15<leader>gx\6n\20nvim_set_keymap\bapi\bvim\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: todo-comments
time([[Config for todo-comments]], true)
try_loadstring("\27LJ\2\n∫\4\0\0\6\0\26\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\24\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0005\5\r\0=\5\5\4=\4\14\0035\4\15\0005\5\16\0=\5\5\4=\4\17\0035\4\18\0005\5\19\0=\5\5\4=\4\20\0035\4\21\0005\5\22\0=\5\5\4=\4\23\3=\3\25\2B\0\2\1K\0\1\0\rkeywords\1\0\1\rkeywords\0\tTEST\1\2\0\0\fTESTING\1\0\3\ncolor\thint\ticon\tüß™\balt\0\tNOTE\1\2\0\0\tINFO\1\0\3\ncolor\thint\ticon\tüìù\balt\0\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\3\ncolor\thint\ticon\füèéÔ∏è\balt\0\tWARN\1\3\0\0\fWARNING\bXXX\1\0\3\ncolor\fwarning\ticon\v‚ö†Ô∏è\balt\0\tHACK\1\0\2\ticon\tüî•\ncolor\fwarning\tTODO\1\0\2\ticon\tüíÄ\ncolor\thint\bFIX\1\0\a\tHACK\0\tNOTE\0\tPERF\0\tTEST\0\tWARN\0\tTODO\0\bFIX\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\3\ncolor\nerror\ticon\tüêû\balt\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments")
time([[Config for todo-comments]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\5\0\a\0\0176\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\0026\1\0\0009\1\3\1'\3\4\0\18\4\0\0&\3\4\3B\1\2\0016\1\5\0'\3\6\0\18\4\0\0&\3\4\3B\1\2\1K\0\1\0\15Git added \nprint\14:Git add \bcmd\22nvim_buf_get_name\bapi\bvim–\2\1\0\6\0\17\0.6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\0013\0\a\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\b\0\18\5\0\0B\1\4\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\t\0'\5\n\0B\1\4\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\v\0'\5\f\0B\1\4\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\r\0'\5\14\0B\1\4\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0'\4\15\0'\5\16\0B\1\4\1K\0\1\0\19:Git checkout \16<leader>gco\19:Git pull <CR>\15<leader>gP\14:Git push\15<leader>gp\16:Git commit\15<leader>gc\15<leader>ga\0\bGit\bcmd\15<leader>gs\6n\bset\vkeymap\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n∆\2\0\0\4\1\f\0$6\0\0\0009\0\1\0006\1\0\0009\1\1\0019\1\2\1\19\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0006\3\0\0009\3\1\0039\3\2\3\15\0\3\0X\4\3Ä-\3\0\0\14\0\3\0X\4\1Ä4\3\0\0=\3\a\2B\0\2\0016\0\b\0'\2\t\0006\3\0\0009\3\1\0039\3\2\3\15\0\3\0X\4\2Ä'\3\n\0X\4\1Ä'\3\v\0&\2\3\2B\0\2\1K\0\1\0\3¿\rdisabled\fenabled'Telescope ignore patterns are now \nprint\25file_ignore_patterns\1\0\1\25file_ignore_patterns\0\17set_defaults\21telescope.config\frequire\29telescope_ignore_enabled\6g\bvimÿ\a\1\0\v\0.\1x6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0024\2\3\0006\3\3\0009\5\4\0019\5\5\5B\3\2\0?\3\0\0006\3\6\0009\3\a\3\18\5\2\0'\6\b\0B\3\3\0016\3\6\0009\3\a\3\18\5\2\0'\6\t\0B\3\3\0016\3\6\0009\3\a\3\18\5\2\0'\6\n\0B\3\3\0019\3\v\0005\5\r\0005\6\f\0=\2\5\6=\6\14\0055\6\16\0005\a\15\0=\a\17\6=\6\18\5B\3\2\0014\3\0\0006\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a\23\0003\b\24\0005\t\25\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a\26\0006\b\0\0'\n\27\0B\b\2\0029\b\17\b5\t\28\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a\29\0006\b\0\0'\n\27\0B\b\2\0029\b\30\b5\t\31\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a \0006\b\0\0'\n\27\0B\b\2\0029\b!\b5\t\"\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a#\0006\b\0\0'\n\27\0B\b\2\0029\b$\b5\t%\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a&\0006\b\0\0'\n\27\0B\b\2\0029\b'\b5\t(\0B\4\5\0016\4\19\0009\4\20\0049\4\21\4'\6\22\0'\a)\0006\b\0\0'\n\27\0B\b\2\0029\b*\b5\t+\0B\4\5\0016\4\0\0'\6\1\0B\4\2\0029\4,\4'\6-\0B\4\2\0012\0\0ÄK\0\1\0\bfzf\19load_extension\1\0\1\fnoremap\2\vresume\afr\1\0\1\fnoremap\2\16grep_string\afs\1\0\1\fnoremap\2\14live_grep\afg\1\0\1\fnoremap\2\30current_buffer_fuzzy_find\afb\1\0\1\fnoremap\2\14git_files\15<leader>gf\1\0\1\fnoremap\2\22telescope.builtin\aff\1\0\2\fnoremap\2\tdesc%Toggle telescope ignore patterns\0\16<leader>tfi\6n\bset\vkeymap\bvim\fpickers\15find_files\1\0\1\15find_files\0\1\0\1\vhidden\2\rdefaults\1\0\2\fpickers\0\rdefaults\0\1\0\1\22vimgrep_arguments\0\nsetup\15!**/.git/*\v--glob\r--hidden\vinsert\ntable\22vimgrep_arguments\vvalues\vunpack\21telescope.config\14telescope\frequire\3ÄÄ¿ô\4\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: reach.nvim
time([[Config for reach.nvim]], true)
try_loadstring("\27LJ\2\n \1\0\0\a\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0009\5\f\0005\6\r\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\nmarks\t<F3>\1\0\1\fnoremap\2\fbuffers\t<F2>\6n\bset\vkeymap\bvim\1\0\1\18notifications\2\nsetup\nreach\frequire\0", "config", "reach.nvim")
time([[Config for reach.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nå\1\0\0\n\0\n\1\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\3\0006\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0009\b\b\0005\t\t\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\1\0\1\fnoremap\2\vtoggle\t<F4>\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\3ÄÄ¿ô\4\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\n]\0\0\5\0\a\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\0\0009\4\5\0049\4\6\4B\0\4\1K\0\1\0\19UndotreeToggle\bcmd\14<leader>u\6n\bset\vkeymap\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: chadtree
time([[Config for chadtree]], true)
try_loadstring("\27LJ\2\no\0\0\a\0\t\0\f6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0005\6\b\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\tOpen\t<F5>\6n\bset\vkeymap\bvim\rchadtree\frequire\0", "config", "chadtree")
time([[Config for chadtree]], false)

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
