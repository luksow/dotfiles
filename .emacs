;;; Load list
(setq user-modules-path "~/.emacs.d/modules/") ; here go additional modules
(add-to-list 'load-path user-modules-path)
(load (format "%shaskell-mode/haskell-site-file.el" user-modules-path))

;;; Themes & UI
(setq user-themes-path "~/.emacs.d/themes/") ; here goes themes
(add-to-list 'custom-theme-load-path user-themes-path)
(load-theme 'zenburn t) ; set zenburn as theme
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "white"))))
 '(font-lock-function-name-face ((t (:foreground "wheat"))))
 '(font-lock-type-face ((t (:foreground "cornsilk"))))
 '(font-lock-variable-name-face ((t (:foreground "wheat")))))
(setq inhibit-startup-screen t) ; no startup screen
(setq scroll-margin 0 ; some nice scrolling
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
(global-linum-mode t) ; show line numbers on left
(line-number-mode t) ; show line number on bottom bar
(column-number-mode t) ; show column number on bottom bar
(blink-cursor-mode -1) ; no blinking cursor
(tool-bar-mode -1) ; no toolbar
(setq default-frame-alist '((font . "-unknown-Inconsolata-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))) ; set font for graphical window (workaround for emacs --daemon); the value here is taken from (describe-font); Inconsolata font: http://levien.com/type/myfonts/inconsolata.html
(setq-default show-trailing-whitespace t) ; show trailing whitespaces

;;; Global keybindings
(global-set-key [C-tab] 'next-multiframe-window) ; switch windows
(global-set-key (kbd "C-M-d") 'kill-whole-line) ; eclipse-like line killing
(global-set-key (kbd "C-g") 'goto-line) ; goto line

;;; Editing stuff
(delete-selection-mode 1) ; typical delete (select <-> replace <-> delete)
(setq x-select-enable-clipboard t) ; integrate with X clipboard
(setq auto-save-default nil) ; no autosave
(setq make-backup-files nil) ; no backup

;;; Modules
;; c-mode
(setq c-default-style "bsd") ; the only true style
;; org-mode
(setq org-directory "~/Dropbox/Org/") ; home for org files
(setq org-mobile-directory "~/Dropbox/MobileOrg/") ; home for mobile-org files
(setq org-agenda-files (file-expand-wildcards (format "%s/*.org" org-directory))) ; adds all files to the agenda from org-directory set above
(setq org-mobile-inbox-for-pull (format "%s/inbox.org" org-mobile-directory)) ; sets inbox for mobile-org
(global-set-key (kbd "C-c l") 'org-store-link) ; store link in org-mode
(global-set-key (kbd "C-c a") 'org-agenda) ; show agenda
;; tabbar
(require 'tabbar) ; modules/tabbar.el
(tabbar-mode 1) ; show tabbar
(global-set-key (kbd "C-1") 'tabbar-forward-tab) ; forward tab
(global-set-key (kbd "C-2") 'tabbar-backward-tab) ; backward tab
;; haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;;; Minors
(setq user-full-name "Łukasz Sowa") ; genius behind this file
(setq user-mail-address "contact@lukaszsowa.pl") ; contact me

;;; Hacks to be (hopefully) removed
;; fullscreen - there's no official way to do it in emacsclient
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  )
(global-set-key (kbd "<f5>") 'toggle-fullscreen) ; toggle fullscreen

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/Org//dlugi.org" "~/Dropbox/Org//linki.org" "~/Dropbox/Org//notatki.org" "~/Dropbox/Org//todo.org" "~/Dropbox/Org//wakacje.org"))))
