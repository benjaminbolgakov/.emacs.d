
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; Remove GUI bloat
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

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

;; M-x package-refresh-contents
;; M-x package-install <RET> ivy
;; M-x package-install <RET> ivy-rich
;; M-x package-install <RET> swiper
;; M-x package-install <RET> counsel
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; ---------------------------------------------------
(package-initialize)
(ivy-mode 1)
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
(setq projectile-project-search-path '("~/Documents/Development"))


(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

(setq initial-buffer-choice "~/Documents/Development")

(setq tab-width 4)        ;; set your desired tab width
(setq indent-tabs-mode t) ;; use tabs for indentation

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
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

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

(global-linum-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel-projectile grails-projectile-mode pdf-tools use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
