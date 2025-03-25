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

(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)
(global-set-key [C-S-wheel-up] 'text-scale-increase)
(global-set-key [C-S-wheel-down] 'text-scale-decrease)

(ivy-mode)
(setopt ivy-use-virtual-buffers t)
(setopt enable-recursive-minibuffers t)
;; Enable this if you want `swiper' to use it:
;; (setopt search-default-mode #'char-fold-to-regexp)
(keymap-global-set "C-s" #'swiper-isearch)
(keymap-global-set "C-c C-r" #'ivy-resume)
(keymap-global-set "<f6>" #'ivy-resume)
(keymap-global-set "M-x" #'counsel-M-x)
(keymap-global-set "C-x C-f" #'counsel-find-file)
(keymap-global-set "<f1> f" #'counsel-describe-function)
(keymap-global-set "<f1> v" #'counsel-describe-variable)
(keymap-global-set "<f1> o" #'counsel-describe-symbol)
(keymap-global-set "<f1> l" #'counsel-find-library)
(keymap-global-set "<f2> i" #'counsel-info-lookup-symbol)
(keymap-global-set "<f2> u" #'counsel-unicode-char)
(keymap-global-set "C-c g" #'counsel-git)
(keymap-global-set "C-c j" #'counsel-git-grep)
(keymap-global-set "C-c k" #'counsel-ag)
(keymap-global-set "C-x l" #'counsel-locate)
(keymap-global-set "C-S-o" #'counsel-rhythmbox)
(keymap-set minibuffer-local-map "C-r" #'counsel-minibuffer-history)
