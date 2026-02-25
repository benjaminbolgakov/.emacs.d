;;;;;;;;;;;;;;;;;;;;;;
; Base Configuration ;
;;;;;;;;;;;;;;;;;;;;;;


;; TODO:
;; autocompletion for lisp, inside this doc for example
;; Debugging lisp: Running for example "eval-buffer" and recieving an error:
;; "eval-buffer: Invalid read syntax: ")" [2 times]" - how to get more info etc?

;; This solves the error about retrieving marmalade "incomprehensible buffer"
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Global variables
;; (setq def-sys-font "Fira Code")
;; (setq alt-sys-font "Office Code Pro")

;; Current machine's hostname
;; (setq sysname (system-name))


;; ==========================================================================
;; ======== System config ===================================================
;; ==========================================================================

;;;; Remove??
(setq gc-cons-threshold (* 128 1024 1024))

;; disable creating backup files
(setq make-backup-files nil)

;; disable creating "lockfiles" (.#)
(setq create-lockfiles nil)

;; Start emacs server
;;(server-start)


;; ==========================================================================
;; ======== Load Emacs config-paths =========================================
;; ==========================================================================

;; Settings dir
(setq settings-dir
	  (expand-file-name "settings" user-emacs-directory))
;; Functions dir
(setq functions-dir
	  (expand-file-name "functions" user-emacs-directory))

(add-to-list 'load-path settings-dir)
(add-to-list 'load-path functions-dir)

;; load user-defined variables
(require 'vars)


;; ==========================================================================
;; ======== Load Emacs configs ==============================================
;; ==========================================================================)

;; load base-settings
(require 'base)

;; add package repositories
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("org" . "https://elpa.gnu.org/packages/"))
;; Only initialize if not already done
(unless package--initialized
  (package-initialize))

;; M-x package-refresh-contents
;; (package-refresh-contents)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;[M1]:
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t) ;; Maybe remove!
;;[M2]:
;;(require 'use-package)
;;(setq use-package-always-ensure t)


;; Required for projectile-search-replace
(require 'subr-x)

;; Key-binding assistant:
(require 'bind-key)

;; Keybinding descriptor
;; (require 'helm-descbinds)
;; (helm-descbinds-mode)

;; Load functions
(require 'general)
(require 'snippets)

;; Load settings
(require 'treesit-init)
(require 'json-init)
(require 'theme-init)
(require 'ivy-init)
(require 'docker-init)
(require 'lsp-init)
;;(require 'eglot-init)
(require 'flycheck-init)
(require 'c++-init)
(require 'elisp-init)
(require 'projectile-init)
(require 'org-init)
(require 'js-init)
(require 'html-init)
(require 'misc-init)
(require 'cmake-init)
(require 'python-init)
(require 'eshell-init)
(require 'dired-init)
(require 'yas-init)
(require 'latex-init)
(require 'avy-init)
(require 'bash-init)
(require 'robot-mode)
(require 'key-bindings)
;;(require 'compile-init)
;;(require 'pdf-init)
