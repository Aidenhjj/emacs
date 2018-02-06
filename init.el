;; package management stuff

(require 'package)

(setq package-archives
      '(("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("MELPA"        . 0)))

(setq package-enable-at-startup nil)
(package-initialize)

(setq use-package-verbose t)

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

;; lots of following taken from
;; https://github.com/anschwa/emacs.d

;; Productive default mode
(setq initial-major-mode 'org-mode)

;; now covered by smartparens
;; ;; Show matching parens
;; (setq show-paren-delay 0)
;; (show-paren-mode 1)

;; ;; Auto-close brackets and double quotes
;; (electric-pair-mode 1)

;; Full path in frame title
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

;; Auto refresh buffers when edits occur outside emacs
(global-auto-revert-mode 1)

;; Also auto refresh Dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
;; Quickly copy/move file in Dired
(setq dired-dwim-target t)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Set default tab width
(setq default-tab-width 4)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Word Wrap (t is no wrap, nil is wrap)
(setq-default truncate-lines nil)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

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

;;;; LANGUAGE SPECIFICS

;; Automatically newline-and-indent for opening curly braces
;; (add-hook 'c-mode-common-hook
;;           (electric-pair-local-mode 1))
;; (add-hook 'css-mode-hook
;;           (electric-pair-local-mode 1))

;; Use One True Brace Style (K&R style indentation)
(setq c-default-style "k&r"
      c-basic-offset 4)

;; Use C-Mode for CUDA
;; (add-to-list 'auto-mode-alist '("\\.cu\\'" . c-mode))

