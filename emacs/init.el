;;; INIT - Main Init File for the config
;;  MAIN
;;  Magica-Faux * 2025 

(require 'package)
(setopt package-archives
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

(setq-default indent-tabs-mode t)
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
