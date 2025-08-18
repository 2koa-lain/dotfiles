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


(use-package el-patch
  :straight t)


(use-package company
  :straight t
  :config
  (global-company-mode 1))

(use-package treemacs
  :straight t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (setq treemacs-indentation 2
        treemacs-eldoc-display 'simple))

(use-package hl-todo
  :straight t
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"    . "orange")
          ("WARNING" . "red")
          ("FIXME"   . "green")
          ("STUB"    . "seashell3")
          ("NOTE"    . "yellow")))
  (global-hl-todo-mode 1))

(use-package yasnippet
  :straight t
  :config
  (yas-global-mode 1))

(use-package lsp-mode
  :straight t
  :init
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-clients-clangd-args '("--header-insertion=never"))
  :hook
  (c-mode . lsp))

(use-package flymake
  :straight t
  :init
  (setq flymake-start-on-flymake-mode nil
        flymake-start-on-save-buffer nil))

(use-package magit
  :straight t)


(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))

(add-to-list 'load-path "~/.emacs.d/rei-modules/")
(setq modu-dir (expand-file-name "rei-modules/" user-emacs-directory))
(setq custom-file (locate-user-emacs-file "comvars.el"))
(load custom-file 'noerror 'nomessage)
(require 'orgx)
(require 'display)
(require 'keys)


(setq-default indent-tabs-mode nil)
(add-hook 'makefile-mode-hook (lambda () (setq indent-tabs-mode t)))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq indent-tabs-mode nil)))

(setq-default tab-width 4)
(setq history-length 24)
(setq-default right-margin-width 8)

(set-window-buffer nil (current-buffer))


(use-package savehist
  :straight t
  :config (savehist-mode 1))

(use-package saveplace
  :straight t
  :config (save-place-mode 1))

(use-package recentf
  :straight t
  :config (recentf-mode 1))

(put 'erase-buffer 'disabled nil)
(put 'upcase-region 'disabled nil)


(provide 'init)

;;; init.el ends here
