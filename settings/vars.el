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

;; ==========================================================================
;; ======== Getters =========================================================
;; ==========================================================================

;; get emacs-dir variable value
(defun get-emacs-dir ()
  emacs-dir)


(provide 'vars)

;; (let ((h (system-name)))
;;   (cond ((at-home-p)
;;          (set-face-attribute 'default nil
;;                              :family "Iosevka"
;;                              :height 110
;;                              :weight 'normal
;;                              :width 'normal))
;;         ((at-thinkpad-p)
;;          (set-face-attribute 'default nil
;;                               :family "Iosevka"
;;                               :height 100
;;                               :weight 'bold
;;                               :width 'normal))
;;          ((at-work-p)
;;           (set-face-attribute 'default nil
;;                               :family "JetBrains Mono"
;;                               :height 90
;;                               :weight 'normal
;;                               :width 'normal))))
