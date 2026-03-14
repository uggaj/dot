(setq package-enable-at-startup nil)
(eval-when-compile
  (require 'use-package))

(setq inhibit-startup-screen t)
(global-auto-revert-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)
(setq confirm-kill-emacs 'y-or-n-p)
(setq use-short-answers t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(set-face-attribute 'default nil :font "SpaceMono Nerd Font" :height 100)
(set-face-attribute 'fixed-pitch nil :font "SpaceMono Nerd Font" :height 100)
(set-face-attribute 'variable-pitch nil :font "SpaceMono Nerd Font" :height 100)
(add-to-list 'default-frame-alist '(font . "SpaceMono Nerd Font-10"))
(setq-default line-spacing 0.12)

(load-theme 'modus-vivendi t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package dashboard
  :init
  (setq initial-buffer-choice 'dashboard-open
        dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-banner-logo-title "Welcome to the Church of Emacs"
        dashboard-startup-banner "~/.config/emacs/images/stallman.png"
        dashboard-items '((recents . 5)
                          (bookmarks . 5)))
  :config
  (dashboard-setup-startup-hook))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 25))

(use-package nerd-icons)

(use-package which-key
  :init
  (which-key-mode)
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t))

(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package treemacs
  :bind ("C-c t" . treemacs)
  :config
  (setq treemacs-width 35
        treemacs-is-never-other-window t))

(use-package treemacs-nerd-icons
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package eglot
  :hook ((rust-mode
          c-mode
          c++-mode
          python-mode
          nix-mode
          asm-mode) . eglot-ensure)
  :config
  (setq eglot-autoshutdown t))

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'eglot-format-buffer nil t)))

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :config
  (setq flymake-fringe-indicator-position 'right-fringe))

(setq eldoc-echo-area-use-multiline-p t)
(setq eldoc-idle-delay 0.1)

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t))

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

(use-package magit
  :commands magit-status
  :bind ("C-x g" . magit-status))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package aggressive-indent
  :hook (prog-mode . aggressive-indent-mode))

(use-package ws-butler
  :hook (prog-mode . ws-butler-mode))

(use-package envrc
  :hook (after-init . envrc-global-mode))

(global-set-key (kbd "C-x b")         'ivy-switch-buffer)
(global-set-key (kbd "C-x C-b")       'ibuffer)
(global-set-key (kbd "C-c r")         'counsel-recentf)
(global-set-key (kbd "M-/")           'hippie-expand)
(global-set-key (kbd "C-c d")         'xref-find-definitions)
(global-set-key (kbd "C-c i")         'xref-find-references)
(global-set-key (kbd "C-c n")         'eglot-rename)
(global-set-key (kbd "C-c a")         'eglot-code-actions)
(global-set-key (kbd "C-c m")         'magit-status)
(global-set-key (kbd "C-x C-<left>")  'windmove-left)
(global-set-key (kbd "C-x C-<right>") 'windmove-right)
(global-set-key (kbd "C-x <up>")      'windmove-up)
(global-set-key (kbd "C-x <down>")    'windmove-down)
(global-set-key (kbd "C-c f")  'flymake-show-buffer-diagnostics)
(global-set-key (kbd "C-c F")  'flymake-show-project-diagnostics)
(global-set-key (kbd "M-n")    'flymake-goto-next-error)
(global-set-key (kbd "M-p")    'flymake-goto-prev-error)

(setq make-backup-files t)
(setq backup-directory-alist '((".*" . "~/.cache/emacs/backups/")))
(setq auto-save-default t)
(setq auto-save-file-name-transforms '((".*" "~/.cache/emacs/auto-saves/" t)))
(setq lock-file-name-transforms '((".*" "~/.cache/emacs/locks/" t)))
(setq custom-file "~/.cache/emacs/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))
