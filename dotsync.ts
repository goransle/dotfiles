import { join, fromFileUrl, dirname } from "https://deno.land/std@0.152.0/path/posix.ts";
import home_dir from "https://deno.land/x/dir@1.5.1/home_dir/mod.ts";
import { files } from "./files.ts";

const { args, run, copyFile } = Deno;

const home = home_dir() || '';
const toSync = files;

const __dirname = dirname(fromFileUrl(import.meta.url));

async function addFile(path: string) {
  await copyFile(join(home, path), join(__dirname, path));

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
    return copyFile(join(__dirname, path), join(home, path))
  }));
}
