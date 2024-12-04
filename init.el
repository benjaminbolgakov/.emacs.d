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
(server-start)


;; ==========================================================================
;; ======== Load Emacs config-paths =========================================
;; ==========================================================================

;; Settings dir
(setq settings-dir
	  (expand-file-name "settings" user-emacs-directory))
;; Functions dir
(setq functions-dir
	  (expand-file-name "functions" user-emacs-directory))
;; List of dirs where separate .el files are stored
(setq load-dir
      (expand-file-name "load" user-emacs-directory))


(load "~/.emacs.d/settings/variables.el")

(add-to-list 'load-path settings-dir)
(add-to-list 'load-path functions-dir)
(add-to-list 'load-path load-dir)

;; load user-defined variables
(require 'vars)

;; set startup dir
;; (setq default-directory (working-dir))
(setq default-directory working-dir)

;; ;; set emacs conf dir
;; (setq config-dir
;;       (if (eq system-type 'windows-nt)
;;           (concat (getenv "USERPROFILE") "\\AppData\\Roaming\\.emacs.d\\")
;;         (concat (getenv "HOME") "/.emacs.d/")))

;; ;; get conf-dir variable value
;; (defun get-config-dir ()
;;   config-dir)


;; ==========================================================================
;; ======== Load Emacs configs ==============================================
;; ==========================================================================

;; load base-settings
(require 'base)


;; init use-package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("org" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; M-x package-refresh-contents

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

;; Load settings
(require 'theme-init)
(require 'ivy-init)
(require 'docker-init)
(require 'lsp-init)
(require 'flycheck-init)
(require 'c++-init)
(require 'elisp-init)
(require 'projectile-init)
(require 'org-init)
(require 'js-init)
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








;; 'package-selected-packages' = explicitly installed packages by user. Get's automatically
;; updated by Emacs when installing a new package. Used by 'package-autoremove' to decide
;; which packages are no longer needed. Can be used to (re)install packages on other machines
;; by running: 'package-install-selected-packages'
;; Check if package is contained in this list by running: 'package--user-selected-p'
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3263bd17a7299449e6ffe118f0a14b92373763c4ccb140f4a30c182a85516d7f" "f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077" default))
 '(elpy-rpc-python-command
   "C:\\\\Users\\\\cid14168\\\\AppData\\\\Local\\\\Programs\\\\Python\\\\Python311\\\\python.exe")
 '(max-lisp-eval-depth 1500)
 '(org-agenda-files nil)
 '(org-image-actual-width '(500))
 '(package-selected-packages
   '(helm-descbinds elpy robot-mode company pyvenv pyenv-mode darcula-theme gruvbox-theme dracula-theme lsp-ivy python-mode google-translate modus-themes org-bullets auctex dashboard all-the-icons page-break-lines magit auto-complete jupyter grails-projectile-mode pdf-tools use-package))
 '(python-shell-interpreter "/usr/bin/python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "green" :slant normal))))
 '(font-lock-comment-face ((t (:foreground "green" :slant normal)))))
