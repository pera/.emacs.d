(setq-default inhibit-splash-screen t)
(setq initial-scratch-message "")
(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)
(setq require-final-newline t)
(windmove-default-keybindings)

(set-face-attribute 'default nil :font "Source Code Pro-10:weight=regular")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'subatomic t)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#d44")
(set-face-attribute 'show-paren-match nil :weight 'bold)
(tool-bar-mode -1)
(column-number-mode t)
(global-linum-mode t)
(setq linum-format 'dynamic)
(defadvice linum-update-window (around linum-dynamic activate) (let* ((w (length (number-to-string (count-lines (point-min) (point-max))))) (linum-format (concat " %" (number-to-string w) "d "))) ad-do-it))
(setq show-paren-delay 0)
(show-paren-mode 1)
(global-hl-line-mode t)
(mouse-avoidance-mode 'cat-and-mouse)
(setq mouse-yank-at-point t)
(setq scroll-conservatively 1000)

(require 'recentf)
(recentf-mode 1)

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")))
(package-initialize)

(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-auto-connect 'ask)
(require 'slime)
(slime-setup '(slime-fancy))

(require 'evil)
(evil-mode 1)

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'undefined)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
