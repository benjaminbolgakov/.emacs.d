
;;(setq lsp-keymap-prefix "C-c l")
;; (use-package lsp-mode
;;   :commands (lsp lsp-deferred)
;;   :hook (lsp-mode . efs/lsp-mode-setup)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
;;   :config
;;   (lsp-enable-which-key-integration t))

;; (use-package lsp-ui
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :custom
;;   (lsp-ui-doc-position 'bottom))


;; (use-package ccls
;;   :ensure t
;;   :after lsp-ui company
;;   :init
;;   (setq ccls-executable "/usr/bin/ccls"))


;; (use-package dap-mode
;;   :ensure t
;;   :after lsp-mode lsp-ui
;;   :config
;;   (setq dap-auto-configure-features '(sessions locals controls tooltip))
;;   (require 'dap-gdb-lldb)
;;   (dap-gdb-lldb-setup))

(provide 'lsp-init)
