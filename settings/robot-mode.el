;; # C-c C-a = align region
;; # C-c C-j = split continuation
;; # C-c C-SPC = add argument (indent)
;; -----------------------------
;; -- speace separated format --
;; -----------------------------
;; *** Settings ***
;; Documentation     Example using the space separated format.
;; Library           OperatingSystem

;; ---------------------------
;; -- pipe separated format --
;; ---------------------------
;; | *** Settings ***   |
;; | Documentation      | Example using the pipe separated format.
;; | Library            | OperatingSystem

;; -----------------------
;; -- reStructured Text --
;; -----------------------
;; This text is outside code blocks and thus ignored.

;; .. code:: robotframework

;;    *** Settings ***
;;    Documentation    Example using the reStructuredText format.
;;    Library          OperatingSystem

(require 'align)

(defgroup robot nil
  "Major mode for robotframework files"
  :prefix "robot-mode-"
  :group 'languages)

(defcustom robot-mode-basic-offset standard-indent
  "Indentation for test and keyword steps (standard-indent=4)"
  :type 'integer
  :group 'robot
  :safe 'integerp)

(defcustom robot-mode-argument-separator standard-indent
  "Number of spaces between different arguments to keywords (standard-indent=4)"
  :type 'integer
  :group 'robot
  :safe 'integerp) ;; integerp ??

;; Defines syntax highlighting for keywords, variables etc..
(defvar robot-mode-font-lock-keywords
  '(("#.*" . font-lock-comment-face)
    ("^\\*.*" . font-lock-keyword-face)
    ("\\[\\sw+\\]" . font-lock-constant-face)
    ("\\.\\.\\." . font-lock-constant-face)
    ("^\\(Library\\|Resource\\|\\(Suite\\|Task\\|Test\\) \\(Setup\\|Teardown\\|Template\\|Timeout\\)\\|Variables\\):?\\s-*\\(.*\\)"
     (1 font-lock-preprocessor-face t) (4 font-lock-constant-face t))
    ("^\\(Documentation\\|\\(Force \\|Default \\)Tags\\|Metadata\\):?\\s-*\\(.*\\)"
     (1 font-lock-preprocessor-face t) (3 font-lock-doc-face t))
    ("[@$&%]{\\([+-]?\\(0[xbo]\\)?[0-9.a-f]+\\|true\\|false\\|None\\|null\\|EMPTY\\|SPACE\\)}" . font-lock-constant-face)
    ("\\([$]{{[^}]*}}\\)\\|^\\s-+\\(IF\\|ELSE IF\\|ELSE\\|END\\|FOR\\|WHILE\\|TRY\\|EXCEPT\\|RETURN\\|BREAK\\|CONTINUE\\)"
     . font-lock-builtin-face)
    ("[@$&%]{[^}]*}" . font-lock-variable-name-face)
    ("^[[:alnum:]]+.*$" . font-lock-function-name-face))
  "Default `font-lock-keywords' for Robot mode.")

;; Syntax rule for comments: Set '#' to comment-start and new-line to comment-ender.
;; "<", ">" = Natively defined chars for comment-start and comment-end
(defvar robot-mode-syntax-table
  (with-syntax-table (make-syntax-table)
    (modify-syntax-entry ?# "<")
    (modify-syntax-entry ?\n ">")
    (syntax-table)))

;; Define keymap for robot-mode
(defvar robot-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-a") #'robot-mode-align-region-or-defun)
    (define-key map (kbd "C-c C-j") #'robot-mode-split-continuation)
    ;; (define-key map (kbd "C-c C-SPC") #'robot-mode-add-argument)
    (define-key map (kbd "TAB") #'robot-mode-add-argument)
    map)
  "Key map for Robot mode.")

;; ????
(defun robot-mode-syntax-propertize (start end)
  "Propertize text between START and END."
  (funcall
   (syntax-propertize-rules
    ;; Single space between non-space characters is part of the symbol syntax
    ("[[:alnum:]]\\( \\)[[:alnum:]]" (1 "_")))
   start end))

;;
(defun robot-mode--back-to-previous-line ()
  "Move point to the previous non-empty, non-comment line."
  (beginning-of-line)
  (re-search-backward "^\\s-*[^#[:space:][:cntrl:]]+" nil t)
  (back-to-indentation))

;; Define behaviour of TAB
(defun robot-mode-indent-line ()
  "Indent current line in Robot mode.

Used as `indent-line-function' of the mode."
  (interactive)
  (let* ((indent 0)
	 ;; Get the current section
	 (section
	  (downcase (or (save-excursion
			 (re-search-backward "^\\s-*\\*+\\s-*\\([a-zA-Z ]+\\)" nil t)
			 (match-string-no-properties 1)) "")))

	 ;; The non-indented contents of previous non-empty line
	 previous-line

	 ;; The amount of indent of previous non-empty line
	 (previous-indent
	  (save-excursion
	    (robot-mode--back-to-previous-line)
	    (setq previous-line (buffer-substring-no-properties
				 (point) (line-end-position)))
	    ;; Calculate the whitespace width, taking tabs into account.
	    (string-width (buffer-substring-no-properties
			   (line-beginning-position) (point)))))

	 ;; The non-indented contents of the current line
	 current-line

	 ;; The indentation level of the current line
	 (current-indent
	  (save-excursion
	    (back-to-indentation)
	    (setq current-line (buffer-substring-no-properties
				(point) (line-end-position)))
	    (string-width (buffer-substring-no-properties
			   (line-beginning-position) (point))))))

    (setq indent
	  (cond ((or
		  ;; Don't indent if not in the below sections
		  (not (string-match "task.*\\|test case.*\\|keyword.*" section))
		  ;; Don't indent the section line
		  (string-match "^\\*" current-line)
		  ;; Don't indent the line after a section line
		  (string-match "^\\*" previous-line))
		 0)

		;; If the current line contains an inline IF, don't increase indent
		((string-match "^\\s-*IF\\s-\\{2,\\}[^[:space:]]+\\s-\\{2,\\}[^#[:space:]]" previous-line)
		 previous-indent)

		;; If previous line contains control structures, increase the
		;; indentation level
		((string-match "^\\s-*\\(IF\\|ELSE IF\\|ELSE\\|FOR\\|WHILE\\|TRY\\|EXCEPT\\)" previous-line)
		 (+ previous-indent robot-mode-basic-offset))

		;; Decrease indentation on control structures that end a block
		((string-match"\\(END\\|ELSE IF\\|ELSE\\|EXCEPT\\)" current-line)
		 (max robot-mode-basic-offset (- previous-indent robot-mode-basic-offset)))

		;; If previous line is indented, indent to that level
		((> previous-indent 0)
		 previous-indent)

		;; Otherwise indent to basic offset
		(t
		 robot-mode-basic-offset)))

    ;; Toggle indentation if the line is already indented
    (when (and (> indent 0)
	       (= indent current-indent))
      (setq indent 0))

    ;; Always move back to indentation
    (back-to-indentation)

    ;; Do the actual indenting if indentation changed
    (when (not (= indent current-indent))
      (delete-region (line-beginning-position)  (point))
      (indent-to indent))))

;; ??
(defun robot-mode-beginning-of-defun ()
  "Move the point to the beginning of the current defun.

Defuns are the steps of a keyword, test or task. This is used as
`beginning-of-defun-function' of the mode."
  (re-search-backward "^[[:graph:]]" nil t))

;; ??
(defun robot-mode-end-of-defun ()
  "Move the point to the end of the current defun.

Defuns are the steps of a keyword, test or task. This is used as
`end-of-defun-function' of the mode."
  (end-of-line)
  (if (re-search-forward "^[[:graph:]]" nil t)
      (beginning-of-line)
    (goto-char (point-max))))

;; ??
(defun robot-mode-align (beg end)
  "Align the contents of the region between BEG and END."
  (interactive
   (list (region-beginning) (region-end)))

  ;; Align only with spaces
  (let ((align-to-tab-stop nil))
    (align-regexp beg end "\\(\\s-\\s-+\\)"  1 robot-mode-argument-separator t))
  (indent-region beg end))

(defun robot-mode-align-defun ()
  "Align the contents current defun."
  (interactive)
  (let ((beg (save-excursion
		(beginning-of-defun)
		(forward-line)
		(point)))
	(end (save-excursion
	       (end-of-defun)
	       (point))))
    (robot-mode-align beg end)))

(defun robot-mode-align-region-or-defun ()
  "Call `robot-mode-align' if region is active, otherwise `robot-mode-align-defun'."
  (interactive)
  (if (region-active-p)
      (robot-mode-align (region-beginning) (region-end))
    (robot-mode-align-defun)))

(defun robot-mode-split-continuation ()
  "Split current line at point and continue in the next line.

Prefix the continuation with indentation, ellipsis and spacing."
  (interactive)
  ;; If point is between the indentation and beginning of line add the
  ;; ellipsis to the previous line. Otherwise add to the next line.
  (if (not (<= (line-beginning-position)
	       (point)
	       (save-excursion
		 (back-to-indentation) (point))))
      (progn
	(delete-horizontal-space)
	(newline))
    (beginning-of-line)
    (newline)
    (forward-line -1))
  (insert "...")
  (insert (make-string robot-mode-argument-separator ? ))
  (indent-region (line-beginning-position) (line-end-position)))

(defun robot-mode-add-argument ()
  "Add exactly `robot-mode-argument-separator' spaces to point."
  (interactive)
  (delete-horizontal-space)
  (insert (make-string robot-mode-argument-separator ? )))

;;;; Possible fix for indentation varying between keyword->variable
;;;; Dynamicaly calculates the indentation needed to align the variables:
;;;; Resource    var
;;;; Library     var
;; (defun robot-mode-add-argument ()
;;   "Add exactly `robot-mode-argument-separator' spaces to point."
;;   (interactive)
;;   (let* ((current-line (buffer-substring-no-properties
;;                         (line-beginning-position) (point)))
;;          (keyword-match (string-match "^\\(.*?\\)\\(\\s-*\\)\\(\\sw+\\)\\s-*$" current-line))
;;          (before-keyword (match-string 1 current-line))
;;          (indent-before-keyword (match-string 2 current-line))
;;          (keyword (match-string 3 current-line))
;;          (required-indent (+ (length before-keyword) (- (length indent-before-keyword) 1)))
;;          (indentation (make-string required-indent ? )))
;;     (delete-horizontal-space)
;;     (insert indentation)))

;;;###autoload
(define-derived-mode robot-mode prog-mode "Robot"
  "Major mode for editing Robot framework files.

\\{robot-mode-map}"

  (setq-local indent-line-function #'robot-mode-indent-line)
  (setq-local font-lock-defaults '(robot-mode-font-lock-keywords nil t))
  (setq-local comment-start "#")
  (setq-local comment-start-skip "#+ *")
  (setq-local beginning-of-defun-function #'robot-mode-beginning-of-defun)
  (setq-local end-of-defun-function #'robot-mode-end-of-defun)
  (setq-local syntax-propertize-function #'robot-mode-syntax-propertize)
  ;; Due to to the symbol syntax expanding to single space between non-space
  ;; characters, broaden the whitespace definition of isearch to include
  ;; literal spaces. This fixes the isearch-forward for strings containing
  ;; spaces.
  (setq-local search-whitespace-regexp "\\(\\s-\\| \\)+")
  (setq-local outline-regexp "^\\*\\|^\\sw"))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.\\(robot\\|resource\\)\\'" . robot-mode))

(provide 'robot-mode)
