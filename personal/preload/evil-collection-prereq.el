;; Evil-collection adds evil binds to a lot of modes not supported by default.
;; For it to work, `evil-want-keybinding' must be nil when evil loads.
;; A lot of the variables here need to be set before evil loads.
;; To add evil support for the minibuffer, it must be loaded before helm and
;; other minibuffer-related packages load.

(setq evil-want-keybinding nil ; needed
      evil-want-C-u-scroll t ; more vim-like
      evil-respect-visual-line-mode t ; nice
      evil-collection-setup-minibuffer t) ; minibuffer
