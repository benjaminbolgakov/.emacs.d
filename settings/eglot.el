(use-package prettier
  :hook ((js-ts-mode
          typescript-ts-mode
          css-ts-mode
          html-ts-mode) . prettier-mode))

(provide 'eglot-init)
