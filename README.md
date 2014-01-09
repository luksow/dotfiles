dotfiles
========

This repo contains configs for tools used by me every day.

Emacs
-----

I prefer to use Emacs version compiled by myself. It guarantees that my editor
is always up-to-date. I don't use any packages from my Linux distro so that I
can easily port my environment to any other machine. I just compile Emacs, pull
this repo and that's it. No dependencies - no problems.

Files:
* .emacs.d/ - modules and themes
* .emacs - standard init file, it's well-commented

Xmonad
------

Xmonad is the best WM I've ever used. It really rocks! Just check it out! I
spent awful lot of time configuring it but now it boosts my productivity
every day. I use it together with xmobar and trayer.

Files:
* .xmonad/xmonad.hs - main configuration file
* .xmonad/xmobar.hs - xmobar configuration file
* .xmonad/*.sh - helpers scripts for xmobar

conky
-----

I use conky for on-desktop 14-days agenda straight from Emacs org-mode. It's
just great!

Files:
* .conkyrc - standard rc file

zsh
---

I recently switched from bash to zsh as it's more feature-rich. My config for
zsh contains some aliases, keybindings, custom prompt, custom file names
completion and some history tweaks.

Files:
* .zshrc - standard rc file

alpine
------

Nothing really to describe, just basic email client configuration :).

Files:
* .pinerc - standard rc file

tmux
----

Just xterm keys.

Files:
* .tmux.conf - standard conf file

xinit
-----

Just some basic settings for starting bare xmonad.

Files:
* .xinitrc