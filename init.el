;; TODO:
;; 1. Separate package-specific settings into separate files: ivy-init.el etc..
;; 2. autocompletion for lisp, inside this doc for example
;; 3. Debugging lisp: Running for example "eval-buffer" and recieving an error:
;;    "eval-buffer: Invalid read syntax: ")" [2 times]" - how to get more info etc?
;;    REF: https://www.youtube.com/watch?v=LfwSc-lfFxM and https://www.gnu.org/software/emacs/manual/html_node/elisp/Debugging.html


;; This solves the error about retrieving marmalade "incomprehensible buffer"
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; Remove GUI bloat
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)



;; Key bindings (General)
(global-set-key (kbd "C-c a") 'org-agenda)


;; Line numbering
(global-linum-mode t)

;; Disable ear damage
(setq visible-bell t)

;; Autofollow symlinks
(setq vc-follow-symlinks t)

;; Disable autosaving
(setq auto-save-default nil)

;; Use spaces instead of tabs.
(setq-default indent-tabs-mode nil)

;; Enable highlighting of matching parenteses.
(show-paren-mode 1)

;; Enable undo/redo for window modifications.
(winner-mode)

;; Kill trailing whitespace on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Save system clipboard to kill ring before kill.
(setq save-interprogram-paste-before-kill t)

;; Disable scroll acceleration.
(setq mouse-wheel-progressive-speed t)

;; Always redraw while scrolling.
(setq fast-but-imprecise-scrolling nil)
(setq jit-lock-defer-time 0)

;; Org-Mode
(use-package org-bullets
  :ensure t)




;; Language support
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)))

;; Required for projectile-search-replace
(require 'subr-x)

;; M-x package-refresh-contents
;; M-x package-install <RET> ivy
;; M-x package-install <RET> ivy-rich
;; M-x package-install <RET> swiper
;; M-x package-install <RET> counsel
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "https://elpa.gnu.org/packages/"))
(package-initialize)

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

;; -------------------------------------------------------------------------

;; [M1]
(use-package ivy
  :bind (:map global-map
              ("C-x c" . ivy-resume))
  :config
  (ivy-mode 1))

;; [M2]
;; (use-package ivy
;;   :bind ((("C-x c" . ivy-resume))
;; 		 :config)
;; (ivy-mode 1) ;; only having this is sufficient for ivy to work?

;; Dashboard on startup
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Benzel")
(setq dashboard-startup-banner "~/.emacs.d/emacs_logo.png")
(setq dashboard-center-content t)
(setq dashboard-week-agenda t)


(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)

;; package-install projectile-mode
;; package-install projectile-ripgrep
(projectile-mode 1)
(counsel-projectile-mode)
; bind C-c p som ett prefix för alla projectile-kommandon
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

; Cachea filträdet för projektet (=projectile-find-file blir snabb som attan)
(setq projectile-enable-caching t)
; C-p p för att välja ett projekt under denna sökväg
(setq projectile-project-search-path '("~/"))


(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

(setq initial-buffer-choice "~/")

(setq tab-width 4)        ;; set your desired tab width
(setq indent-tabs-mode t) ;; use tabs for indentation

;; Shell/Bash settings
;;  ("\\.bash\\'" . sh-mode)
;; (add-to-list 'auto-mode-alist '("\\.bash_aliases\\." . sh-mode))
;; # -*- mode: shell-script -*-

;; C/C++ settings
(setq c-default-style "bsd")
(setq c-basic-offset 4)
(setq-default indent-tabs-mode)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;C/C++
;(setq c-default-style "bsd")
;(setq c-basic-offset 2)
;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;; Initialize 'use-package'.
;; (require 'package)
;; (setq package-enable-at-startup nil)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; ;; Marmalade is defunct?
;; ;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;; (package-initialize)

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (eval-when-compile
;;   (require 'use-package))

;; All-The-Icons
(use-package all-the-icons
  :if (display-graphic-p))

;; Page-break



;;Theme
(use-package exotica-theme
  :config (load-theme 'exotica t))

(use-package pdf-tools
  :ensure t
  :config
  ;; Clear the incompatible modes list to remove nag about
  ;; global-linum-mode. linum-mode is being disabled for pdf-view-mode
  ;; a few lines down.
  (setq pdf-view-incompatible-modes nil)
  (pdf-loader-install)
  (defun my/pdf-view-mode-hook ()
    ;; Disable line numbering in pdf-view-mode.
    (linum-mode -1))

  (add-hook 'pdf-view-mode-hook 'my/pdf-view-mode-hook))

(use-package pdf-view
  :ensure nil
  :after pdf-tools
  :bind (:map pdf-view-mode-map
              ;; swiper does not work in pdf-view-mode, use original
              ;; isearch-forward instead.
              ("C-s" . isearch-forward)))

(setq inhibit-splash-screen t)

(setq ada-indent 4)
(setq python-indent-offset 4)

(global-linum-mode t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Documents/agenda_org")))
 '(package-selected-packages
   (quote
    (org-bullets auctex dashboard all-the-icons page-break-lines magit auto-complete jupyter exotica-theme counsel-projectile grails-projectile-mode pdf-tools use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "green" :slant normal))))
 '(font-lock-comment-face ((t (:foreground "green" :slant normal)))))
