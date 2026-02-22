;; Used for reloading current config based on changes in current buffer
(defun reload-config ()
  "Save current buffer (if needed) and reload its file if it's Emacs Lisp.
- Intended for config files like ~/.emacs.d/settings/*.el.
- If buffer isn't visiting a file: error.
- If file isn't an .el file: error (prevents accidental reloads).
- Saves the buffer if modified.
- Reloads via `load-file` so top-level forms run like normal config.
- On error, prints a clear message and re-signals the error (so you get a backtrace if `debug-on-error` is on)."
  (interactive)
  (let* ((file (buffer-file-name)))
    (unless file
      (user-error "Current buffer is not visiting a file"))
    (unless (string-match-p "\\.el\\'" file)
      (user-error "Not an Emacs Lisp file: %s" file))
    (when (buffer-modified-p)
      (save-buffer))
    (message "Reloading %s..." file)
    (condition-case err
        (progn
          ;; Load the file as config (runs top-level forms).
          (load-file file)
          (message "Reloaded %s" file)
		  ;; Reload rjsx-mode only for now
		  (reload-rjsx-mode))
      (error
       (message "Reload FAILED for %s: %s" file (error-message-string err))
       (signal (car err) (cdr err))))))

(defun reload-rjsx-mode ()
  "Unload & reload rjsx-mode"
  (interactive)
	(when (featurep 'rjsx-mode)
      (unload-feature 'rjsx-mode t))
	(require 'rjsx-mode))


;;;; Font verifier
(defun validate-font(font-name)
  (unless (find-font (font-spec :family font-name))
    (message "Font not installed! Install it manually (Fira Code?)")))
;; (if (my-font-is-missing-p) (shell-command "/path/to/scripts/install-font.sh"))

;; Example usage:
;; (ensure-font-installed "Fira Code" ".emacs.d/assets/fira_code.zip")
;; (defun ensure-font-installed (font-name zip-path)
;;   "Ensure that the specified font is installed.
;; If the font is not available, extract it from the zip file and install."
;;   (unless (find-font (font-spec :family font-name))
;;     (message "Font %s is not installed. Installing..." font-name)
;;     (let* ((zip-file (expand-file-name zip-path user-emacs-directory))
;;            (font-dir (expand-file-name font-name user-emacs-directory)))
;;       ;; Extract the font files from the zip archive
;;       (unless (file-exists-p font-dir)
;;         (make-directory font-dir))
;;       (dolist (file (directory-files zip-file t "\\.\\(otf\\|ttf\\)$"))
;;         (copy-file file (expand-file-name (file-name-nondirectory file) font-dir) t))
;;       ;; Register the new font directory
;;       (add-to-list 'default-frame-alist `(font . ,(concat font-name "-10"))))
;;     (message "Font %s is now installed." font-name)))


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

;; (defun my-find-definition (search-term)
;;   "Run `rgrep` with '*.robot' wildcard and '~/MarineAutomaticTesting' as the base directory."
;;   (interactive "sSearch term: ")
;;   (rgrep search-term "*.robot" "~/MarineAutomaticTesting/Common/EVC"))

(defun my-find-definition ()
  "Run `rgrep` with '*.robot' wildcard and '~/Marine' as the base directory using the text from the current line as the search term."
  (interactive)
  (let ((search-term (thing-at-point 'line t)))
    (rgrep (format "\"%s\"" search-term) "*.robot" "~/MarineAutomaticTesting")))

(defun insert-image ()
  (interactive)
  (insert "#+caption: <text>\n")
  (insert "#+name: <name>\n")
  (insert "#+attr_html: :width <pixel-width>\n")
  (insert "#+attr_html: :align left\n")
  (insert "[[./img/a.png]]"))

(defun tab-region ()
  "Insert a tab at the start of each selected line."
  (interactive)
  (save-excursion
    (let ((beg (region-beginning))
          (end (region-end)))
      (goto-char beg)
      (while (< (point) end)
        (beginning-of-line)
        (insert "\t")
        (forward-line 1)))))

(defun detab-region ()
  "Remove one tab (or whitespace characters) from the start of each selected line."
  (interactive)
  (save-excursion
    (let ((beg (region-beginning))
          (end (region-end)))
      (goto-char beg)
      (while (< (point) end)
        (beginning-of-line)
        (when (looking-at "\t") ; Check if the line starts with a tab
          (delete-char 1))     ; Remove one character (tab)
        (forward-line 1)))))

;; Comment-derived heading insertion
(defun insert-heading (text)
  "Insert a comment-derived heading at current cursor position based on the buffer's language."
  (interactive "sEnter heading: ")
  (let* ((lang-mode major-mode)
         (heading (format " %s " text))
         comment-char
         border
         inner)

    ;; Determine comment style based on major mode
    (cond
	 ;; Emacs Lisp (.el)
     ((eq lang-mode 'emacs-lisp-mode)
      (setq comment-char ";"
            inner (format "%s%s%s" comment-char heading comment-char)
            border (make-string (length inner) (string-to-char comment-char))))

     ;; Bash, Python, Shell
     ((member lang-mode '(sh-mode python-mode))
      (setq comment-char "#"
            inner (format "%s%s%s" comment-char heading comment-char)
            border (make-string (length inner) (string-to-char comment-char))))

     ;; C, C++
     ((member lang-mode '(c-mode c++-mode))
      (setq comment-char "//"
            inner (format "%s=%s=%s" comment-char heading comment-char))
      (let* ((border-core-len (length inner)) ; Match inner line exactly
             (equals (make-string (- border-core-len (length comment-char) 4) ?=))) ; subtract "//" and two '==' pairs
        (setq border (format "%s==%s==" comment-char equals))))

     ;; Default fallback
     (t
      (setq comment-char "#"
            inner (format "%s%s%s" comment-char heading comment-char)
            border (make-string (length inner) (string-to-char comment-char)))))

    ;; Insert the heading
    (save-excursion
      (insert (format "%s\n%s\n%s\n" border inner border)))))

(provide 'general)

;; ================
;; ==== LEGACY ====
;; ================

;; ==== Simpler version of reload-config function
;; (defun reload-config ()
;;   "Save current buffer (if needed) and reload its file if it's Emacs Lisp."
;;   (interactive)
;;   (let ((file (buffer-file-name)))
;;     (unless file
;;       (user-error "Current buffer is not visiting a file"))
;;     (unless (string-match-p "\\.el\\'" file)
;;       (user-error "Not an Emacs Lisp file"))
;;     (when (buffer-modified-p)
;;       (save-buffer))
;;     (load-file file)
;;     (message "Reloaded %s" file)))

;; ===========================================
;; ==== Comment-derived heading insertion ====
;; ===========================================
;; (defun insert-heading (text)
;;   "Insert a comment-derived heading at current cursor position"
;;   (interactive "sEnter heading: ")
;;   (let* ((inner (format "# %s #" text))
;;          (border (make-string (length inner) ?#)))
;;     (save-excursion
;;       (insert (format "%s\n%s\n%s\n" border inner border)))))
;; ----------------------------------------------------------------------------------
;; Version of 'insert-heading' that determines what type of file it will
;; insert into and adjusts the comment character accordingly (e.g '#', '//', ';' etc)
;; Ref: https://chatgpt.com/c/684f05a6-00f0-8002-b053-7e4b02b013a6
;; ----------------------------------------------------------------------------------
;; (defun insert-heading (text)
;;   "Insert a context-aware banner with TEXT at point.
;; Uses comment syntax appropriate for the current major mode."
;;   (interactive "sEnter banner text: ")
;;   (let* ((comment-style 'aligned)
;;          (comment-start (or comment-start ""))
;;          (comment-end (or comment-end ""))
;;          (content (format " %s " text))
;;          (inner (concat comment-start "#" content "#" comment-end))
;;          (border (concat comment-start
;;                          (make-string (length content) ?#)
;;                          "##"
;;                          comment-end)))
;;     (save-excursion
;;       (insert (format "%s\n%s\n%s\n" border inner border)))))
