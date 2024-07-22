;; (setq python-shell-completion-native-disabled-interpreters 'nil)

;; Major mode for editing pip requirements files
(use-package pip-requirements
  :ensure t)

(use-package python-mode
  :ensure t
  ;;:hook (python-mode . lsp-deferred)
  :custom
  (python-shell-interpreter "/usr/bin/python3"))

;; (use-package python-black
;;   :after python
;;   :ensure t
;;   :hook (python-mode . python-black-on-save-mode-enable-dwim))



(use-package pyvenv
  :config
  (pyvenv-mode 1))


;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))

;; Python bindings
(defun my/python-mode-hook ()
  (local-set-key (kbd "C-c C-z") 'run-python)
  ;;(local-set-key (kbd "C-c C-c") 'python-shell-send-buffer)
  (local-set-key (kbd "C-c C-c") 'my/python-run-shell-and-send-buffer)
  (local-set-key (kbd "C-c C-r") 'python-shell-send-region)
  (lambda ()
    (define-key python-mode-map (kbd "<C-backspace>") 'backward-kill-word)))

(defun my/python-run-shell-and-send-buffer ()
  (interactive)
  (run-python)
  (python-shell-send-buffer))

;; -----------

(defun my-python-send-buffer-and-run-hook ()
  "Send the buffer to Python shell after starting it."
  (interactive)
  (when (eq major-mode 'python-mode)
    (run-python)
    (python-shell-send-buffer)))

(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'my-python-send-buffer-and-run-hook)))

;; ----------

;; Pyvenv bindings
(defun my/pyvenv-mode-hook ()
  (local-set-key (kbd "C-c C-z") 'run-python)
  (local-set-key (kbd "C-c C-c") 'python-shell-send-buffer)
  (local-set-key (kbd "C-c C-r") 'python-shell-send-region)
  (lambda ()
    (define-key pyvenv-mode-map (kbd "<C-backspace>") 'backward-kill-word)))

(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "<C-backspace>") 'backward-kill-word)
            (define-key pyvenv-mode-map (kbd "<C-backspace>") 'backward-kill-word)))
;; Requires lsp-mode??
;;(use-package lsp-pyright
;;  :ensure t)

;; Python formatter
;; (use-package python-black
;;   :after python
;;   :ensure t
;;   :hook (python-mode . python-black-on-save-mode-enable-dwim))

;;(setq python-python-command "/usr/local/bin/python3")
;;(setq python-shell-interpreter "/usr/local/bin/python3")

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-run-shell-and-send-buffer 'my/python-run-shell-and-send-buffer)
(add-hook 'pyvenv-mode-hook 'my/pyvenv-mode-hook)

(provide 'python-init)

;; (defun my/python-coverage-current-buffer ()
;;   "Check coverage for current buffer"
;;   (interactive)
;;   (shell-command (concat "coverage run --branch " (buffer-file-name))))

;; (defun my/python-coverage-pop-up-report ()
;;   "Show python coverage report in new window"
;;   (interactive)
;;   (with-temp-buffer-window "*coverage*" 'display-buffer-pop-up-window nil
;;     (prin1 (shell-command-to-string "coverage report"))))

;; (defun my/python-coverage-open-html ()
;;   "Check coverage, generate html report, and open it with the
;; default browser"
;;   (interactive)
;;   (my/python-coverage-current-buffer)
;;   (let ((dir (make-temp-file "coverage" t)))
;;     (shell-command (concat "coverage html -d " dir))
;;     (shell-command (concat "xdg-open " (expand-file-name "index.html" dir)))))

;; (defun my/python-vermin-file ()
;;   "Run vermin on the currently visited file, showing the results
;; in the echo area."
;;   (interactive)
;;   (message (string-trim
;;             (shell-command-to-string
;;              (concat "vermin " (buffer-file-name))))))

;; (defun my/python-block-comment ()
;;   (interactive)
;;   (beginning-of-line)
;;   (open-line 1)
;;   (let* ((indent (current-column))
;; 	 (stars (make-string (- 78 indent) ?#)))
;;     (insert stars "\n")
;;     (indent-to indent)
;;     (insert "# \n")
;;     (indent-to indent)
;;     (insert stars)
;;     (end-of-line 0)))
