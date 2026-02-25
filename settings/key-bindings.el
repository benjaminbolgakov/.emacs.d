;; General
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-c p m") 'create-project)

(global-set-key (kbd "C-c e") 'eval-buffer)

;; Binding to special config-reloader function
(global-set-key (kbd "C-c C-x e") #'reload-config)

(global-set-key (kbd "C-c p r") 'query-replace)

(global-set-key (kbd "C-c r") 'comment-region)

(global-set-key (kbd "C-c u") 'uncomment-region)

(global-set-key (kbd "C-x C-z") 'suspend-frame)

(global-set-key (kbd "C-c s") 'org-insert-structure-template)

(global-set-key (kbd "C-c d") 'org-insert-drawer)

(global-set-key (kbd "C-c m") 'insert-template)

(global-set-key (kbd "C-c t") 'org-table-create-or-convert-from-region)

(global-set-key (kbd "M-z") 'eval-expression)

(global-set-key (kbd "C-c _") 'artist-mode)

(global-set-key (kbd "C-c i") 'my-insert-image)

;; Hook bindings
(global-set-key (kbd "C-x C-c") 'my-confirm-kill-emacs)

;;;; TODO ---------------------------------------
;;(global-set-key (kbd "C-c TAB") 'tab-region)

;;(global-set-key (kbd "C-c TAB") 'detab-region)


;; Unbinds
(global-unset-key (kbd "C-M-,"))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 2))

(provide 'key-bindings)
