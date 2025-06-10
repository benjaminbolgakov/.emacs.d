;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; Remove GUI bloat
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)


;; NOTE: This might be fucking with lots of major modes indentation.
;;       Consider disabling it globally like this:
;; (electric-indent-local-mode -1)

;; Start maximized
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

;; set your desired tab width
;; (setq tab-width 4)
(setq-default tab-width 4)

;; use tabs for indentation
;; (setq indent-tabs-mode t)

;; Disable to fix auto indentation in .h files when pressing Enter
(setq-default electric-indent-mode nil)

;; use spaces for indentation
(setq-default indent-tabs-mode nil)

;; use tabs instead of spaces
(setq-default indent-tabs-mode t)

;; Line numbering
;; Emacs >= 27
(global-display-line-numbers-mode)

;; Disable bookmark icon
(setq bookmark-set-fringe-mark nil)

;; Emacs < 27:
;; (global-linum-mode t)

;; Disable ear damage
(setq visible-bell t)

;; Autofollow symlinks
(setq vc-follow-symlinks t)

;; Disable autosaving
(setq auto-save-default nil)

;; Enable highlighting of matching parenteses.
(show-paren-mode 1)

;; Enable undo/redo for window modifications.
(winner-mode)

;; Kill trailing whitespace on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Save system clipboard to kill ring before kill.
(setq save-interprogram-paste-before-kill t)


(setq scroll-margin 0)
;; Disable scroll acceleration.
(setq mouse-wheel-progressive-speed t)

;; Always redraw while scrolling.
(setq fast-but-imprecise-scrolling nil)
(setq jit-lock-defer-time 0)

;; Skip the step of writing "yes <return>" and settle with writing "y" instead
;; for yes/no prompts.
(defalias 'yes-or-no-p 'y-or-n-p)

;; One Ring to rule them all, One Ring to find them,
;; One Ring to bring them all and in the darkness bind them.
;; Ash nazg durbatulûk, ash nazg gimbatul,
;; Ash nazg thrakatulûk agh burzum-ishi krimpatul.

(provide 'base)
