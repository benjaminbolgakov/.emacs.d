;; Enable tag-matching
(setq nxml-slash-auto-complete-flag t)
(setq nxml-auto-insert-xml-declaration-flag nil)

;; Highlight matching start/end tags
(setq nxml-sexp-element-flag t)

(add-hook 'nxml-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?│)

;;(add-hook 'nxml-mode-hook #'highlight-parentheses-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . nxml-mode))

(provide 'html-init)
