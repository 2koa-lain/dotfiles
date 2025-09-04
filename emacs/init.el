;;; init.el --- MAGICA Init Config  -*- lexical-binding: t; -*-

;;; Commentary:
;; 

;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(defvar init/packages '(el-patch
			elfeed
			project
			projectile
			company
			marginalia
			lsp-ui
			treemacs
			hl-todo
			yasnippet
			header2
			rainbow-delimiters
			magit
			lua-mode
			pdf-tools
			consult)
  "Essential packages for EMACS.")

(dolist (package init/packages)
  (straight-use-package package))
(pdf-loader-install)
					       
(use-package marginalia
  :straight t
  :bind
  (:map minibuffer-local-map
        ("M-A" . marginalia-cycle)))




(use-package treemacs
  :straight t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (setq treemacs-indentation 2
        treemacs-eldoc-display 'simple))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq custom-file (locate-user-emacs-file "comvars.el"))
(load custom-file 'noerror 'nomessage)
(require 'orgx)
(require 'display)
(require 'keys)
(require 'maji-prog)

(defun init/modes ()
  "Global Modes for CONFIG."
   (global-company-mode) 
   (recentf-mode) 
   (savehist-mode) 
   (marginalia-mode) 
   (save-place-mode))

(defun init/setvars ()
  "Global variables for CONFIG."
  (setq
   tab-width 4
   history-length 24
   right-margin-width 8
   
   auto-save-default nil
   create-lockfiles nil))


(setq gnus-select-method '(nntp "news.gwene.org"))
(setq gnus-secondary-select-methods
      '((nntp "news.gwene.org")))
(setq backup-directory-alist '((".*" . "~/.emacsbk")))
(init/modes)
(init/setvars)
(maji/display)
(provide 'init)

;;; init.el ends here
