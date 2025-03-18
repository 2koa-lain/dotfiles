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


(setq custom-file(locate-user-emacs-file "comvars.el"))
(load custom-file 'noerror 'nomessage)

(setq  inhibit-startup-message t ; Disable Splash Screen
       visible-bell t)

(setq history-length 24)
(savehist-mode 1) ; Remember Minibuffer prompts
(save-place-mode 1)

(recentf-mode 1) ; Remember recent files

(menu-bar-mode nil) 
(global-display-line-numbers-mode t) ; Display (an absolute) line number

(load-theme 'titor-emacs' t)

