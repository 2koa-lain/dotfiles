;;; ORGX - ELISP Module for ORG buffers
;;  REI Core Module
;;  Magica-Faux * 2025 

(use-package org
  :config
  (setq org-adapt-indentation t
        org-hide-leading-stars t
        org-hide-emphasis-markers t
        org-pretty-entities t
        org-ellipsis "  ·"
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0))

(use-package org-superstar
  :ensure t
  :after org
  :hook (org-mode . org-superstar-mode))

(use-package olivetti
  :ensure t
  :hook (org-mode . olivetti-mode))

(require 'org-indent)
  (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))

(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode -1)))

(add-hook 'org-mode-hook
  (lambda ()
    (variable-pitch-mode 1) 
    (set-face-attribute 'variable-pitch nil :font "Inter Display-24")
    (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-table nil :inherit 'fixed-pitch)))
