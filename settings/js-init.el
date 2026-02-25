(use-package tide
  :ensure t
  :bind (:map global-map
	      ("C-M-k" . c-doc-comment)
	      ("C-M-j" . c-block-comment)))

;; Configuration
(setq js-indent-level 2)
(setq typescript-indent-level 2)

;; Make tree-sitter indent JSX properly
(with-eval-after-load 'tsx-ts-mode
  (setq tsx-ts-mode-indent-offset 2))

(with-eval-after-load 'js-ts-mode
  (setq js-ts-mode-indent-offset 2))

(use-package rjsx-mode
  :mode "\\.jsx\\'"
  :config
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-c r") #'rjsx-comment-dwim))

  ;; (define-key rjsx-mode-map "<" t)
  ;; (define-key rjsx-mode-map (kbd "C-d") nil)
  ;; (define-key rjsx-mode-map ">" nil)

(add-to-list 'auto-mode-alist '("\\.js\\'"  . js-ts-mode))
;; Associate .jsx files with rjsx-mode
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

(provide 'js-init)

;;;;;;;;;;
; Legacy ;
;;;;;;;;;;
;; (use-package rjsx-mode
;;   :mode "\\.jsx\\'"
;;   :config
;;   ;; Make M-; (comment-dwim) JSX-aware
;;   (define-key rjsx-mode-map [remap comment-dwim] #'rjsx-comment-dwim)
;;   ;; To explicitly run comment-region/comment-or-uncomment-region:
;;   (define-key rjsx-mode-map [remap comment-region] #'rjsx-comment-dwim)
;;   (define-key rjsx-mode-map [remap comment-or-uncomment-region] #'rjsx-comment-dwim)
;;   (define-key rjsx-mode-map (kbd "C-c r") #'rjsx-comment-dwim))

;; Override global keybind C-c r 'comment-region
;; Override only in JSX buffers (rjsx-mode)
;; (with-eval-after-load 'rjsx-mode
;;   (define-key rjsx-mode-map (kbd "C-c r") #'rjsx-comment-dwim))

;; In case no package is used (i.e vanilla emacs):
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

;; (with-eval-after-load 'rjsx-mode
;;   (define-key rjsx-mode-map [remap comment-dwim] #'rjsx-comment-dwim)
;;   (define-key rjsx-mode-map [remap comment-region] #'rjsx-comment-dwim)
;;   (define-key rjsx-mode-map [remap comment-or-uncomment-region] #'rjsx-comment-dwim))
