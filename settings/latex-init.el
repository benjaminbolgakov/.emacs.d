(use-package tex
  :ensure auctex)

;; (use-package auctex
;;   :ensure t)

;; (use-package auctex
;;   :ensure t
;;   :hook (LaTeX-mode . hl-todo-mode)
;;   :hook (LaTeX-mode . flyspell-mode))

(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; (eval-after-load "xref"
;;   '(define-key xref--xref-buffer-mode-map (kbd "M-.") nil))
;; (eval-after-load "flyspell" '(define-key flyspell-mode-map (kbd "C-.") nil))
;; (eval-after-load "flyspell" '(define-key flyspell-mode-map (kbd "C-,") nil))
;; (eval-after-load "latex"
;;   '(setq TeX-engine 'omega))


(provide 'latex-init)
