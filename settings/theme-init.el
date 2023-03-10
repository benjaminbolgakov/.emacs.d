;; Load theme
;; First, install the theme using package-manager
(load-theme 'exotica t)

;; (use-package exotica-theme
;;   :config (load-theme 'exotica t))

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
