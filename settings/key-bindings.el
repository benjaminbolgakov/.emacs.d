;; Org-mode agenda
(global-set-key (kbd "C-c a") 'org-agenda)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 2))

(provide 'key-bindings)
