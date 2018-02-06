
;;; Code:

(global-set-key (kbd "C-c C-e") (lambda () (interactive)
                                      (erc-tls
                                       :server "bouncer.codethink.co.uk"
                                       :port "6502"
                                       :nick "aiden" )))

(setq erc-autojoin-channels-alist
      '(("bouncer.codethink.co.uk" "#codethink" "#ci003")))
;; (defmacro asf-erc-bouncer-connect (command server port nick ssl pass)
;;   "Create interactive command `command', for connecting to an IRC server. The
;;    command uses interactive mode if passed an argument."
;;    (fset command
;;          `(lambda (arg)
;;            (interactive "p")
;; 	   (if (not (= 1 arg))
;; 	       (call-interactively 'erc)
;; 	     (let ((erc-connect-function ',(if ssl
;; 					       'erc-open-ssl-stream
;; 					     'open-network-stream)))
;;  	       (erc :server ,server :port ,port :nick ,nick :password ,pass))))))


;; (use-package erc
;; ;;  :disabled t
;;   :init
;;   (progn
;;     (use-package erc-join
;;       :config
;;       (progn
;; 	(erc-autojoin-mode t)
;; 	(setq erc-join-buffer 'bury
;; 	      erc-autojoin-channels-alist
;; 	      '(("bouncer.codethink.co.uk" "#codethink" "#help" "#ci003")))))

;;     (use-package erc-track
;;       :config
;;       (progn
;; 	(erc-track-mode t)
;; 	(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
;; 					"324" "329" "332" "333" "353" "477"))))

;;     (add-hook 'erc-mode-hook '(lambda ()
;; 				(turn-off-smartparens-mode)))

;;     (defun start-irc ()
;;       "Connect to IRC."
;;       (interactive)
;;       (erc-tls
;;        :server "bouncer.codethink.co.uk"
;; 	   :port "6502"
;; 	   :nick "aiden")))
;;   :config
;;   (progn
;;     (setq erc-prompt-for-nickserv-password nil
;; 	  erc-hide-list '("JOIN" "PART" "QUIT" "NICK" "MODE")
;; 	  erc-auto-query 'buffer
;; 	  erc-server-auto-reconnect t
;; 	  erc-server-reconnect-attempts 5
;; 	  erc-server-reconnect-timeout 3
;; 	  erc-rename-buffers t)

;;     ;; highlighting nicks
;;     (use-package erc-hl-nicks
;;       :ensure t
;;       :init (add-to-list 'erc-modules 'hl-nicks))
;;     (use-package erc-services
;;       :init
;;       (progn
;; 	(add-to-list 'erc-modules 'spelling)
;; 	(erc-services-mode 1)
;; 	(erc-spelling-mode 1)))
;;     )
;;   )
