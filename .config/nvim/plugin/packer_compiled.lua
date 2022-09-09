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
  everblush = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/everblush",
    url = "https://github.com/Everblush/everblush.nvim"
  },
  firenvim = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30galaxyline.themes.eviline\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/NTBBloodbath/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  lspconfig = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-markdown-preview"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-markdown-preview",
    url = "https://github.com/davidgranstrom/nvim-markdown-preview"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n’\1\0\0\a\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0'\5\b\0005\6\t\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\27:Telescope neoclip<cr>\r<space>m\6n\bset\vkeymap\bvim\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
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
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["reach.nvim"] = {
    config = { "\27LJ\2\nØ\1\0\0\n\0\14\1\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0006\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\b\0009\b\t\0005\t\n\0B\4\5\2>\4\1\0036\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\v\0009\b\f\0005\t\r\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\1\0\1\fnoremap\2\nmarks\t<F3>\1\0\1\fnoremap\2\fbuffers\t<F2>\6n\bset\vkeymap\bvim\1\0\1\18notifications\2\nsetup\nreach\frequire\5€€À™\4\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/reach.nvim",
    url = "https://github.com/toppair/reach.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nî\3\0\0\b\0\25\0C6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0006\5\0\0'\a\b\0B\5\2\0029\5\t\0055\6\n\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\v\0006\5\0\0'\a\b\0B\5\2\0029\5\f\0055\6\r\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\14\0006\5\0\0'\a\b\0B\5\2\0029\5\15\0055\6\16\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\17\0006\5\0\0'\a\b\0B\5\2\0029\5\18\0055\6\19\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\20\0006\5\0\0'\a\b\0B\5\2\0029\5\21\0055\6\22\0B\1\5\0016\1\0\0'\3\1\0B\1\2\0029\1\23\1'\3\24\0B\1\2\1K\0\1\0\bfzf\19load_extension\1\0\1\fnoremap\2\vresume\afr\1\0\1\fnoremap\2\16grep_string\afs\1\0\1\fnoremap\2\14live_grep\afg\1\0\1\fnoremap\2\30current_buffer_fuzzy_find\afb\1\0\1\fnoremap\2\15find_files\22telescope.builtin\aff\6n\bset\vkeymap\bvim\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nŒ\1\0\0\n\0\n\1\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\3\0006\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0009\b\b\0005\t\t\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\1\0\1\fnoremap\2\vtoggle\t<F4>\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/goranslettemark/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30galaxyline.themes.eviline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n’\1\0\0\a\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0'\5\b\0005\6\t\0B\1\5\1K\0\1\0\1\0\1\fnoremap\2\27:Telescope neoclip<cr>\r<space>m\6n\bset\vkeymap\bvim\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: reach.nvim
time([[Config for reach.nvim]], true)
try_loadstring("\27LJ\2\nØ\1\0\0\n\0\14\1\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0006\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\b\0009\b\t\0005\t\n\0B\4\5\2>\4\1\0036\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\v\0009\b\f\0005\t\r\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\1\0\1\fnoremap\2\nmarks\t<F3>\1\0\1\fnoremap\2\fbuffers\t<F2>\6n\bset\vkeymap\bvim\1\0\1\18notifications\2\nsetup\nreach\frequire\5€€À™\4\0", "config", "reach.nvim")
time([[Config for reach.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\n\0\n\1\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\3\0006\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0009\b\b\0005\t\t\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\1\0\1\fnoremap\2\vtoggle\t<F4>\6n\bset\vkeymap\bvim\nsetup\ftrouble\frequire\3€€À™\4\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nî\3\0\0\b\0\25\0C6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0006\5\0\0'\a\b\0B\5\2\0029\5\t\0055\6\n\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\v\0006\5\0\0'\a\b\0B\5\2\0029\5\f\0055\6\r\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\14\0006\5\0\0'\a\b\0B\5\2\0029\5\15\0055\6\16\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\17\0006\5\0\0'\a\b\0B\5\2\0029\5\18\0055\6\19\0B\1\5\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\20\0006\5\0\0'\a\b\0B\5\2\0029\5\21\0055\6\22\0B\1\5\0016\1\0\0'\3\1\0B\1\2\0029\1\23\1'\3\24\0B\1\2\1K\0\1\0\bfzf\19load_extension\1\0\1\fnoremap\2\vresume\afr\1\0\1\fnoremap\2\16grep_string\afs\1\0\1\fnoremap\2\14live_grep\afg\1\0\1\fnoremap\2\30current_buffer_fuzzy_find\afb\1\0\1\fnoremap\2\15find_files\22telescope.builtin\aff\6n\bset\vkeymap\bvim\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
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
