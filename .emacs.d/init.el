(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(load-theme 'zenburn t)

(require 'neotree)
(global-set-key (kbd "<f6>") 'neotree)

(tool-bar-mode 0)
(menu-bar-mode 0)
(toggle-frame-fullscreen)
(scroll-bar-mode 0)
(fset `yes-or-no-p `y-or-n-p)
(global-linum-mode t)
(line-number-mode t)
(column-number-mode t)
(blink-cursor-mode -1)
(setq default-frame-alist '((font . "Inconsolata-10")))

(setq-default show-trailing-whitespace t)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-c C-m") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-=") 'zoom-frm-in)
(global-set-key (kbd "C--") 'zoom-frm-out)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (ensime neotree helm zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key [C-tab] 'other-window)
(global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "C-g") 'goto-line)

(delete-selection-mode 1)
(setq auto-save-default nil)
(setq make-backup-files nil)

(put 'narrow-to-region 'disabled nil)
(which-function-mode t)
(defun clone-buffer-and-narrow-to-function ()
  (interactive)
  (clone-indirect-buffer-other-window (which-function) 'pop-to-buffer)
  (mark-defun)
  (narrow-to-region (mark) (point))
  (pop-mark)
  (other-window 1))
(global-set-key (kbd "C-c n") 'clone-buffer-and-narrow-to-function)
