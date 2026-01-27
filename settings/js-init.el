(use-package tide
  :ensure t
  :bind (:map global-map
	      ("C-M-k" . c-doc-comment)
	      ("C-M-j" . c-block-comment)))

;; Use tree-sitter TSX mode for JSX files
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'"  . js-ts-mode))

;; Configuration
(setq js-indent-level 2)
(setq typescript-indent-level 2)

;; Make tree-sitter indent JSX properly
(with-eval-after-load 'tsx-ts-mode
  (setq tsx-ts-mode-indent-offset 2))

(with-eval-after-load 'js-ts-mode
  (setq js-ts-mode-indent-offset 2))

(provide 'js-init)
