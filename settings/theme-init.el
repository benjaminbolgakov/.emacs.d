;; Load theme
(use-package exotica-theme
  ;; :ensure t  ; Install the package if not already installed
  :defer t
  :init
  (unless (custom-theme-p 'exotica)
    (package-install 'exotica-theme))
  ;; Load the theme
  (load-theme 'exotica t))

;; Load fonts
(let ((h (system-name)))
  (cond ((at-main-fedora-p)
         (validate-font def-sys-font)
         (set-face-attribute 'default nil
                             :family def-sys-font
                             :height 102
                             :weight 'normal
                             :width 'normal))
        ((at-main-windows-p)
         (validate-font def-sys-font)
         (set-face-attribute 'default nil
                             :family def-sys-font
                             :height 102
                             :weight 'normal
                             :width 'normal))
        ((at-work-p)
         (validate-font def-sys-font)
         (set-face-attribute 'default nil
                             :family def-sys-font
                             :height 102
                             :weight 'normal
                             :width 'normal))))

;; Provides utilities for displaying elements of the mode-line as tabs and ribbons.
(use-package moody
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

;; Implements a nested menu giving access to all minor modes.
(use-package minions
  :ensure t
  :config
  (minions-mode 1))

;; Template for displaying title-bar of visible frames.
(setq frame-title-format `("%b@emacs" ,(number-to-string emacs-major-version)))



;;(set-face-attribute 'default t :font

;; (set-face-attribute 'default nil
;;                     :family ""
;;                     :height 110
;;                     :weight 'normal
;;                     :width 'normal)





(provide 'theme-init)


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
