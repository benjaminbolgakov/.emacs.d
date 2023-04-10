;; TODO:
;; autocompletion for lisp, inside this doc for example
;; Debugging lisp: Running for example "eval-buffer" and recieving an error:
;; "eval-buffer: Invalid read syntax: ")" [2 times]" - how to get more info etc?



;; This solves the error about retrieving marmalade "incomprehensible buffer"
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Systems (hostname of my machines)
(defun at-mainmint ()
  (string= (system-name) "mainmint"))
;; laptop
;; benzelserver?


;; ??????
;; (setq create-lockfiles nil)

;; TODO Start emacs server
;; (server-start)

;; set startup dir
(setq default-directory "~/.emacs.d/")

;; set initial buffer at startup
;; (setq initial-buffer-choice "~/")


;; = Paths =
;; Settings dir
(setq settings-dir
	  (expand-file-name "settings" user-emacs-directory))
;; Functions dir
(setq functions-dir
	  (expand-file-name "functions" user-emacs-directory))
;; List of dirs where separate .el files are stored
(setq load-dir
	  (expand-file-name "load" user-emacs-directory))


(add-to-list 'load-path settings-dir)
(add-to-list 'load-path functions-dir)
(add-to-list 'load-path load-dir)




;; load base-settings
(require 'base)


;; init use-package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "https://elpa.gnu.org/packages/"))
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
;; Load settings
(require 'magit-init)
(require 'theme-init)
(require 'ivy-init)
(require 'docker-init)
(require 'lsp-init)
(require 'flycheck-init)
(require 'c++-init)
(require 'elisp-init)
(require 'projectile-init)
;;(require 'compile-init)
(require 'org-init)
(require 'js-init)
(require 'misc-init)
(require 'cmake-init)
(require 'python-init)
(require 'eshell-init)
(require 'dired-init)
(require 'yas-init)
(require 'pdf-init)
(require 'latex-init)
(require 'avy-init)
(require 'bash-init)
(require 'key-bindings)








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
 '(org-agenda-files '("~/Documents/agenda_org"))
 '(org-image-actual-width '(500))
 '(package-selected-packages
   '(python-mode google-translate modus-themes org-bullets auctex dashboard all-the-icons page-break-lines magit auto-complete jupyter exotica-theme grails-projectile-mode pdf-tools use-package))
 '(python-shell-interpreter "/usr/local/bin/python3" t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "green" :slant normal))))
 '(font-lock-comment-face ((t (:foreground "green" :slant normal)))))
