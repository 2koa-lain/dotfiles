;; MAGICA-FAUX DISPLAY EL 
;; ======================

(when (display-graphic-p)
  (setq default-frame-alist  ; Fallback fonts for GUI
        '((font . "Iosevka Term-24")
          (vertical-scroll-bars . nil)
          (horizontal-scroll-bars . nil)))
  (load-theme 'meadow-dark' t))
(add-to-list 'default-frame-alist '(undecorated . t))
(when (display-graphic-p)
  (scroll-bar-mode -1)       ; Kill scrollbar
  (set-fringe-mode 0)       ; Kill fringe
  (window-divider-mode -1)) ; Kill window dividers
 
(setq  inhibit-startup-message t ; Disable Splash Screen
       visible-bell nil)

(menu-bar-mode -1)
(tool-bar-mode nil)
(global-display-line-numbers-mode t) ; Display (an absolute) line number
(xterm-mouse-mode t) ; Enable mouse cursor support in the terminal
