;; disable creating backup files
(setq make-backup-files nil)

;; disable creating "lockfiles" (.#)
(setq create-lockfiles nil)

;; Enable mouse support inside KDE Konsole / Ghostty / Alacritty
(xterm-mouse-mode 1)

;; Simplify or disable heavy UI features in terminal
(menu-bar-mode -1)

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

(load-theme 'doom-vibrant t)
