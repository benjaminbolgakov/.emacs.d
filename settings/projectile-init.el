;; Required for projectile-search-replace???
;; (require 'subr-x)

(use-package magit
  :ensure t
  :init
  (when (at-mainmint)
    (setq git-commit-summary-max-length 50
          git-commit-fill-column 72
          git-commit-style-convention-checks '('non-empty-second-line
                                               'overlong-summary-line))))

(use-package magit-svn
  :ensure t
  :after magit)

;; Shows gitstatus live in emacs.
;; Uncommited changes are highlighted on the side by the line-numbers.
;; (use-package diff-hl
;;   :ensure t
;;   :hook ((prog-mode . diff-hl-mode)
;;          (dired-mode . diff-hl-dired-mode))
;;   :config
;;   (diff-hl-flydiff-mode))

(use-package projectile
  :ensure t
  :after magit
  :init
  (setq projectile-project-search-path '("~/.emacs.d")
        projectile-enable-caching t)
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package projectile-ripgrep
  :ensure t
  :after projectile)

(provide 'projectile-init)
