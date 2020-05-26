(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ("marmalade" . "https://marmalade-repo.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  ;; i always fetch the archive contents on startup and during compilation, which is slow
  (package-refresh-contents)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (require 'use-package)
  ;; i don't really know why this isn't the default...
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))

(defun my-set-jsx-indentation ()
  "Set indent level to 2"
  (setq-local js-indent-level 2))
(add-hook 'js-mode-hook 'my-set-jsx-indentation)

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all)
  (add-hook 'ruby-mode-hook 'yas-minor-mode)
  (add-hook 'js-mode-hook 'yas-minor-mode))

(use-package ivy
  :ensure t
  :config
  (use-package swiper
    :ensure t)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq make-backup-files nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (swiper ivy yasnippet-snippets yasnippet js-mode undo-tree use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

  


