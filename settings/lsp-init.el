;; (setq lsp-keymap-prefix "C-c l")
;; ;; Language server protocol. Enables integration with i.e flycheck, projectile etc.
;; (use-package lsp-mode
;;   :after yasnippet which-key
;;   :ensure t
;;   :bind (:map lsp-mode-map
;;               ("M-i" . xref-find-definitions)
;;               ("M-I" . xref-find-definitions-other-window)
;;               ("C-M-i" . xref-pop-marker-stack)
;;               ("C-c r" . lsp-rename))
;;   :hook (lsp-mode . lsp-enable-which-key-integration)
;;   :init
;;   (which-key-mode)
;;   (setq lsp-enable-file-watchers nil)
;;   (setq lsp-completion-provider :capf)
;;   (setq lsp-enable-on-type-formatting nil)
;;   (setq lsp-enable-indentation nil)
;;   :config
;;   (define-key lsp-mode-map (kbd lsp-keymap-prefix) lsp-command-map))

;; ;; Higher level UI from lsp-mode, i.e flycheck & code lenses.
;; (use-package lsp-ui
;;   :ensure t
;;   :after lsp-mode
;;   :bind (:map lsp-ui-mode-map
;;               ("C-c R" . lsp-ui-peek-find-references))
;;   :config
;;   (lsp-ui-sideline-enable nil)
;;   (setq lsp-prefer-flymake nil)
;;   (setq lsp-ui-flycheck-enable t))

;; ;; C/C++/Obj-C language server [lsp-mode]
;; (use-package ccls
;;   :ensure t
;;   :after lsp-ui company
;;   :init
;;   (setq ccls-executable "/usr/bin/ccls"))


;; ;; Client/Lib for Debug-Adapter-Protocol. Coms between client and debug-server.
;; (use-package dap-mode
;;   :ensure t
;;   :after lsp-mode lsp-ui
;;   :config
;;   (setq dap-auto-configure-features '(sessions locals controls tooltip))
;;   (require 'dap-gdb-lldb)
;;   (dap-gdb-lldb-setup))


(use-package lsp-mode
  :hook
  ((python-mode . lsp)))

  (use-package lsp-ui
    :commands lsp-ui-mode)




(provide 'lsp-init)
