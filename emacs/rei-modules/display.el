;;; display.el --- Additional theme functionality
;; -*- lexical-binding: t; -*-


;(use-package gruvbox-theme
 ; :ensure t
 ; :config
 ; (load-theme 'gruvbox-dark-hard t))

;;; Commentary:
;; 

;;; Code:

(load-theme 'crowview t)
;(set-face-background hl-line-face "navy")

(global-hl-line-mode t)

(when (display-graphic-p)
  (setq default-frame-alist
        '((font . "ProggyCleanTT-18:antialias=true:hinting=true")
          (vertical-scroll-bars . nil)
          (horizontal-scroll-bars . nil))))

(when (display-graphic-p)
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (set-fringe-mode 0)
  (window-divider-mode -1))
 
(setq inhibit-startup-message t
      visible-bell nil)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(xterm-mouse-mode t)

(provide 'display)

;;; display.el ends here
