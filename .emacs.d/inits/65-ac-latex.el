(require 'auto-complete-latex)
     (setq ac-l-dict-directory "~/.emacs.d/elisp/auto-complete-latex/ac-l-dict/")
     (add-to-list 'ac-modes 'foo-mode)
     (add-hook 'foo-mode-hook 'ac-l-setup)
