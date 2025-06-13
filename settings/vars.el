;; ==========================================================================
;; ======== Defines =========================================================
;; ==========================================================================

;; System specifics
(setq system-home (getenv "HOME"))
;;(setq default-directory (getenv "HOME"))

;; Assets
(setq emacs-assets (expand-file-name "assets/" user-emacs-directory))
(setq emacs-banner (expand-file-name "img/emacs_logo.png" emacs-assets))

;; Fonts
(setq def-sys-font "Fira Code")
(setq alt-sys-font "Office Code Pro")

;; Working directory
(setq working-dir (expand-file-name (concat system-home "workbench")))

;; Set startup-buffer to dashboard for robustness
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; Strings
(defvar HST-quote "There he goes. One of God's own prototypes.\nA high-powered mutant of some kind never even considered for mass production.\nToo weird to live, and too rare to die.")


(provide 'vars)
