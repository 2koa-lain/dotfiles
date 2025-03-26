;;; DISPLAY - ELISP Module that controls theming
;;  REI Core Module
;;  Magica-Faux * 2025 

(when (display-graphic-p)
  (setq default-frame-alist 
        '((font . "Iosevka Term-24") ; GUI Font
          (vertical-scroll-bars . nil)
          (horizontal-scroll-bars . nil)))
  (load-theme 'meadow-dark' t))

;; Uncomment this if you're on OSX
;(add-to-list 'default-frame-alist '(undecorated . t))

(when (display-graphic-p)
  (scroll-bar-mode -1)      ; Kill scrollbar
  (set-fringe-mode 0)       ; Kill fringe
  (window-divider-mode -1)) ; Kill window dividers
 
(setq  inhibit-startup-message t ; Disable Splash Screen
       visible-bell nil)

(menu-bar-mode -1)
(tool-bar-mode nil)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(xterm-mouse-mode t) ; Enable mouse cursor support in the terminal
