(use-package org-bullets
  :ensure t)

;; Defined keywords for TODO's
(setq org-todo-keywords
      '((sequence "TODO" "CHANGE" "|" "DONE")))
(setq org-log-done 'time)

;; Language support
;; active Babel languages
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((C . t)))

;;(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (python . t)))
;;Ensure using the correct interpreter
(setq org-babel-python-command "/usr/bin/python")

(define-key org-mode-map (kbd "C-,") nil)


;; ;; Prettify symbols.
;; (setq org-pretty-entities t
;;       org-fontify-whole-heading-line t
;;       org-src-tab-acts-natively t
;;       org-src-fontify-natively t
;;       org-fontify-quote-and-verse-blocks t
;;       org-ellipsis "↴")

;; ;; Pretty list bullets.
;; (font-lock-add-keywords 'org-mode
;;                         '(("^ *\\([-]\\) "
;;                            (0
;;                             (prog1 ()
;;                               (compose-region (match-beginning 1)
;;                                               (match-end 1)
;;                                               "•"))))))

;; ;; Faces
;; (set-face-attribute 'org-level-1 nil
;;                     :foreground 'semi-light'
;;                     :weight 'semi-light
;;                     :slant 'normal
;;                     :height 1.0)

;; (set-face-attribute 'org-level-2 nil
;;                     :weight 'semi-light
;;                     :slant 'normal
;;                     :height 1.0)

;; (set-face-attribute 'org-level-3 nil
;;                     :weight 'semi-light
;;                     :slant 'normal
;;                     :height 1.0)

;; (set-face-attribute 'org-level-4 nil
;;                     :weight 'semi-light
;;                     :slant 'normal
;;                     :height 1.0)

;; (set-face-attribute 'org-level-5 nil
;;                     :weight 'semi-light
;;                     :slant 'normal
;;                     :height 1.0)

;; (set-face-attribute 'org-quote nil
;;                     :slant 'italic)

;; (set-face-attribute 'org-done nil
;;                     :strike-through t)

;; (set-face-attribute 'org-block-begin-line nil
;;                     :height 1.0)

;; (set-face-attribute 'org-block-end-line nil
;;                     :height 1.0)

;; (set-face-attribute 'org-done nil
;;                     :strike-through t)


(provide 'org-init)
