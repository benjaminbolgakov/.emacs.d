;;;; js-init.el --- JavaScript and TypeScript configuration

;; Map tree-sitter grammar
(setq treesit-language-source-alist
      '((javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))

;; Manually install missing grammar by calling function
(defun my/ensure-treesit-grammars ()
  "Install missing tree-sitter grammars for JS/TS."
  (interactive)
  (when (and (fboundp 'treesit-available-p) (treesit-available-p))
    (dolist (lang '(javascript typescript tsx))
      (unless (treesit-language-available-p lang)
        (treesit-install-language-grammar lang)))))

;; Remap JS modes if Tree-sitter and the JS grammar are available
(when (and (fboundp 'treesit-available-p)
           (treesit-available-p)
           (treesit-language-available-p 'javascript))
  (add-to-list 'major-mode-remap-alist '(js-mode . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(javascript-mode . js-ts-mode)))

;; Indentation settings
(setq js-indent-level 2
      typescript-indent-level 2
      js-ts-mode-indent-offset 2
      tsx-ts-mode-indent-offset 2)

;; TypeScript interactive development environment
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (tide-mode . (lambda ()
                        (add-hook 'before-save-hook #'tide-format-before-save nil t))))
  :bind (:map tide-mode-map
              ("C-c d" . tide-documentation-at-point)
              ("C-c r" . tide-rename-symbol)
              ("C-c f" . tide-fix)
              ("M-."   . tide-jump-to-definition)
              ("M-,"   . tide-jump-back)))


(provide 'js-init)

;;;;;;;;;;
; Legacy ;
;;;;;;;;;;
;; (use-package tide
;;   :ensure t
;;   :bind (:map global-map
;; 	      ("C-M-k" . c-doc-comment)
;; 	      ("C-M-j" . c-block-comment)))

;; (use-package rjsx-mode
;;   :mode "\\.jsx\\'"
;;   :config
;;   (define-key rjsx-mode-map "<" nil)
;;   (define-key rjsx-mode-map (kbd "C-c r") #'rjsx-comment-dwim))

;; (add-to-list 'auto-mode-alist '("\\.js\\'"  . js-mode))
;; ;; Associate .jsx files with rjsx-mode
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

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
