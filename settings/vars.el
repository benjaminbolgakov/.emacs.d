;; ==========================================================================
;; ======== Defines =========================================================
;; ==========================================================================

;; System specifics
(setq system-home (getenv "HOME"))
;;(setq default-directory (getenv "HOME"))

;; Shorthand for emacs home directory
(setq emacs-home user-emacs-directory)

;; Assets
(setq emacs-assets (expand-file-name "assets/" user-emacs-directory))
(setq emacs-banner (expand-file-name "img/emacs_logo.png" emacs-assets))

;; Fonts
(setq def-sys-font "Fira Code")
(setq alt-sys-font "Office Code Pro")

;; Working directory - Set to "workbench" if it exists, else set it to home directory
(setq default-directory
      (let ((target-dir (expand-file-name (concat system-home "/workbench/"))))
        (if (file-exists-p target-dir)
            target-dir
          (expand-file-name "~/"))))

;; Strings
(defvar HST-quote "There he goes. One of God's own prototypes.\nA high-powered mutant of some kind never even considered for mass production.\nToo weird to live, and too rare to die.")


;; ==========================================================================
;; ======== Getters =========================================================
;; ==========================================================================
;; Todo...



(provide 'vars)
