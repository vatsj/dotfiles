# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal *nix dotfiles managed with GNU Stow. The repo contains **dotfiles, not code** — the only executable file is the `Makefile`. Compatibility target: arbitrary *nix systems (tested on Ubuntu 18+, also used on macOS).

Guiding principle: keep configs minimal and rely on each tool's defaults wherever possible. When editing, prefer removing settings over adding them.

## Common commands

All operations go through `make` and operate on `${HOME}` as the target directory:

- `make symlink-dotfiles` — main install. Moves any pre-existing dotfiles in `~` into `~/replaced_dotfiles/`, then `stow`s this repo into `~`.
- `make fake-symlink` — dry run (`stow -n -v`), shows what would change without touching the filesystem.
- `make adopt-dotfiles` — `stow --adopt`; pulls existing files in `~` *into* this repo, overwriting the repo's version. Use with care.
- `make unlink-dotfiles` — removes all stow-managed symlinks.
- `make clear-dotfiles` — only moves existing dotfiles to `~/replaced_dotfiles/` without installing. Note: the Makefile header comment says this target is "FAILING ON MAC".

After cloning, also run `git submodule init && git submodule update` to fetch the vim (Vundle) and tmux (tpm) plugin managers, then `:PluginInstall` inside vim and `prefix + I` inside tmux to install plugins.

## How stow controls what gets linked

`.stow-local-ignore` is the single source of truth for what is excluded from symlinking. By default it ignores everything matching `^/[^.].*` (non-dotfiles at repo root), plus `Makefile`, `README*`, `.git*`, `.DS_Store`, and `*.swp`. Consequence: **adding a new top-level non-dotfile to the repo will be silently ignored** unless you also touch this file. Adding a new dotfile, by contrast, gets stowed automatically.

## Layout conventions

- Top-level dotfiles (`.vimrc`, `.tmux.conf`, `.bashrc`, `.zshrc`, etc.) are stowed directly into `~`.
- Submodules under `.vim/bundle/Vundle.vim` and `.tmux/plugins/tpm` are pinned plugin managers; everything else they install is gitignored (`.vim/bundle/*`, `.tmux/plugins/*`).
- `old/` holds archived configs and is not stowed.
- Secrets are sourced from a `secrets.sh` (gitignored) loaded by `.bashrc`/`.zshrc` — currently the `source secrets.sh` lines are commented out in both. `.env` is also gitignored.

## Cross-machine gotchas

The `.bashrc` and `.zshrc` contain hardcoded absolute paths from the original author's machines (e.g. `/Users/jstav/miniconda3`, `/home/jstav/anaconda3`, `/home/jstav/gems`, mujoco/nvidia `LD_LIBRARY_PATH` entries). These paths will not exist on a fresh machine. When changes are needed on a new host, edit them in-repo (so the symlink picks them up) rather than editing the symlinked file in `~`.

`TODO.md` flags "no conda pls" and "symlink ur .rc reasonably" as known cleanup work — be aware that the rc files are mid-migration.
