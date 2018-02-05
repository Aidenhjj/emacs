(require 'package)

(setq package-archives
      '(("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("MELPA"        . 0)))

(setq package-enable-at-startup nil)
(package-initialize)

(defun emacs-d (filename)
  "Expand FILENAME relative to `user-emacs-directory'."
  (expand-file-name filename user-emacs-directory))

;; external packages
(load (emacs-d "packages"))

;; custom functions
(load (emacs-d "functions"))
;; keybindings
(load (emacs-d "key-bindings"))

;; sort out basic startup behaviour
(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)

(set-default-font "Ubuntu Mono-12")

;; theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; puts auto config stuff here (i think)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
