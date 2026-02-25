;; (require 'tree-sitter)
;; (require 'tree-sitter-langs)
;; (use-package tree-sitter
;;   :ensure t)
;; (use-package tree-sitter-langs
;;   :ensure t)

(setq treesit-language-source-alist
   '((cmake "https://github.com/uyha/tree-sitter-cmake")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; Install actual grammar-data into ~/.emacs.d/tree-sitter
(treesit-install-language-grammar 'tsx)

(provide 'treesit-init)
