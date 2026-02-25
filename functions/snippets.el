;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code Template Insertion ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun insert-template ()
  "Insert boilerplate code"
  (interactive)
  (let ((choice (completing-read "Choose template: " '("python" "bash-basic" "bash-full" "cpp" "c" "gitignore" "readme" "makefile"))))
    (cond
     ((string-equal choice "python")
      (python-insert-template))
     ((string-equal choice "bash-basic")
      (bash-basic-insert-template))
     ((string-equal choice "bash-full")
      (bash-full-insert-template))
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

;;;;;;;;;;;;;;;;;;;
; Python Snippets ;
;;;;;;;;;;;;;;;;;;;

(defun python-insert-main ()
  "Insert the boilerplate python main code"
  (interactive)
  (insert "if __name__ == \"__main__\":\n"))

;; Inserts template code for python files
(defun python-insert-template ()
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/python/python-template")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))

;;;;;;;;;;;;;;;;;
; Bash Snippets ;
;;;;;;;;;;;;;;;;;

;; Inserts basic template code for bash scripts
(defun bash-basic-insert-template ()
  "Insert the basic template bash script"
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/bash/bash-basic")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))

;; Inserts full template code for bash scripts
(defun bash-full-insert-template ()
  "Insert the full template bash script"
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/bash/bash-full")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))

;; Inserts common filesystem snippets
(defun bash-full-insert-filesystem ()
  "Insert bash filesystem template"
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/bash/bash-filesystem")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))

;;;;;;;;;;;;;;;;
; Git Snippets ;
;;;;;;;;;;;;;;;;

;; Inserts template .gitignore
(defun gitignore-insert-template ()
  "Insert the template .gitignore content"
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/git/gitignore")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "gitignore file not found."))))

;;;;;;;;;;;;;;;;;;
; C/C++ Snippets ;
;;;;;;;;;;;;;;;;;;
;; Insert template .c
(defun c-insert-template ()
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/c-lang/c-template")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))


;; Inserts template .cpp
(defun cpp-insert-template ()
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/cpp/cpp-template")))
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


;;;;;;;;;;;;;;;;;
; Misc Snippets ;
;;;;;;;;;;;;;;;;;

;; Insert README.md
(defun readme-insert-template ()
  (interactive)
  (let ((template-path (expand-file-name "~/.emacs.d/snippets/code_snippets/misc/readme")))
    (if (file-readable-p template-path)
        (insert-file-contents template-path)
      (message "Snippet not found or not readable."))))

(provide 'snippets)
