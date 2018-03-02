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
  (setq ivy-use-virtual-buffers t)
  (setq ivy-extra-directories nil)
  (setq enable-recursive-minibuffers t)
  (bind-key "C-f" 'ivy-alt-done ivy-minibuffer-map)
  (bind-key "C-b" 'ivy-backward-delete-char ivy-minibuffer-map)
  (bind-key "C-c g" 'counsel-git)
  (bind-key "C-c j" 'counsel-git-grep)
  (bind-key "C-c k" 'counsel-ag)
  :bind (
         ("C-c C-r" . ivy-resume)
         )
  )
;; (ivy-mode 1)
;; (setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers t)
;; (global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-find-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


;; org-mode
(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture))
  :config
  (setq org-todo-keywords '("TODO" "STARTED" "WAITING" "DONE")
        org-agenda-include-diary t
        org-log-done t
        org-agenda-include-all-todo t)
  (add-hook 'remember-mode-hook 'org-remember-apply-template)
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
   ("C-r" . swiper)
   ("C-%" . swiper-query-replace))
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
;; (use-package flyspell
;;   :ensure t
;;   :diminish ""
;;   :init
;;   (progn
;;     ;; Enable spell check in program comments
;;     (add-hook 'prog-mode-hook 'flyspell-prog-mode)
;;     ;; Enable spell check in plain text / org-mode
;;     (add-hook 'text-mode-hook 'flyspell-mode)
;;     (add-hook 'org-mode-hook 'flyspell-mode)
;;     (setq flyspell-issue-welcome-flag nil)
;;     (setq flyspell-issue-message-flag nil)

;;     ;; ignore repeated words
;;     (setq flyspell-mark-duplications-flag nil)

;;     ;; (setq-default ispell-program-name "/usr/bin/aspell")
;;     (setq-default ispell-list-command "list")
;;     )
;;   )

;; magit
(use-package magit
  :ensure
;;  :bind (("C-x g" . magit-status))
  )

;; magit-gerrit
;; (use-package magit-gerrit
;;   :ensure
;;   :init
;;   (setqdefault magit-gerrit-ssh-creds "aiden.jeffrey@codethink.co.uk")
;;   (setq-default magit-gerrit-remote "gerrit")
;;   )

;; Company. Auto-completion.
(use-package company
  :ensure
  :diminish ""
  :config
  (global-company-mode t)
  (define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
  (define-key company-active-map (kbd "ESC") 'company-abort)
  ;; <return> is for windowed Emacs; RET is for terminal Emacs
  ;; (dolist (key '("<return>" "RET"))
  ;;   ;; Here we are using an advanced feature of define-key that lets
  ;;   ;; us pass an "extended menu item" instead of an interactive
  ;;   ;; function. Doing this allows RET to regain its usual
  ;;   ;; functionality when the user has not explicitly interacted with
  ;;   ;; Company.
  ;;   (define-key company-active-map (kbd key)
  ;;     `(menu-item nil company-complete
  ;;                 :filter ,(lambda (cmd)
  ;;                            (when (company-explicit-action-p)
  ;;                              cmd)))))
  ;; (define-key company-active-map (kbd "TAB") #'company-complete-selection)
  ;; (define-key company-active-map (kbd "SPC") nil)
  ;; Company appears to override our settings in `company-active-map'
  ;; based on `company-auto-complete-chars'. Turning it off ensures we
  ;; have full control.
  (setq company-auto-complete-chars nil)
  
  )

;; (use-package flycheck
;;   :ensure
;;   :init
;;   (global-flycheck-mode)
;;   )

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
;; (use-package jedi
;;   :ensure
;;   :init
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (setq jedi:complete-on-dot t)
;;   (setq jedi:setup-keys t)
;;   )

;; company for jedi
(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook
	    (lambda () (add-to-list 'company-backends 'company-jedi)))
  )

(use-package jedi
  :ensure
  :defer t
  :init
  (setq jedi:complete-on-dot t)
  (add-hook 'python-mode-hook 'jedi:setup)
  :bind (("C-c d" . jedi:show-doc)))

(use-package eldoc
  :ensure
  :defer t
  :diminish eldoc-mode)

;; (use-package elpy
;;   :ensure
;;   :init
;;   (setq elpy-rpc-backend "jedi")
;;   (setq elpy-modules '(elpy-module-company
;;                        elpy-module-eldoc
;;                        elpy-module-sane-defaults
;;                        elpy-module-pyvenv)))

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

;;;; JSON
(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)
         )
  )

;;;; MARKDOWN
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.mdwn\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown")
  :config
  (setq visual-line-mode t))

;; ;;;; OCTAVE STUFF
(use-package octave
  :ensure
  :mode ("\\.m$" . octave-mode))
;; (use-package matlab
;;   :ensure
;;   :init
;;   (setq matlab-shell-command-switches '("-nodesktop")))
