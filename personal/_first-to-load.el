;; create a leader-key definer function before loading any of our configs.

;; package for easily setting up leader-key binds (e.g. SPC f r)
(use-package general
  :ensure t
  :after evil
  :config
  (general-create-definer leader-keybind
    :prefix "SPC"
    :keymaps 'override
    :states '(normal visual motion emacs)
    :non-normal-prefix "C-SPC")) ;; ?
