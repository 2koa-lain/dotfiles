;; MAGICA-FAUX ORG MODE
;;
;; ====================

(setq org-adapt-indentation t
      org-hide-leading-stars t
      org-hide-emphasis-markers t
      org-pretty-entities t
	  org-ellipsis "  ·")

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(require 'olivetti)
(add-hook 'org-mode-hook 'olivetti-mode)

(add-hook 'org-mode-hook 'visual-line-mode) ; Adaptive Line Fill
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'org-mode-hook
  (lambda ()
    (variable-pitch-mode 1) 
    (set-face-attribute 'variable-pitch nil :font "Inter-18")
  
    (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-table nil :inherit 'fixed-pitch)))


(require 'org-indent)
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))

; Set Source code blocks to behave natively 
(setq org-src-fontify-natively t
	  org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)
