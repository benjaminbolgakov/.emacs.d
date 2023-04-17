(use-package tide
  :ensure t
  :bind (:map global-map
	      ("C-M-k" . c-doc-comment)
	      ("C-M-j" . c-block-comment)))


(provide 'js-init)
