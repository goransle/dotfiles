import system from "https://deno.land/x/dos@v0.11.0/os/systemInfo.ts";

const macOnly = [
    'bunches'
]

export const files = [
    '.config/nvim',
    '.zshrc',
].concat(system.platform() === 'darwin' ? macOnly : [])
