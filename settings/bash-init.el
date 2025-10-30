;; Shell/Bash settings
;;  ("\\.bash\\'" . sh-mode)
;; (add-to-list 'auto-mode-alist '("\\.bash_aliases\\." . sh-mode))
;; # -*- mode: shell-script -*-

;; Ensure Tree-sitter grammar is installed for bash
;; M-x treesit-install-language-grammar RET bash RET
;; (use-package bash-ts-mode
;;   :mode ("\\.bash\\'" "\\.bashrc\\'" "\\.bash_profile\\'"
;;          "\\.bash_aliases\\'" "\\.bash_login\\'"
;;          "/bash\\." "PKGBUILD" "\\.sh\\'")
;;   :hook ((bash-ts-mode . (lambda ()
;;                            (setq-local indent-tabs-mode nil)
;;                            (setq-local tab-width 4)
;;                            (setq-local treesit-simple-indent-rules
;;                                        '((bash
;;                                           ((match ".*" 0) parent-bol 4))))))))


;; Associate bash-ts-mode with relevant file patterns
(add-to-list 'auto-mode-alist '("\\.bash\\'"       . bash-ts-mode))
(add-to-list 'auto-mode-alist '("\\.bashrc\\'"     . bash-ts-mode))
(add-to-list 'auto-mode-alist '("\\.bash_profile\\'". bash-ts-mode))
(add-to-list 'auto-mode-alist '("\\.bash_aliases\\'". bash-ts-mode))
(add-to-list 'auto-mode-alist '("\\.bash_login\\'".  bash-ts-mode))
(add-to-list 'auto-mode-alist '("PKGBUILD"         . bash-ts-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'"         . bash-ts-mode))
(add-to-list 'auto-mode-alist '("/bash\\."         . bash-ts-mode))

;; Mode-local settings
(add-hook 'bash-ts-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode nil)
            (setq-local tab-width 4)
            (setq-local treesit-simple-indent-rules
                        '((bash
                           ((match ".*" 0) parent-bol 4))))))


(provide 'bash-init)
