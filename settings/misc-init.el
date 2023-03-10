;; Dashboard on startup
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Benzel")
(setq dashboard-startup-banner "~/.emacs.d/emacs_logo.png")
(setq dashboard-center-content t)
(setq dashboard-week-agenda t)


;; All-The-Icons
(use-package all-the-icons
  :if (display-graphic-p))

;; Page-break
;; todo...

;; Minor mode that displays key-bindings
(use-package which-key
  :ensure t
  :config
  (which-key-setup-side-window-bottom))


;; Enables highlighting of TODO and other keywords in comments and strings.
(use-package hl-todo
  :ensure t
  :hook ((prog-mode . hl-todo-mode)
         (conf-mode . hl-todo-mode))
  :config
  (customize-set-variable 'hl-todo-highlight-punctuation ":!.")
  ;; Change these:
  (add-to-list 'hl-todo-keyword-faces '("CHANGE" . "#cc9393"))
  (add-to-list 'hl-todo-keyword-faces '("WARNING" . "#cc0000"))
  (add-to-list 'hl-todo-keyword-faces '("BEWARE" . "#aa0000"))
  (add-to-list 'hl-todo-keyword-faces '("DEPRECATED" . "#aa0000"))
  (add-to-list 'hl-todo-keyword-faces '("REFACTOR" . "#cc9393")))


;; Translator
;; TODO Is this correctly used? How to use it?
(use-package google-translate
  :ensure t)


;; Helps define and maintain consistent coding styles between editors/IDE's
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; Sets Emacs 'exec-path' and $PATH from the shell path so that
;; 'shell-command', 'compile' and similar work as expected.
;; Also allows other environment variables to be retrieved from the
;; shell, so that Emacs will see the same values you get in a terminal.
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))


(provide 'misc-init)


;; *Emacs 27 supports this natively.. dont use this if version > 27*
;; Enables graphical indication of the location of the fill column by
;; drawing a thin line down the length of the editing window.
;; -------------------------------------------------------------------
;; (use-package fill-column-indicator
;;   :ensure t
;;   :config
;;   (add-hook 'prog-mode-hook 'display-fill-column-indicator-mode))



;; Minor mode: highlights escape sequences in strings and other kind of
;; literals
;; (use-package highlight-escape-sequences
;;   :ensure t
;;   :hook (prog-mode . hes-mode))

;; Increases selected region by semantic units.
;; (use-package expand-region
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-\\") 'er/expand-region))

;; ;; Tool to manually explore and test HTTP REST webservices
;; (use-package restclient
;;   :ensure t)

;; ;; Major mode: editing records in a generalized CSV format.
;; (use-package csv-mode
;;   :ensure t
;;   :mode "\\.csv\\'")
