;; ==========================================================================
;; ======== Defines =========================================================
;; ==========================================================================

;; System identifiers (machine hostname)
(defun at-main-fedora-p ()
  (string= (system-name) "main-fedora"))

(defun at-main-windows-p ()
  (string= (system-name) "main-windows"))

(defun at-work-p ()
  (string= (system-name) "0000L1HF2260GT2"))

;; Set OS-specific variables
(cond
 ((eq system-type 'gnu/linux)
  (setq emacs-dir (concat (getenv "HOME") "/.emacs.d/"))
  (setq emacs-banner (expand-file-name (concat (getenv "HOME") "/.emacs.d/assets/img/emacs_logo.png")))
  (setq working-dir "~/"))
 ((eq system-type 'windows-nt)
  (setq emacs-dir (concat (getenv "USERPROFILE") "\\AppData\\Roaming\\.emacs.d\\"))
  (setq emacs-banner (expand-file-name
                      (concat (getenv "USERPROFILE") "\\AppData\\Roaming\\.emacs.d\\assets\\img\\emacs_logo.png")))
  (setq working-dir (concat (getenv "USERPROFILE") "\\")))
 (t
  (setq emacs-dir (expand-file-name "default/emacs/directory" ""))
  (setq working-dir (expand-file-name "default/default-directory" ""))))

;; Fonts
(setq def-sys-font "Fira Code")
(setq alt-sys-font "Office Code Pro")

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
