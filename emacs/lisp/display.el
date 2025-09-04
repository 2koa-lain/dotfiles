;;; display.el --- Additional theme functionality -*- lexical-binding: t; -*-

;;; Commentary:
;; 

;;; Code:

(load-theme 'modus-vivendi)


(global-hl-line-mode t)

(defun maji/display ()
  (set-face-attribute 'default nil :family "ProggyCleanTT" :height 172)
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (set-fringe-mode 0)
  (window-divider-mode -1)
  
  (setq inhibit-startup-message t
	visible-bell nil)

  (add-hook 'prog-mode-hook 'display-line-numbers-mode)
  (xterm-mouse-mode t))


(provide 'display)

;;; display.el ends here
