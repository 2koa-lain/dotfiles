;;; INIT - Main Init File for the config  -*- lexical-binding: t; -*-
;;  MAIN
;;  Magica-Faux * 2025 

(require 'package)
(setq package-archives
        '(("gnu" . "https://elpa.gnu.org/packages/")
          ("nongnu" . "https://elpa.nongnu.org/nongnu/")
          ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package company
  :config
  (global-company-mode))

(use-package treemacs
  :ensure t
  :init
  (with-eval-after-load 'winum
	(define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (setq treemacs-indentation 2
		treemacs-eldoc-display 'simple))


(use-package hl-todo
  :ensure t
  :config
  (setq hl-todo-keyword-faces
		'(("TODO"    . "orange")
		  ("WARNING" . "red")
		  ("FIXME"   . "green")
		  ("STUB"    . "seashell3")
		  ("NOTE"    . "yellow")))
  (global-hl-todo-mode 1))
  
  
  

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package lsp-mode
  :init
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-clients-clangd-args '("--header-insertion=never"))
  :hook
  (c-mode . lsp))

(use-package flymake
  :init
  (setq flymake-start-on-flymake-mode nil
        flymake-start-on-save-buffer nil))

(use-package magit)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))

(setq modu-dir (expand-file-name "rei-modules/" user-emacs-directory))
(setq custom-file (locate-user-emacs-file "comvars.el"))
(load custom-file 'noerror 'nomessage)
(load (expand-file-name "orgx.el" modu-dir))
(load (expand-file-name "display.el" modu-dir))
(load (expand-file-name "keys.el" modu-dir))

(setq indent-tabs-mode t)
(add-hook 'makefile-mode-hook (lambda () (setq indent-tabs-mode t)))
(add-hook 'emacs-lisp-mode (lambda () (setq indent-tabs-mode nil)))

(setq-default tab-width 4)
(setq history-length 24)
(setq-default right-margin-width 8)

(set-window-buffer nil (current-buffer))

(use-package savehist
  :config (savehist-mode 1))

(use-package saveplace
  :config (save-place-mode 1))

(use-package recentf
  :config (recentf-mode 1))

(put 'erase-buffer 'disabled nil)
(put 'upcase-region 'disabled nil)


(defun ada-mode--find-alire (dir)
  ;; Look up-tree, starting at dir, for alire.toml; return its full
  ;; path name if found, nil if not.
  (let ((alire (locate-dominating-file dir "alire.toml")))
    (if alire
      (cons 'transient alire)
      nil)))
 (defun ada-mode--find-gpr (dir)
  ;; Look up-tree, starting at dir, for a .gpr file, returning its
  ;; full path name if found, nil if not.
  (let ((gpr (locate-dominating-file
              dir
              (lambda (dir) (directory-files dir nil "gpr"))
              )))
    (if gpr
      (cons 'transient gpr)
      nil)))
 (use-package project
  :config
  (add-hook 'project-find-functions #'ada-mode--find-gpr)
  (add-hook 'project-find-functions #'ada-mode--find-alire)
  )
