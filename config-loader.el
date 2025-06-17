;; Get current machine name and load the main configuration file accordingly
(defun at-home-fedora-p ()
  (string= (system-name) "barbro-fedora"))

(defun at-home-win-p ()
  (string= (system-name) "main-windows"))

(defun at-work-p ()
  (string= (system-name) "0000L1HF2260GT2"))

;; Configurations
(setq config-home-fedora (expand-file-name "configs/home-fedora/home-fedora.el" user-emacs-directory))
(setq config-home-win (expand-file-name "configs/home-win/home-win.el" user-emacs-directory))
(setq config-work (expand-file-name "configs/work/work.el" user-emacs-directory))
(setq config-unknown (expand-file-name "configs/unknown/unknown.el" user-emacs-directory))

;; Configuration loading functions
(defun load-config-home-fedora ()
  (setq dashboard-banner-logo-title "Loaded configuration: home-fedora")
  (setq bookmark-default-file (expand-file-name "configs/home-fedora/bookmarks" user-emacs-directory))
  (load config-home-fedora))

(defun load-config-home-win ()
  (setq dashboard-banner-logo-title "Loaded configuration: home-win")
  (setq bookmark-default-file (expand-file-name "configs/home-win/bookmarks" user-emacs-directory))
  (load config-home-win))

(defun load-config-work ()
  (setq dashboard-banner-logo-title "Loaded configuration: work")
  (setq bookmark-default-file (expand-file-name "configs/work/bookmarks" user-emacs-directory))
  (load config-work))

(defun load-config-unknown ()
  (setq dashboard-banner-logo-title "Loaded configuration: unknown")
  (setq bookmark-default-file (expand-file-name "configs/unknown/bookmarks" user-emacs-directory))
  (load config-unknown))

(cond
 ((at-home-fedora-p)
  (load-config-home-fedora))
 ((at-home-win-p)
  (load-config-home-win))
 ((at-work-p)
  (load-config-work))
 (t
  (load-config-unknown)))
