;; Load custom variables from a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Initialize system-specific configuration
(setq config-loader (expand-file-name "config-loader.el" user-emacs-directory))
(load config-loader 'noerror)

;; Install all treesit grammar's defined if not already installed
(dolist (lang (mapcar #'car treesit-language-source-alist))
  (unless (treesit-language-available-p lang)
    (treesit-install-language-grammar lang)))

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
   '("aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "22a0d47fe2e6159e2f15449fcb90bbf2fe1940b185ff143995cc604ead1ea171" "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "83550d0386203f010fa42ad1af064a766cfec06fc2f42eb4f2d89ab646f3ac01" "9b9d7a851a8e26f294e778e02c8df25c8a3b15170e6f9fd6965ac5f2544ef2a9" "7de64ff2bb2f94d7679a7e9019e23c3bf1a6a04ba54341c36e7cf2d2e56e2bcc" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93" "3263bd17a7299449e6ffe118f0a14b92373763c4ccb140f4a30c182a85516d7f" "f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077" default))
 '(elpy-rpc-python-command
   "C:\\\\Users\\\\cid14168\\\\AppData\\\\Local\\\\Programs\\\\Python\\\\Python311\\\\python.exe")
 '(max-lisp-eval-depth 1500)
 '(org-agenda-files nil)
 '(org-image-actual-width '(500))
 '(package-selected-packages
   '(yasnippet which-key wfnames use-package tree-sitter-langs tldr tide pyvenv python-mode projectile-ripgrep pip-requirements org-bullets moody minions magit lsp-ui lsp-ivy json-mode ivy-rich hl-todo highlight-indentation highlight-indent-guides google-translate exotica-theme exec-path-from-shell editorconfig doom-themes dockerfile-mode docker-compose-mode dashboard counsel-tramp counsel-spotify counsel-projectile cmake-ide cmake-font-lock catppuccin-theme avy auctex all-the-icons))
 '(python-shell-interpreter "/usr/bin/python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "green" :slant normal))))
 '(font-lock-comment-face ((t (:foreground "green" :slant normal)))))
