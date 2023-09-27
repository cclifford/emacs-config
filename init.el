;; -*- lexical-binding: t; -*-

(defun udir (x) (concat user-emacs-directory x))
(add-to-list 'load-path (udir "local"))
(add-to-list 'load-path (udir "extra"))
(add-to-list 'load-path (udir "chatgpt-shell"))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(require 'use-package)
(require 'company)

(use-package company
  :bind (("C-c C-/" . company-complete))
  :config (global-company-mode))

(use-package julia-mode
  :mode ("\\.jl\\'" . julia-mode))

(use-package markdown-mode)

(use-package conda
  :init (setq conda-anaconda-home (expand-file-name "~/.local/share/miniconda/"))
  :config (progn
			(conda-env-initialize-interactive-shells)
			(conda-env-initialize-eshell)
			(conda-env-activate "drones")))

(use-package undo-tree
  :config (global-undo-tree-mode))

(use-package which-key
  :config (which-key-mode))

(use-package auth-source-pass
  :init (auth-source-pass-enable))

(use-package link-hint
  :ensure t
  :bind ("C-c o" . link-hint-open-link))

(use-package multiple-cursors
  :bind (("C->" . 'mc/mark-next-like-this)
		 ("C-<" . 'mc/mark-previous-like-this)
		 ("C-|" . 'mc/mark-all-like-this)
		 ("C-c |" . 'mc/edit-lines)))

(use-package projectile
  :bind (("C-c p". projectile-command-map))
  :config (projectile-mode +1))

;(setq TeX-auto-save t
;      TeX-parse-self t
;      TeX-view-program-selection '(("Okular" "okular"))
;      TeX-view-program-selection '((output-pdf "Okular")))

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode 'flyspell-mode)
(add-hook 'notmuch-message-mode-hook flyspell-mode)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(setq-default TeX-master nil)

;; Other, more specific config files
(setq custom-file (udir "local/customizations.el"))
(require 'backup-autosave)
(require 'customizations)
(require 'treesit-config)
(require 'mykeys)
(require 'myeww)
(require 'my-info)
(require 'my-nov)
(require 'ansible-config)
(require 'eglot-jl)
(require 'chatgpt-shell)
(require 'dall-e-shell)

(setq
 chatgpt-shell-openai-key (auth-source-pick-first-password :host "api.openai.com")
 dall-e-shell-openai-key (auth-source-pick-first-password :host "api.openai.com"))



(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(defvaralias 'ngnix-indent-level 'tab-width)

(setq-default indent-tabs-mode t)
(defvaralias 'nginx-indent-tabs-mode 'indent-tabs-mode)

(setq display-time-day-and-date t)
(display-time)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
(setq visible-bell t)

(add-to-list 'auto-mode-alist
			 '("\\.epub\\'" . nov-mode))

(windmove-default-keybindings)
(global-auto-revert-mode)
