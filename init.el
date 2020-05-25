(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'undo-tree)

(global-undo-tree-mode)

(defun set-jsx-indentation ()
  (setq-local js-indent-level 2))
(add-hook 'js-mode-hook 'set-jsx-indentation)
