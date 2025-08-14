;; Initialize system-specific configuration
(setq config-loader (expand-file-name "config-loader.el" user-emacs-directory))
(load config-loader 'noerror)

;; 'package-selected-packages' = explicitly installed packages by user. Get's automatically
;; updated by Emacs when installing a new package. Used by 'package-autoremove' to decide
;; which packages are no longer needed. Can be used to (re)install packages on other machines
;; by running: 'package-install-selected-packages'
;; Check if package is contained in this list by running: 'package--user-selected-p'
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3263bd17a7299449e6ffe118f0a14b92373763c4ccb140f4a30c182a85516d7f" "f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077" default))
 '(elpy-rpc-python-command
   "C:\\\\Users\\\\cid14168\\\\AppData\\\\Local\\\\Programs\\\\Python\\\\Python311\\\\python.exe")
 '(max-lisp-eval-depth 1500)
 '(org-agenda-files nil)
 '(org-image-actual-width '(500))
 '(package-selected-packages nil)
 '(python-shell-interpreter "/usr/bin/python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "green" :slant normal))))
 '(font-lock-comment-face ((t (:foreground "green" :slant normal)))))
