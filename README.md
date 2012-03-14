dotfiles
========

This repo contains configs for tools used by me every day.

Emacs
-----

I prefer to use Emacs version compiled by myself. It guarantees that my editor
is always up-to-date. I don't use any packages from my Linux distro so that I
can easily port my environment to any other machine. I just compile Emacs, pull
this repo and that's it. No dependencies - no problems.

I typically start Emacs as daemon (emacs --daemon) at startup. Then I just
connect to it using emacsclient (emacsclient -c -n). It's fast (almost as fast
as vim ;)) and convenient.

Files:
* .emacs.d/ - modules and themes
* .emacs - standard init file

bash
----

I don't configure bash in any special way - I just use some aliases.

Files:
* .bashrc - aliases