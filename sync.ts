import { copy } from "https://deno.land/std@0.152.0/fs/mod.ts";
import { join } from "https://deno.land/std@0.152.0/path/posix.ts";
import home_dir from "https://deno.land/x/dir@1.5.1/home_dir/mod.ts";
import { files } from "./files.ts";

const { args } = Deno;

const { run } = Deno;

const home = home_dir() || '';
const toSync = files;

async function addFile(path: string) {
    await copy(join(home, path), join('./', path), { overwrite: true });

    console.log('Adding', path);

    const command = run({ cmd: ['git', 'add', '.'] })
    await command.status();
}


if (args.includes('push')) {
    await Promise.all(toSync.map(path => addFile(path)));
    const commit = run({ cmd: ['git', 'commit', '-m', 'Update ' + (new Date).toISOString()] });

    await commit.status();
    const push = run({ cmd: ['git', 'push'] });
    await push.status();
}

if (args.includes('pull')) {
    await Promise.all(toSync.map(path => {
        return copy(join('./', path), join(home, path), { overwrite: true })
    }));
}