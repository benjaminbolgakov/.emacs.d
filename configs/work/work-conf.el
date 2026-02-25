;;;;;;;;;;;;;;;;;;;;;;
; Work Configuration ;
;;;;;;;;;;;;;;;;;;;;;;

;; Show dashboard after init, but never break startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (when (get-buffer "*dashboard*")
              (switch-to-buffer "*dashboard*"))))
