;; use-package stuff
(eval-when-compile
  (require 'use-package))

;; enable useful default modes
(use-package ido
  :init
  (ido-mode t)
  (ido-everywhere t))

(use-package smex
  :ensure
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
	 ("C-c C-c M-x" . execute-extended-command))
  :config
  (smex-initialize))
