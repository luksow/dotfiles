 ;;; Load list
(setq user-modules-path "~/.emacs.d/modules/") ; here go additional modules
(add-to-list 'load-path user-modules-path)
(add-to-list 'load-path (format "%s/haskell-mode/" user-modules-path))
(add-to-list 'Info-default-directory-list (format "%s/haskell-mode/" user-modules-path))
(add-to-list 'load-path (format "%s/haskell-mode/ghc-mod/" user-modules-path))
(add-to-list 'load-path (format "%s/scala-mode2/" user-modules-path))
(add-to-list 'load-path (format "%s/go" user-modules-path))
(add-to-list 'load-path (format "%sac/" user-modules-path))

;;; Themes & UI
(setq user-themes-path "~/.emacs.d/themes/") ; here go themes
(add-to-list 'custom-theme-load-path user-themes-path)
(if window-system
    (progn
      (load-theme 'zenburn t))) ; set zenburn as theme
(custom-set-faces
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
(setq default-frame-alist '((font . "Inconsolata-10"))) ; set font for graphical window (workaround for emacs --daemon); the value here is taken from (describe-font); Inconsolata font: http://levien.com/type/myfonts/inconsolata.html
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
(put 'narrow-to-region 'disabled nil) ;; easy narrowing (Light Table alike ;))
(which-function-mode t)
(defun clone-buffer-and-narrow-to-function ()
  (interactive)
  (clone-indirect-buffer-other-window (which-function) 'pop-to-buffer)
  (mark-defun)
  (narrow-to-region (mark) (point))
  (pop-mark)
  (other-window 1))
(global-set-key (kbd "C-c n") 'clone-buffer-and-narrow-to-function)

;;; Modules
;; semantic
(semantic-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-idle-local-symbol-highlight-mode t)
(global-semantic-show-unmatched-syntax-mode t)
(global-semantic-idle-summary-mode t)
(global-semantic-highlight-edits-mode t)
(global-semantic-idle-scheduler-mode t)
(global-semanticdb-minor-mode t)
;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (format "%sac/ac-dict" user-modules-path))
(ac-config-default)
;; c-mode
(setq c-default-style "bsd") ; the only true style
;; org-mode
(setq org-directory "~/Dropbox/Org/") ; home for org files
(setq org-mobile-directory "~/Dropbox/MobileOrg/") ; home for mobile-org files
(setq org-agenda-files (file-expand-wildcards (format "%s/todo.org" org-directory))) ; adds files to the agenda from org-directory set above
(setq org-mobile-inbox-for-pull (format "%s/inbox.org" org-mobile-directory)) ; sets inbox for mobile-org
(global-set-key (kbd "C-c l") 'org-store-link) ; store link in org-mode
(global-set-key (kbd "C-c a") 'org-agenda) ; show agenda
;; tabbar
(require 'tabbar) ; modules/tabbar.el
(tabbar-mode 1) ; show tabbar
(global-set-key (kbd "C-1") 'tabbar-forward-tab) ; forward tab
(global-set-key (kbd "C-2") 'tabbar-backward-tab) ; backward tab
;; scala-mode2
(require 'scala-mode2)
(add-hook 'scala-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)
))
;; haskell-mode
(require 'haskell-mode-autoloads)
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda ()
                               (ghc-init)
			       (add-to-list 'ac-sources 'ac-source-ghc-mod)
                               (flymake-mode 1)
			       (global-set-key (kbd "C-M-d") 'kill-whole-line)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'auto-complete-mode)
;; go-lang mode
(require 'go-mode-load)
(require 'go-autocomplete)
(require 'auto-complete-config)
(add-hook 'go-mode-hook 'auto-complete-mode)
;; text-mode
(add-hook 'text-mode-hook 'flyspell-mode) ; spell checking
;; alpine
(add-to-list 'auto-mode-alist '("\/tmp\/pico.[0-9]+" . text-mode)) ; move to text mode on new mail
;; disaster
(require 'disaster)
(add-hook 'c-mode-common-hook (lambda ()
				(define-key c-mode-base-map (kbd "C-c d") 'disaster)))
;; dirtree
(require 'dirtree)
(global-set-key (kbd "<f6>") 'dirtree)

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
;; key corrections
(define-key input-decode-map "\e[1;2A" [S-up])
(define-key input-decode-map "\e[1;2B" [S-down])
(define-key input-decode-map "\e[1;2C" [S-right])
(define-key input-decode-map "\e[1;2D" [S-left])
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])
(define-key input-decode-map "\e[1;6A" [C-S-up])
(define-key input-decode-map "\e[1;6B" [C-S-down])
(define-key input-decode-map "\e[1;6C" [C-S-right])
(define-key input-decode-map "\e[1;6D" [C-S-left])
