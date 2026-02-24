;; Configurations
(setq config-general (expand-file-name "configs/general-conf.el" user-emacs-directory))
(setq config-linux (expand-file-name "configs/linux/linux-conf.el" user-emacs-directory))
(setq config-windows (expand-file-name "configs/windows/windows-conf.el" user-emacs-directory))
(setq config-work (expand-file-name "configs/work/work-conf.el" user-emacs-directory))
(setq config-unknown (expand-file-name "configs/unknown/unknown-conf.el" user-emacs-directory))

;; Configuration loading functions
(defun load-config-linux ()
  (setq dashboard-banner-logo-title "Loaded configuration: linux")
  (setq bookmark-default-file (expand-file-name "configs/linux/bookmarks" user-emacs-directory))
  (setq org-agenda-files (list "benzel-agenda.org"))
  (load config-linux))

(defun load-config-windows ()
  (setq dashboard-banner-logo-title "Loaded configuration: windows")
  (setq bookmark-default-file (expand-file-name "configs/windows/bookmarks" user-emacs-directory))
  (load config-windows))

(defun load-config-work ()
  (setq dashboard-banner-logo-title "Loaded configuration: work")
  (setq bookmark-default-file (expand-file-name "configs/work/bookmarks" user-emacs-directory))
  (load config-work))

(defun load-config-unknown ()
  (setq dashboard-banner-logo-title "Loaded configuration: unknown")
  (setq bookmark-default-file (expand-file-name "configs/unknown/bookmarks" user-emacs-directory))
  (load config-unknown))

;; Load general configuration
(load config-general)

;; Load system specific configurations
(cond
 ((eq system-type 'gnu/linux)
  (if (string= system-name "0000L1HF2260GT2")
      (load-config-work)
    (load-config-linux)))
 ((eq system-type 'windows-nt)
  (load-config-windows))
 (t
  (load-config-unknown)))
