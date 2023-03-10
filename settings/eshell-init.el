;; Disable welcome message.
(setq eshell-banner-message "")

(setq eshell-prompt-function 'my/eshell-prompt-function
      eshell-prompt-regexp ".*➜ ")
(setq eshell-highlight-prompt nil)

(provide 'eshell-init)
