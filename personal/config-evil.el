;;; additional configs for evil
;;; (configs needed for evil before it loads are in
;;;  preload/evil-collection-prereq.el).

;;; tweak evil a little

(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;; modes to exclude from evil-mode
(dolist (mode '(custom-mode
                eshell-mode
                git-rebase-mode
                erc-mode
                term-mode))
  (add-to-list 'evil-emacs-state-modes mode))

;;; add evil binds to many more modes

(use-package evil-collection
  :ensure t
  :after evil
  :init
  (evil-collection-init))

;;; evil mode for org mode

(use-package evil-org
  :ensure t
  :after (evil org)
  :hook ((org-mode . evil-org-mode)
         (org-agenda-mode . evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-set-key-theme '(navigation todo insert textobjects additional))
  (evil-org-agenda-set-keys))

(with-eval-after-load 'org
  (evil-define-key '(normal insert visual) org-mode-map (kbd "C-j") 'org-next-visible-heading)
  (evil-define-key '(normal insert visual) org-mode-map (kbd "C-k") 'org-previous-visible-heading)
  (evil-define-key '(normal insert visual) org-mode-map (kbd "M-j") 'org-metadown)
  (evil-define-key '(normal insert visual) org-mode-map (kbd "M-k") 'org-metaup))


;; most of this file is copied from here
;; https://codeberg.org/daviwil/dotfiles/src/branch/master/.emacs.d/modules/dw-keys-evil.el
