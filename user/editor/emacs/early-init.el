(setq gc-cons-threshold 100000000)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216)))

(setq package-enable-at-startup nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tab-bar-mode 1)

(setq inhibit-startup-screen t)

(setq frame-resize-pixelwise t)
(setq frame-inhibit-implied-resize t)
