(use-package ivy
  :bind (:map global-map
              ("C-x c" . ivy-resume))
  :config)
;;  (setq ivy-use-virtual-buffers t) ;; Add recent files and/or bookmarks to ivy-switch-buffer.
;;  (setq enable-recursive-minibuffers t)) ;; Allow minibuffer commands while in minibuffer.
  (ivy-mode 1)


;; Better ivy interface
(use-package ivy-rich
  :ensure t
  :after ivy
  :config
  ;;(setq ivy-rich-parse-remote-buffer nil) ; Make tramp SNAP!
  (ivy-rich-mode 1))

;; Interactive ivy interface to workspace symbol functionality from lsp-mode.
(use-package lsp-ivy
  :ensure t
  :after ivy lsp)


;; Regex searching
(use-package swiper
  :ensure t
  :after ivy
  :bind (:map global-map
	      ("C-s" . swiper)))

;; Completion mechanism
(use-package counsel
  :ensure t
  :after ivy
  :bind (:map global-map ("M-x" . counsel-M-x))
  :bind (:map minibuffer-local-map ("C-r" . counsel-minibuffer-history))
  :config
  (counsel-mode 1))

;; Ivy interface for ssh server and docker
(use-package counsel-tramp
  :ensure t
  :after counsel
  :bind (:map global-map
	      ("C-x t" . counsel-tramp))
  :config
  (setq tramp-default-method "ssh"))

;;
(use-package counsel-projectile
  :ensure t
  :after projectile counsel
  :config
  (counsel-projectile-mode))


;; Spotify control
(use-package counsel-spotify
  :ensure t
  :after counsel
  :bind (:map global-map
              ("C-x C-\\" . counsel-spotify-search-track)))



(provide 'ivy-init)


;; package-install projectile-mode
;; package-install projectile-ripgrep
;;(projectile-mode 1)
;;(counsel-projectile-mode)
; bind C-c p som ett prefix för alla projectile-kommandon
;;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

; Cachea filträdet för projektet (=projectile-find-file blir snabb som attan)
;;(setq projectile-enable-caching t)
; C-p p för att välja ett projekt under denna sökväg
;;(setq projectile-project-search-path '("~/"))
