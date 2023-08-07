;; Create projectile project-file in current dir
(defun create-project()
  (interactive)
  (let ((file-path (concat (file-name-as-directory default-directory) ".projectile")))
    (if (file-exists-p file-path)
        (message "File already exists")
      (write-region "" nil file-path)
      (message "File created: %s" file-path))))


(defun my-confirm-kill-emacs ()
  "Ask for confirmation before killing Emacs, even with no unsaved buffers."
  (interactive)
  (if (y-or-n-p "Do you want to exit Emacs? ")
      (save-buffers-kill-terminal)))

(provide 'general)
