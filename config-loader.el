;; Get current machine name and load the main configuration file accordingly
(defun at-home-fedora-p ()
  (string= (system-name) "barbro-fedora"))

(defun at-home-win-p ()
  (string= (system-name) "main-windows"))

(defun at-work-p ()
  (string= (system-name) "0000L1HF2260GT2"))

;; Configurations
(setq config-home-fedora (expand-file-name "configs/home-fedora.el" user-emacs-directory))
(setq config-home-win (expand-file-name "configs/home-win.el" user-emacs-directory))
(setq config-work (expand-file-name "configs/work.el" user-emacs-directory))

(cond
 ((at-home-fedora-p)
  (load config-home-fedora))
 ((at-home-win-p)
  (load config-home-win))
 ((at-work-p)
  (load config-work)))
