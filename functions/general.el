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

(defun my-insert-image ()
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
  (let ((choice (completing-read "Choose template: " '("python" "bash" "cpp" "gitignore"))))
    (cond
     ((string-equal choice "python")
      (python-insert-template))
     ((string-equal choice "bash")
      (bash-insert-template))
     ((string-equal choice "cpp")
      (cpp-insert-template))
     ((string-equal choice "gitignore")
      (gitignore-insert-template))
     (t
      (message "Invalid choice")))))

(defun python-insert-main ()
  "Insert the boilerplate python main code"
  (interactive)
  (insert "if __name__ == \"__main__\":\n"))

;; Inserts template code for python files
(defun python-insert-template ()
  (interactive)
  (insert "\"\"\"\n"
          "Version:\n"
          "\"\"\"\n\n"
          "#### Imports ####\n\n"
          "#### Global Variables ####\n\n"
          "#### Functions ####\n\n"
          "#### Main ####\n"
          "if __name__ == \"__main__\":\n"))

;; Inserts template code for bash scripts
(defun bash-insert-template ()
  "Insert the template bash script"
  (interactive)
  (insert "#!/bin/bash\n\n"
          "#### Arguments ####\n"
          "args=(\"$@\");\n"
          "nmb_args=$#;\n"
          "threshold=2;\n\n"
          "#### Variables #####\n"
          "node_start=\"NODE = \"\n\n"
          "#### Functions ####\n"
          "verify_root(){\n"
          "    # Ensure the script runs as root\n"
          "    if [[ $EUID -ne 0 ]]; then\n"
          "        echo \"This script must be run as root (or with sudo).\"\n"
          "        exit 1\n"
          "    fi\n\n"
          "}\n\n"
          "#### -- Main-- ####\n"))
;; (defun bash-insert-template ()
;;   "Insert the template bash script"
;;   (interactive)
;;   (insert "#!/bin/bash\n\n"
;;           "#### Arguments ####\n"
;;           "args=(\"$@\");\n"
;;           "nmb_args=$#;\n"
;;           "threshold=2;\n\n"
;;           "#### Variables #####\n"
;;           "node_start=\"NODE = \"\n\n"
;;           "#### Functions ####\n"
;;           "ex(){\n\n}\n\n"
;;           "#### -- Main-- ####\n"))

;; Inserts template .gitignore
(defun gitignore-insert-template ()
  "Insert the template .gitignore content"
  (interactive)
  (insert "# -*- mode: gitignore; -*-\n"
          "__pycache__\n"
          "*~\n"
          "nmb_args=$#;\n\n"
          "venv/\n"
          "temp/\n\n"
          "# Distribution / packaging\n"
          "bin/\n"
          "build/\n"
          "dist/\n"
          "lib/\n"
          "lib64/\n"
          "var/\n"))

;; Inserts template .gitignore
(defun cpp-insert-template ()
  (interactive)
  (insert "#include<iostream>\n"
          "using namespace std;\n\n"
          "int main(int argc, char* argv[]) {\n"
          "\n"
          "    return 0;\n"
          "}\n"))


(provide 'general)
