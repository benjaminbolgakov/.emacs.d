(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)
		 ("HWSec*\\.txt\\'" . json-mode))
  :config
  (setq json-reformat:indent-width 2))

(provide 'json-init)
