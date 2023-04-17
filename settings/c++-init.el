;; C/C++ settings
(setq c-default-style "bsd")
(setq c-basic-offset 4)
(setq-default indent-tabs-mode)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; IDE-like features for CMake projects
(use-package cmake-ide
  :ensure t
  :init
  (setq cmake-ide-make-command "make --no-print-directory -j8")
  :config
  (cmake-ide-setup))

(provide 'c++-init)


;;   (local-set-key (kbd "M-o") 'ff-find-other-file)
;;   (local-set-key (kbd "M-O") 'my/ff-find-other-file-other-window)
;;   (local-set-key (kbd "C-c m") 'cmake-ide-compile)
;;   (local-set-key (kbd "C-c i") 'indent-buffer)
;;   (local-set-key (kbd "C-c k") 'kattis-submit-and-open-browser)
;;   (column-number-mode)

;;   ;; Bind C-m to 'compile', <return> needs to be bound to
;;   ;; 'newline' since it is bound to C-m by default.
;;   (cond (window-system
;; 	 (local-set-key (kbd "<return>") 'newline)
;; 	 (local-set-key (kbd "C-m") 'compile)))

;;   (local-set-key (kbd "C-M-k") 'c-doc-comment)
;;   (local-set-key (kbd "C-M-j") 'c-block-comment)

;;   ;; (flycheck-mode)
;;   (company-mode)
;;   (add-to-list 'company-backends 'company-lsp)
;;   (lsp)
;;   (lsp-mode))

;; (add-hook 'c++-mode-hook 'my/c++-mode-hook)
;; (add-hook 'c-mode-hook 'my/c++-mode-hook)
