# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository for shell configuration (bash and zsh), managed via symlinks. The repo is cloned to `~/.dotfiles` and dotfiles are symlinked into `$HOME`.

## Setup

- **Bootstrap**: `script/bootstrap` — symlinks all top-level dotfiles (`.` prefixed files) into `$HOME`, sets up `.gitconfig` from template, and installs oh-my-zsh custom plugins
- **Brew update**: `brew/update.sh` — snapshots current Homebrew formulae and global npm packages

## Architecture

**Shell loading order (bash):** `.bashrc` sources `.bash_profile`, which sources `~/.{path,bash_prompt,exports,aliases,functions,extra,alias-*}` in a loop.

**Shell loading order (zsh):** `.zshrc` uses oh-my-zsh with custom dir at `$HOME/.dotfiles/oh-my-zsh-custom`. Custom theme: `vkotovs`. Plugins: git, z, colored-man-pages, zsh-syntax-highlighting, zsh-autosuggestions.

**Key files:**
- `.exports` — base env vars; sources machine-specific `.exports.local.<hostname>` automatically
- `.functions` — utility shell functions (docker helpers, kafka helpers, archive extraction, http tools)
- `.alias-*` — domain-specific aliases (docker, maven, gradle, doctl, sqlplus, shortcuts)
- `.bash_prompt` — Solarized Dark bash prompt with git status indicators
- `git/.gitconfig.template` — template with `AUTHORNAME`/`AUTHOREMAIL` placeholders, filled by bootstrap

**Conventions:**
- Machine-specific exports go in `.exports.local.<hostname>` (gitignored via `.exports.local.*` pattern — currently only `.exports.local.dazzler` and `.exports.local.pyro` are tracked)
- The `.gitignore` ignores `brew/Brewfile.1` and `brew/npmfile.1` (backup files from `brew/update.sh`)
- Git aliases: `g` = git, `co` = checkout, `st` = status, `br` = branch, `ci` = commit, `lg` = pretty log graph
