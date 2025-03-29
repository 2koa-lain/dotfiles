;;; INIT - Main Init File for the config
;;  MAIN
;;  Magica-Faux * 2025 

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

(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode)) ; LSP gets confused when handling c headers

;; In case the directory name changes 
;; we don't have to change it for every single file
(setq modu-dir (expand-file-name "rei-modules/" user-emacs-directory))


(setq custom-file (locate-user-emacs-file "comvars.el"))
(load custom-file 'noerror 'nomessage)
(load (expand-file-name "orgx.el" modu-dir))    ; Org Mode Config 
(load (expand-file-name "display.el" modu-dir)) ; Theme, GUI Handling  
(load (expand-file-name "keys.el" modu-dir))    ; Keybindings

(setq-default indent-tabs-mode t)
(add-hook 'makefile-mode-hook (lambda () (setq indent-tabs-mode t)))
(add-hook 'emacs-lisp-mode (lambda () (setq indent-tabs-mode nil))) 

(setq lsp-headerline-breadcrumb-enable nil) ; Shitty ClangD top bar gone
(setq lsp-clients-clangd-args
      '("--header-insertion=never"))          ; Automatic Header insertion sucks
(setq flymake-start-on-flymake-mode nil)
(setq flymake-start-on-save-buffer nil)

(setq-default tab-width 4) 
(setq history-length 24)
(setq-default right-margin-width 8) ; Define new widths


(set-window-buffer nil (current-buffer)) 


(savehist-mode 1)  ; Remember Minibuffer prompts
(save-place-mode 1)
(recentf-mode 1)   ; Remember recent files

(put 'erase-buffer 'disabled nil)
(put 'upcase-region 'disabled nil)

