;; Major mode for standard Dockerfile file format.
(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile")

;; Major mode for editing docker-compose files.
(use-package docker-compose-mode
  :ensure t
  :mode "docker-compose.yml")


(provide 'docker-init)
