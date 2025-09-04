;;; orgx.el --- ORG Mode Functionality  -*- lexical-binding: t; -*-

;;; Commentary:
;; 
;;; Code:

(use-package org
  :config
  (setq org-adapt-indentation nil
        org-hide-leading-stars t
        org-indent-indentation-per-level 4
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-ellipsis "->"
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0))

(use-package org-superstar
  :straight t
  :after org
  :hook (org-mode . org-superstar-mode))

(use-package olivetti
  :straight t
  :hook (org-mode . olivetti-mode))


(require 'org-indent)
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))

(defun rei/org ()
  (variable-pitch-mode 1)
  (fringe-mode 1)
  (visual-line-mode 1)
  (setq-local global-hl-line-mode nil)
  (display-line-numbers-mode -1)
  (set-face-attribute 'variable-pitch nil :font "Consolas-14")
  (set-face-attribute 'org-code nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch))

(add-hook 'org-mode-hook #'rei/org)
(provide 'orgx)

;;; orgx.el ends here
