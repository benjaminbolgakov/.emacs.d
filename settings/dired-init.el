;; If non-nil: Tries to guess a default target dir.
;; If there is a Dired buffer displayed in the next window,
;; use it's current dir, instead of this Dired buffer's current dir
;; The target is used in the prompt for file copy, rename etc..
(setq dired-dwim-target t)



(provide 'dired-init)


;; (defun dired-beginning-of-buffer ()
;;   "Go to first entry in dired buffer."
;;   (interactive)
;;   (beginning-of-buffer)
;;   (dired-next-line 4))

;; (defun dired-end-of-buffer ()
;;   "Go to the last entry in dired buffer."
;;   (interactive)
;;   (end-of-buffer)
;;   (dired-previous-line 1))

;; (defun my/dired-mode-hook ()
;;   (local-set-key (kbd "M-<") 'dired-beginning-of-buffer)
;;   (local-set-key (kbd "M->") 'dired-end-of-buffer)
;;   (all-the-icons-dired-mode))

;; (add-hook 'dired-mode-hook 'my/dired-mode-hook)
