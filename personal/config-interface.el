;;; interface stuff

;; fuzzy searching
(global-set-key (kbd "C-s") 'consult-line)

;; add descriptions and annotations to search results
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

;; act upon a selection item
(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings))) ;; alternative for `describe-bindings'

;; integration between embark and consult
(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
