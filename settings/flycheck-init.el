;; On-the-fly syntax checking
(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


(provide 'flycheck-init)
