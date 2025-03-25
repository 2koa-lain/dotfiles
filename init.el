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
(setq make-backup-files nil)
(setq auto-save-default nil) ; # type files 
(setq create-lockfiles nil) 
;; ==========
;; USER VARS 
;; ==========

(setq custom-file(locate-user-emacs-file "comvars.el"))
(load custom-file 'noerror 'nomessage)
(load "~/.emacs.d/reiki_modules/orgx.el") ; Org Mode Config 
(load "~/.emacs.d/reiki_modules/display.el") ; Theme, GUI Handling  
(load "~/.emacs.d/reiki_modules/keys.el") ; Keybindings

(setq-default indent-tabs-mode t)
(add-hook 'makefile-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'emacs-lisp-mode (lambda () (setq indent-tabs-mode nil))) ; Damn you stallman!!!
(setq lsp-headerline-breadcrumb-enable nil) ; Shitty ClangD top bar gone 

(setq-default tab-width 4) 
(setq history-length 24)
(setq-default right-margin-width 8) ; Define new widths
;(setq visual-fill-column-center-text t)

(set-window-buffer nil (current-buffer)) ; Use them now.


(savehist-mode 1) ; Remember Minibuffer prompts
(save-place-mode 1)

(recentf-mode 1) ; Remember recent files

(put 'erase-buffer 'disabled nil)
(put 'upcase-region 'disabled nil)

