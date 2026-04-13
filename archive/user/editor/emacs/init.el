;; -*- lexical-binding: t -*-

(require 'use-package)
(setq use-package-always-ensure nil)
(setq read-process-output-max (* 1024 1024))

(global-auto-revert-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)
(setq confirm-kill-emacs 'y-or-n-p)
(setq use-short-answers t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq inhibit-compacting-font-caches t)

(set-face-attribute 'default    nil :font "SpaceMono Nerd Font Propo" :height 105)
(set-face-attribute 'fixed-pitch nil :font "SpaceMono Nerd Font Propo" :height 105)
(add-to-list 'default-frame-alist '(font . "SpaceMono Nerd Font Propo-10"))
(setq-default line-spacing 0)

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))
(load-theme 'challenger-deep t)

(custom-set-faces
 '(font-lock-keyword-face       ((t (:slant italic))))
 '(font-lock-function-name-face ((t (:slant italic))))
 '(font-lock-type-face          ((t (:slant italic))))
 '(font-lock-comment-face       ((t (:slant italic))))
 '(font-lock-builtin-face       ((t (:slant italic)))))

(setq-default mode-line-format
              '(" "
                mode-line-buffer-identification
                "  %l:%c"
                "  "
                mode-line-modes
                "  "
                (vc-mode vc-mode)
                "  "
                mode-line-misc-info))

(setq display-time-format "%H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1)
(display-battery-mode 1)

(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(use-package org
  :config
  (setq org-hide-emphasis-markers nil)
  (setq org-image-actual-width nil)
  (setq org-startup-with-inline-images t))

(use-package ivy
  :init (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t))

(use-package counsel
  :after ivy
  :config (counsel-mode 1))

(use-package which-key
  :init (which-key-mode)
  :config (setq which-key-idle-delay 0.4))

(use-package eglot
  :hook ((rust-ts-mode rust-mode
          c-ts-mode    c-mode
          c++-ts-mode  c++-mode
          python-ts-mode python-mode
          nix-ts-mode  nix-mode
          nasm-ts-mode
          asm-mode) . eglot-ensure)
  :config
  (setq eglot-autoshutdown t)
  (add-to-list 'eglot-server-programs
               '((asm-mode) . ("asm-lsp"))))

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'eglot-format-buffer nil t)))

(setq eldoc-echo-area-use-multiline-p t)
(setq eldoc-idle-delay 0.5)
(setq eldoc-echo-area-prefer-doc-buffer t)

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :config
  (setq flymake-fringe-indicator-position 'right-fringe))

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t
        company-tooltip-limit 10
        company-begin-commands '(self-insert-command)))

(use-package treesit-auto
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

(use-package magit
  :commands magit-status
  :bind ("C-x g" . magit-status))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package ws-butler
  :hook (prog-mode . ws-butler-mode))

(use-package envrc
  :hook (after-init . envrc-global-mode))

(global-set-key (kbd "C-x b")         #'ivy-switch-buffer)
(global-set-key (kbd "C-x C-b")       #'ibuffer)
(global-set-key (kbd "C-c r")         #'counsel-recentf)
(global-set-key (kbd "M-/")           #'hippie-expand)
(global-set-key (kbd "C-c d")         #'xref-find-definitions)
(global-set-key (kbd "C-c i")         #'xref-find-references)
(global-set-key (kbd "C-c n")         #'eglot-rename)
(global-set-key (kbd "C-c a")         #'eglot-code-actions)
(global-set-key (kbd "C-c m")         #'magit-status)
(global-set-key (kbd "C-x C-<left>")  #'windmove-left)
(global-set-key (kbd "C-x C-<right>") #'windmove-right)
(global-set-key (kbd "C-x <up>")      #'windmove-up)
(global-set-key (kbd "C-x <down>")    #'windmove-down)
(global-set-key (kbd "C-c f")         #'flymake-show-buffer-diagnostics)
(global-set-key (kbd "C-c F")         #'flymake-show-project-diagnostics)
(global-set-key (kbd "M-n")           #'flymake-goto-next-error)
(global-set-key (kbd "M-p")           #'flymake-goto-prev-error)

(setq make-backup-files t)
(setq backup-directory-alist '((".*" . "~/.cache/emacs/backups/")))
(setq auto-save-default t)
(setq auto-save-file-name-transforms '((".*" "~/.cache/emacs/auto-saves/" t)))
(setq lock-file-name-transforms '((".*" "~/.cache/emacs/locks/" t)))
(setq custom-file "~/.cache/emacs/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))
