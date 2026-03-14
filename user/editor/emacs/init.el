(setq package-enable-at-startup nil)

(eval-when-compile
  (require 'use-package))

(setq inhibit-startup-screen t)
(global-auto-revert-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)

(dolist (face '(default menu mode-line mode-line-inactive tooltip))
  (set-face-attribute face nil :font "SpaceMono Nerd Font" :height 100))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package dashboard
  :init
  (setq initial-buffer-choice 'dashboard-open
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
  :bind (("C-c t" . treemacs))
  :config
  (setq treemacs-width 35
        treemacs-is-never-other-window t))

(use-package treemacs-nerd-icons
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package magit
  :commands magit-status
  :bind (("C-x g" . magit-status)))

(use-package which-key
  :init
  (which-key-mode)
  :config
  (setq which-key-idle-delay 0.3))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package eglot
  :hook ((rust-mode
          c-mode
          c++-mode
          python-mode
          nix-mode
          asm-mode) . eglot-ensure))

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'eglot-format-buffer nil t)))

(global-set-key (kbd "C-x b") 'ivy-switch-buffer)       
(global-set-key (kbd "C-x C-b") 'ibuffer)     
(global-set-key (kbd "C-c r") 'counsel-recentf)      
(global-set-key (kbd "M-/") 'hippie-expand)      
(global-set-key (kbd "C-c d") 'xref-find-definitions) 
(global-set-key (kbd "C-c i") 'xref-find-references)             
(global-set-key (kbd "C-c m") 'magit-status)    

(global-set-key (kbd "C-x C-<left>")  'windmove-left)
(global-set-key (kbd "C-x C-<right>") 'windmove-right)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <down>")  'windmove-down)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(use-package aggressive-indent
  :hook (prog-mode . aggressive-indent-mode))

(use-package ws-butler
  :hook (prog-mode . ws-butler-mode))

(setq confirm-kill-emacs 'y-or-n-p)
(fset 'yes-or-no-p 'y-or-n-p)
