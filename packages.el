;; use-package stuff
(eval-when-compile
  (require 'use-package))

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
  :init (ivy-mode 1)
  :config
  (progn
    (setq ivy-use-virtual-buffers t)
    (setq ivy-extra-directories nil)
    (bind-key "C-f" 'ivy-alt-done ivy-minibuffer-map)
    (bind-key "C-b" 'ivy-backward-delete-char ivy-minibuffer-map))
  :bind
  ("C-c C-r" . ivy-resume)
  )

;; counsel
(use-package counsel
  :ensure
  :bind
  (("M-x" . counsel-M-x)
   ("C-c k" . counsel-ag)
   ("C-x C-f" . counsel-find-file)
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

;; magit
(use-package magit
  :ensure
  :bind (("C-x g" . magit-status))
  )
