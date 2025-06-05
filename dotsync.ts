import { copy } from "https://deno.land/std@0.192.0/fs/mod.ts";
import { join, fromFileUrl, dirname } from "https://deno.land/std@0.152.0/path/posix.ts";
import home_dir from "https://deno.land/x/dir@1.5.1/home_dir/mod.ts";
import { files } from "./files.ts";

const { args, remove } = Deno;

const home = home_dir() || '';
const toSync = files;

const __dirname = dirname(fromFileUrl(import.meta.url));

async function runGitCommand(argsCmd: string[]) {
  const command = new Deno.Command('git', { args: argsCmd, cwd: __dirname }).spawn();
  await command.status;
}

async function addFile(path: string) {
  const toPath = join(__dirname, path);
  await remove(toPath, { recursive : true, }).catch(console.log);

  await copy(join(home, path), toPath, { overwrite: true });
}


if (args.includes('push')) {
  await Promise.all(toSync.map(path => addFile(path)));
  await runGitCommand(['add', '.']);
  await runGitCommand(['status']);

  await runGitCommand(['commit', '-m', 'Update ' + (new Date).toISOString()]);
  await runGitCommand(['push']);
}

if (args.includes('pull')) {
  await runGitCommand(['pull']);

  await Promise.all(toSync.map(path => {
   return copy(join(__dirname, path), join(home, path), { overwrite: true })
  }));
}
