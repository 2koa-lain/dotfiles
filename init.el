;; ===============================
;; Magica-Faux EMACS Configuration
;; Date of Creation: 17Mar2025
;; ===============================
(require 'package)
(setopt package-archives
        '(("gnu" . "https://elpa.gnu.org/packages/")
          ("nongnu" . "https://elpa.nongnu.org/nongnu/")
          ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(add-hook 'after-init-hook 'global-company-mode)
(yas-global-mode 1)

(add-hook 'c-mode-hook 'lsp)

;; Setup backup files to save separately
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; ==========
;; USER VARS 
;; ==========

(setq custom-file(locate-user-emacs-file "comvars.el"))
(load custom-file 'noerror 'nomessage)

(setq  inhibit-startup-message t ; Disable Splash Screen
       visible-bell t)

(setq history-length 24)
(savehist-mode 1) ; Remember Minibuffer prompts
(save-place-mode 1)

(recentf-mode 1) ; Remember recent files

(menu-bar-mode -1)
(tool-bar-mode nil)
(global-display-line-numbers-mode t) ; Display (an absolute) line number

(load-theme 'titor-emacs' t)

