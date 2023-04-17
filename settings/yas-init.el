;; Snippet dirs
(setq my/snippet-dir
      (expand-file-name "snippets" user-emacs-directory))

;; Template auto-insert function. Can insert template code snippets i.e the 'int main() etc..'
(use-package yasnippet
  :ensure t
  :config
  ;; Add snippet paths
  (setq yas-snippet-dirs
        '(my/snippet-dir))
  (yas-global-mode 1))

(provide 'yas-init)
