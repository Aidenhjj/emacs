;;; packages.el --- list of packages to load;; use-package stuff
;;; Commentary:

;;; Code:
(eval-when-compile
  (require 'use-package))

;; ace-jump C-c C-SPC
(use-package ace-jump-mode
  :ensure
  )

;; smartparens
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)))

;; smex
(use-package smex
  :ensure
  :bind (;; bind original M-x
	 ("C-c C-c M-x" . execute-extended-command))
  :config
  (smex-initialize)
  )

;; ivy is used for selection from a list
(use-package ivy
  :ensure
  :diminish ""
  :init (ivy-mode 1)
  :config
  (progn
    (setq ivy-use-virtual-buffers t)
    (setq ivy-extra-directories nil)
    (bind-key "C-f" 'ivy-alt-done ivy-minibuffer-map)
    (bind-key "C-b" 'ivy-backward-delete-char ivy-minibuffer-map))
  :bind (
         ("C-c C-r" . ivy-resume)
         )
  )

;; ;; recentf-mode
;; (use-package recentf
;;   :init
;;   (recentf-mode 1)
;;   :bind
;;   (("C-x f" . recentf-open-files)
;;    )
;;   )

;; org-mode
(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda))
  :config
  (progn
    (setq org-log-done t))
  )

;; counsel
(use-package counsel
  :ensure
  :bind
  (("M-x" . counsel-M-x)
   ("C-c k" . counsel-ag)
   ("C-x C-f" . counsel-find-file)
   ("C-x f" . counsel-recentf)
   )
  )

;; swiper
(use-package swiper
  :bind
  (("C-s"  . swiper)
   ("C-r" . swiper))
  )

;; projectile
(use-package projectile
  :ensure
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-mode-line
        '(:eval (format " [%s]" (projectile-project-name))))
  (setq projectile-remember-window-configs t)
  (setq projectile-completion-system 'ivy)
  )

;; flyspell
(use-package flyspell
  :ensure t
  :diminish ""
  :init
  (progn
    ;; Enable spell check in program comments
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
    ;; Enable spell check in plain text / org-mode
    (add-hook 'text-mode-hook 'flyspell-mode)
    (add-hook 'org-mode-hook 'flyspell-mode)
    (setq flyspell-issue-welcome-flag nil)
    (setq flyspell-issue-message-flag nil)

    ;; ignore repeated words
    (setq flyspell-mark-duplications-flag nil)

    ;; (setq-default ispell-program-name "/usr/bin/aspell")
    (setq-default ispell-list-command "list")
    )
  )

;; magit
(use-package magit
  :ensure
  :bind (("C-x g" . magit-status))
  )

;; magit-gerrit
;; (use-package magit-gerrit
;;   :ensure
;;   :init
;;   (setqdefault magit-gerrit-ssh-creds "myid@gerrithost.org")
;;   (setq-default magit-gerrit-remote "gerrit")
;;   )

;; Company. Auto-completion.
(use-package company
  :ensure
  :diminish ""
  :config
  (global-company-mode t))

(use-package flycheck
  :ensure
  :init
  (global-flycheck-mode)
  )

;; Dired - powerful file manager
(use-package dired-x ; Enable some nice dired features
  ;; :config
  ;; (progn
  ;;   ;; Omit hidden files by default (C-x M-o to show them)
  ;;   (setq-default dired-omit-files-p t)
  ;;   (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$")
  ;;         dired-omit-verbose nil)
  ;;   (add-hook 'dired-after-readin-hook 'hl-line-mode)
  ;;   )
  )

;;;; PYTHON STUFF
(use-package jedi
  :ensure
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  )

;; company for jedi
(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook
	    (lambda () (add-to-list 'company-backends 'company-jedi)))
  )

;;;; HASKELL STUFF
(use-package haskell-mode
  :ensure t
  :defer 2
  :init
  (progn
    (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
    (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
    (add-hook 'haskell-mode-hook 'interactive-haskell-mode))
  :config
  (setq haskell-font-lock-symbols t))

;;;; YAML
(use-package yaml-mode
  :ensure t)

;;;; MARKDOWN
(use-package markdown-mode
  :ensure
  )

