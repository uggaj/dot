
(require 'use-package)
(setq use-package-always-ensure nil)

(setq use-package-compute-statistics t)

(setq read-process-output-max (* 1024 1024))

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

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-challenger-deep t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; (use-package kanagawa-themes
;;   :config
;;   (setq kanagawa-themes-comment-italic t      ;; Italic comments
;;         kanagawa-themes-keyword-italic t      ;; Italic keywords
;;         kanagawa-themes-org-agenda-height t   ;; Varying org agenda heights
;;         kanagawa-themes-org-bold t            ;; Bold org headings
;;         kanagawa-themes-org-height t          ;; Varying org heading heights
;;         kanagawa-themes-org-highlight t       ;; Highlight org headings
;;         kanagawa-themes-org-priority-bold t)  ;; Bold priority items in agenda
;;   (load-theme 'kanagawa-wave t))

;; (add-to-list 'custom-theme-load-path
;;              (expand-file-name "themes" user-emacs-directory))
;; (load-theme 'embark t)

(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package dashboard
  :init
  (setq initial-buffer-choice 'dashboard-open
        dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-banner-logo-title "Descend. The abyss has been expecting you since before you knew you were falling. Welcome to the Church of Emacs"
        dashboard-startup-banner "~/.config/emacs/images/church.png"
        dashboard-items '((recents . 5)
                          (bookmarks . 5)))
  :config
  (dashboard-setup-startup-hook)
  (custom-set-faces
   '(dashboard-banner-logo-title ((t (:height 1.0 :weight bold))))))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 28)
  (doom-modeline-bar-width 5)
  (doom-modeline-window-width-limit 110)
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-lsp-icon t)
  (doom-modeline-vcs-icon t)
  (doom-modeline-check-icon t)
  (doom-modeline-lsp t)
  (doom-modeline-check 'auto)
  (doom-modeline-vcs-max-length 20)
  (doom-modeline-buffer-name t)
  (doom-modeline-highlight-modified-buffer-name t)
  (doom-modeline-enable-buffer-position t)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-selection-info t)
  (doom-modeline-position-column-line-format '("%l:%c"))
  (doom-modeline-column-zero-based nil)
  (doom-modeline-minor-modes nil)
  (doom-modeline-battery t)
  (doom-modeline-time t)
  (doom-modeline-github nil)
  (doom-modeline-mu4e nil)
  (doom-modeline-gnus nil)
  (doom-modeline-irc nil)
  (doom-modeline-env-version nil)
  (doom-modeline-project-name t)
  (doom-modeline-unicode-number t)
  (doom-modeline-number-limit 99)
  :config
  (setq doom-modeline-spc-face-overrides
        (list :family (face-attribute 'fixed-pitch :family)))

  (doom-modeline-def-segment my-buffer-info
    "buffer-info with a leading space for breathing room."
    (concat " " (doom-modeline-segment--buffer-info)))

  (doom-modeline-def-modeline 'my-main
    '(bar window-number modals matches my-buffer-info remote-host)
    '(misc-info battery grip irc mu4e gnus github debug repl lsp minor-modes
                indent-info buffer-encoding major-mode process vcs check))

  (add-hook 'doom-modeline-mode-hook
            (lambda () (doom-modeline-set-modeline 'my-main t)))

  (custom-set-faces
   '(mode-line ((t (:box (:line-width 4 :style flat-button)))))
   '(mode-line-inactive ((t (:box (:line-width 4 :style flat-button)))))))

(setq inhibit-compacting-font-caches t)

(setq display-time-format "%H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1)
(display-battery-mode 1)

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
  :bind (("C-c t" . treemacs)
         ("M-0" . treemacs-select-window))
  :config
  (setq treemacs-width 35
        treemacs-is-never-other-window t))

(use-package treemacs-nerd-icons
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package eglot
  :hook ((rust-ts-mode rust-mode
          c-ts-mode c-mode
          c++-ts-mode c++-mode
          python-ts-mode python-mode
          nix-ts-mode nix-mode
          nasm-ts-mode
          asm-mode) . eglot-ensure)
  :config
  (setq eglot-autoshutdown t)
  (add-to-list 'eglot-server-programs
               '(asm-mode . ("asm-lsp"))))

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'eglot-format-buffer nil t)))

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :config
  (setq flymake-fringe-indicator-position 'right-fringe))

(setq eldoc-echo-area-use-multiline-p t)
(setq eldoc-idle-delay 0.5)
(setq eldoc-echo-area-prefer-doc-buffer t)

(use-package eldoc-box
  :after eglot
  :hook (eglot-managed-mode . eldoc-box-hover-at-point-mode)
  :config
  (setq eldoc-box-max-pixel-width 600
        eldoc-box-max-pixel-height 400
        eldoc-box-only-multi-line nil))

(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 1
        company-tooltip-align-annotations t
        company-begin-commands '(self-insert-command)))

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
  :hook (emacs-lisp-mode . aggressive-indent-mode))

(use-package ws-butler
  :hook (prog-mode . ws-butler-mode))

(use-package envrc
  :hook (after-init . envrc-global-mode))

(use-package treesit-auto
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

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
