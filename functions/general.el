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
  (insert "[[./img/"))

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

(defun insert-template ()
  "Insert boilerplate code"
  (interactive)
  (let ((choice (completing-read "Choose template: " '("python" "bash" "cpp" "c" "gitignore" "readme" "makefile"))))
    (cond
     ((string-equal choice "python")
      (python-insert-template))
     ((string-equal choice "bash")
      (bash-insert-template))
     ((string-equal choice "cpp")
      (cpp-insert-template))
     ((string-equal choice "c")
      (c-insert-template))
     ((string-equal choice "gitignore")
      (gitignore-insert-template))
     ((string-equal choice "readme")
      (readme-insert-template))
     ((string-equal choice "makefile")
      ;; Second input prompt for which language specific Makefile to import:
      (let ((langchoice (completing-read "Choose language specific Makefile: " '("C" "C++"))))
        (cond
         ((string-equal langchoice "C")
          (c-makefile-insert-template))
         ((string-equal langchoice "C++")
          (cpp-makefile-insert-template))
         (t
          (message "Invalid choice")))))
     (t
      (message "Invalid choice")))))

(defun python-insert-main ()
  "Insert the boilerplate python main code"
  (interactive)
  (insert "if __name__ == \"__main__\":\n"))

;; Inserts template code for python files
(defun python-insert-template ()
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/python")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))

;; Inserts template code for bash scripts
(defun bash-insert-template ()
  "Insert the template bash script"
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/bash")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))

;; Inserts template .gitignore
(defun gitignore-insert-template ()
  "Insert the template .gitignore content"
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/gitignore")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "gitignore file not found."))))


;; Insert README.md
(defun readme-insert-template ()
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/readme")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))


;; Insert template .c
(defun c-insert-template ()
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/c")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))


;; Inserts template .cpp
(defun cpp-insert-template ()
  "Insert sample C boilerplate with a forward-declared function"
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/cpp")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))
  ;; (interactive)
  ;; (insert "#include<iostream>\n"
  ;;         "using namespace std;\n\n"
  ;;         "void log(const string& msg);\n\n"
  ;;         "int main(int argc, char* argv[])\n"
  ;;         "{\n"
  ;;         "    if (argc > 1) { cout << argv[1] << \"\\n\"; }\n"
  ;;         "    log(\"Log:\");\n"
  ;;         "    return 0;\n"
  ;;         "}\n\n"
  ;;         "void log(const string& msg) { cout << msg << \"\\n\"; }\n"))


;; Insert template C++ makefile content from file "snippets/makefiles/Makefile_Cpp"
(defun cpp-makefile-insert-template ()
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/makefiles/Makefile_Cpp")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))

;; Insert template C makefile content from file "snippets/makefiles/Makefile_C"
(defun c-makefile-insert-template ()
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/makefiles/Makefile_C")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))

(provide 'general)
