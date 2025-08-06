;;; KEYS - ELISP Module that controls keybindings
;;  REI Core Module
;;  Magica-Faux * 2025 

(use-package ivy
  :ensure t
  :config
  (ivy-mode)
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t))

(use-package counsel
  :ensure t
  :after ivy
  :config
  (keymap-global-set "C-c C-r" #'ivy-resume)
  (keymap-global-set "<f6>" #'ivy-resume)
  (keymap-global-set "M-x" #'counsel-M-x)
  (keymap-global-set "C-q" #'counsel-recentf)
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
  (keymap-set minibuffer-local-map "C-r" #'counsel-minibuffer-history))

(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)
(global-set-key [C-S-wheel-up] 'text-scale-increase)
(global-set-key [C-S-wheel-down] 'text-scale-decrease)
(global-set-key (kbd "C-<up>") 'text-scale-increase)
(global-set-key (kbd "C-<down>") 'text-scale-decrease)
(global-set-key (kbd "C-t") 'treemacs)

(setq search-default-mode #'char-fold-to-regexp)
