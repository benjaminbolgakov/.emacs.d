;; Org-mode agenda
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-c p m") 'create-project)

(global-set-key (kbd "C-c e") 'eval-buffer)

(global-set-key (kbd "C-c r") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 2))

(provide 'key-bindings)
