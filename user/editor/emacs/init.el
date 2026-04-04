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

(set-face-attribute 'default    nil :font "SpaceMono Nerd Font" :height 100)
(set-face-attribute 'fixed-pitch nil :font "SpaceMono Nerd Font" :height 100)
(set-face-attribute 'variable-pitch nil :font "SpaceMono Nerd Font" :height 100)
(add-to-list 'default-frame-alist '(font . "SpaceMono Nerd Font-10"))
(setq-default line-spacing 0)

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))
(load-theme 'challenger-deep t)

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
  :demand t
  :config
  (require 'org-faces)
  (setq org-hide-emphasis-markers t)
  (setq org-image-actual-width nil)
  (setq org-startup-with-inline-images t)
  (dolist (face '(org-block org-table org-formula org-code
                  org-verbatim org-special-keyword
                  org-meta-line org-checkbox))
    (set-face-attribute face nil :inherit 'fixed-pitch)))

(use-package visual-fill-column
  :commands visual-fill-column-mode
  :init
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t))

(use-package org-present
  :commands org-present
  :bind (:map org-present-mode-keymap
              ("<right>" . org-present-next)
              ("<left>"  . org-present-prev)
              ("q"       . org-present-quit))
  :config
  (defun my/org-present-prepare-slide (_buffer-name _heading)
    (org-overview)
    (org-show-entry)
    (org-show-children))
  (defun my/org-present-start ()
    (setq-local face-remapping-alist
                `((default              (:height 1.8) variable-pitch)
                  (org-document-title   (:height 2.0) org-document-title)
                  (org-level-1          (:height 1.4) org-level-1)
                  (org-level-2          (:height 1.2) org-level-2)))
    (setq-local header-line-format " ")
    (face-remap-add-relative 'header-line '(:height 5.0 :background "#CECECE" :box nil :underline nil))
    (face-remap-add-relative 'org-link '(:underline nil))
    (setq-local visual-fill-column-width 72)
    (setq-local visual-fill-column-center-text t)
    (visual-fill-column-mode 1)
    (visual-line-mode 1)
    (setq-local mode-line-format nil))
  (defun my/org-present-end ()
    (kill-local-variable 'face-remapping-alist)
    (kill-local-variable 'header-line-format)
    (face-remap-reset-base 'header-line)
    (face-remap-reset-base 'org-link)
    (visual-fill-column-mode 0)
    (visual-line-mode 0)
    (kill-local-variable 'mode-line-format))
  (add-hook 'org-present-mode-hook       #'my/org-present-start)
  (add-hook 'org-present-mode-quit-hook  #'my/org-present-end)
  (add-hook 'org-present-after-navigate-functions #'my/org-present-prepare-slide))

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
