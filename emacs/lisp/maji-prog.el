;;; maji-prog.el --- Custom configuration for programming environments  -*- lexical-binding: t; -*-

;;; Commentary:
;;



;;; Code:


(defun maji/prog ()
  "Default configuration for programming."
  (indent-tabs-mode nil)
  (setq hl-todo-keyword-faces
        '(("TODO"    . "orange")
          ("WARNING" . "red")
          ("FIXME"   . "green")
          ("STUB"    . "seashell3")
          ("NOTE"    . "yellow")))
  (hl-todo-mode)
  (yas-global-mode)
  (setq c-default-style "bsd")
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets"))
  (message "[MAJI] *maji-prog* was loaded!"))


(add-hook 'prog-mode-hook 'maji/prog)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(add-hook 'makefile-mode-hook 'indent-tabs-mode)
(provide 'maji-prog)

;;; maji-prog.el ends here
