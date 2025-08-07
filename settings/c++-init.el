(use-package cmake-ide
  :ensure t
  :init
  (setq cmake-ide-make-command "make --no-print-directory -j8")
  :config
  (cmake-ide-setup))

(c-set-offset 'cpp-macro 0 nil)

(defun my/ff-find-other-file-other-window ()
  (interactive)
  (ff-find-other-file t))

(defun my/maybe-add-pragma-once ()
  "Add '#pragma once' to an empty file if its extension is '.hh'"
  (when (and (string= (file-name-extension (buffer-file-name)) "hh")
             (= (buffer-size) 0))
    (insert "#pragma once\n")
    (set-buffer-modified-p nil)))

(defun my/c++-comment-setup ()
  "Setup magic multiline C++ comments. M-j for newline with
multiline comment prefix."
  (interactive)
  (setq-local comment-start "/**"
              comment-end   " */"
              comment-multi-line t
              comment-padding nil
              comment-style 'extra-line
              comment-continue " * "
              comment-empty-lines t))

(defun my/c++-mode-hook ()
  (my/maybe-add-pragma-once)
  (my/c++-comment-setup)

  (setq c-basic-offset  4
        c-default-style "linux")

  (local-set-key (kbd "M-o") 'ff-find-other-file)
  (local-set-key (kbd "M-O") 'my/ff-find-other-file-other-window)
  (local-set-key (kbd "C-c m") 'cmake-ide-compile)
  (local-set-key (kbd "C-c i") 'indent-buffer)
  (local-set-key (kbd "C-c k") 'kattis-submit-and-open-browser)
  (column-number-mode)

  ;; Bind C-m to 'compile', <return> needs to be bound to
  ;; 'newline' since it is bound to C-m by default.
  (cond (window-system
	 (local-set-key (kbd "<return>") 'newline)
	 (local-set-key (kbd "C-m") 'compile)))

  (local-set-key (kbd "C-M-k") 'c-doc-comment)
  (local-set-key (kbd "C-M-j") 'c-block-comment)

  ;; (flycheck-mode)
  (company-mode)
  (add-to-list 'company-backends 'company-lsp)
  (lsp)
  (lsp-mode))

(add-hook 'c++-ts-mode-hook 'my/c++-mode-hook)
(add-hook 'c-ts-mode-hook 'my/c++-mode-hook)

(provide 'c++-init)

;; C/C++ settings
;; (defun my-c++-mode-style ()
;;   "Custom C++ indentation style."
;;   (c-set-style "stroustrup")            ;; Base style
;;   (setq c-basic-offset 4)               ;; Indent width
;;   (c-set-offset 'access-label '-)       ;; Don't indent access specifiers
;;   (c-set-offset 'inclass '++)           ;; Indent class members properly
;;   (setq indent-tabs-mode nil))          ;; Use spaces, not tabs

;; (add-hook 'c++-mode-hook 'my-c++-mode-style)

;; ;; Associate .h and .hpp files with c++-mode
;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; (add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

;; (provide 'c++-init)

;; LEGACY ========================================================

;; (setq c-default-style "bsd")
;; (setq c-default-style "stroustrup"
;;       c-basic-offset 4)
;; (setq c-basic-offset 4)
;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


;; IDE-like features for CMake projects
;; https://cmake.org/cmake/help/latest/guide/ide-integration/index.html
;; (use-package cmake-ide
;;   :ensure t
;;   :init
;;   (setq cmake-ide-make-command "make --no-print-directory -j8")
;;   :config
;;   (cmake-ide-setup))

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
