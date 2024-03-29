import { copy, rm } from "https://deno.land/std@0.192.0/fs/mod.ts";
import { join, fromFileUrl, dirname } from "https://deno.land/std@0.152.0/path/posix.ts";
import home_dir from "https://deno.land/x/dir@1.5.1/home_dir/mod.ts";
import { files } from "./files.ts";

const { args, run, remove} = Deno;

const home = home_dir() || '';
const toSync = files;

const __dirname = dirname(fromFileUrl(import.meta.url));

async function addFile(path: string) {
  const toPath = join(__dirname, path);
  await remove(toPath, { recursive : true, }).catch(console.log);

  await copy(join(home, path), toPath, { overwrite: true });

  const command = run({ cmd: ['git', 'add', join(__dirname, path)], cwd: __dirname })
  await command.status();
}


if (args.includes('push')) {
  await Promise.all(toSync.map(path => addFile(path)));
  const status = run({ cmd: ['git', 'status'], cwd: __dirname });
  await status.status();

  const commit = run({ cmd: ['git', 'commit', '-m', 'Update ' + (new Date).toISOString()], cwd: __dirname });

  await commit.status();
  const push = run({ cmd: ['git', 'push'], cwd: __dirname });
  await push.status();
}

if (args.includes('pull')) {
  const pull = run({ cmd: ['git', 'push'], cwd: __dirname });
  await pull.status();

  await Promise.all(toSync.map(path => {
    return copy(join(__dirname, path), join(home, path), { overwrite: true })
  }));
}
