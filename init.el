(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ("marmalade" . "https://marmalade-repo.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (package-refresh-contents)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (require 'use-package)
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))

;; packages

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package undo-tree
  :config
  (global-undo-tree-mode))

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all)
  (add-hook 'enh-ruby-mode-hook 'yas-minor-mode)
  (add-hook 'js-mode-hook 'yas-minor-mode)
  (add-hook 'html-mode-hook 'yas-minor-mode)
  (add-hook 'css-mode-hook 'yas-minor-mode))

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package linum-relative
  :ensure t
  :config
    (setq linum-relative-current-symbol "")
    (add-hook 'prog-mode-hook 'linum-relative-mode))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package rainbow-mode
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package enh-ruby-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist
	       '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
  (setq enh-ruby-deep-indent-paren nil))

(use-package company
  :ensure t
  :config
  (setq-local company-idle-delay 0.2)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package inf-ruby
  :ensure t
  :config
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package ag
  :ensure t)

(use-package ibuffer-projectile
  :ensure t
  :config
  (add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic)))))

(use-package haml-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

;; functions

(defun my-set-jsx-indentation ()
  "Set indent level to 2"
  (setq-local js-indent-level 2))
(add-hook 'js-mode-hook 'my-set-jsx-indentation)

(defun kill-current-buffer ()
  "Kills the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; configs and key bindings

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(setq auto-save-default nil)
(show-paren-mode 1)
(eldoc-mode 1)
(setenv "PAGER" "/bin/cat")
(setq line-number-mode t)
(setq column-number-mode t)
(global-set-key (kbd "C-x b") 'ibuffer)
(global-subword-mode 1)
(setq electric-pair-pairs '(
                           (?\{ . ?\})
                           (?\( . ?\))
                           (?\[ . ?\])
                           (?\" . ?\")
                           ))
(electric-pair-mode t)
(global-set-key (kbd "C-c C-w") 'whitespace-mode)
(global-set-key (kbd "C-c d w") 'delete-trailing-whitespace)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode haml-mode ibuffer-projectile ag projectile company inf-ruby company-mode enh-ruby-mode swiper ivy yasnippet-snippets yasnippet js-mode undo-tree use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
