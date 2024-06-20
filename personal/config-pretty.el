;; config file for pretty stuff

;; cool themes
(use-package kaolin-themes
  :ensure t
  :config
  (load-theme 'kaolin-galaxy t))

;; native transparency
(defun my/native-transparency-set (value)
  (interactive "nTransparency Value 0 - 100 opaque: ")
  (if (not (version<= "29" emacs-version))
      (message "emacs-version must be >= 29")
    ;; set alpha value for current frame and future defaults
    (set-frame-parameter nil 'alpha-background value) ; for current frame
    (add-to-list 'default-frame-alist `(alpha-background . ,value))))

(my/native-transparency-set 90)

;; prettier modeline
;; (use-package mood-line
;;   :ensure t
;;   :config
;;   (mood-line-mode 1)
;;   (setq mood-line-glyph-alist mood-line-glyphs-fira-code)
;;   (setq mood-line-format mood-line-format-default-extended))

;; (use-package all-the-icons-nerd-fonts
;;   :ensure t)

(use-package all-the-icons
  :ensure t
  :config
  (if (eq (string-to-number
           (shell-command-to-string "fc-list | grep -c 'all-the-icons.ttf'"))
          '0)
      (all-the-icons-install-fonts)))

(use-package all-the-icons-nerd-fonts
  :ensure t
  :config
  (if (eq (string-to-number
           (shell-command-to-string "fc-list | grep -c 'NFM.ttf'"))
          '0)
      (nerd-icons-install-fonts)))

;; even prettier modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 25))

;; dashboard
(use-package dashboard
  :ensure t
  :config
  ;; Set the title
  (setq dashboard-banner-logo-title "ゲイへようこそ!!!")
  ;; Set the banner
  (setq dashboard-startup-banner "~/Pictures/Dashboard.png")
  ;; Value can be:
  ;;  - 'official which displays the official emacs logo.
  ;;  - 'logo which displays an alternative emacs logo.
  ;;  - an integer which displays one of the text banners
  ;;    (see dashboard-banners-directory files).
  ;;  - a string that specifies a path for a custom banner
  ;;    currently supported types are gif/image/text/xbm.
  ;;  - a cons of 2 strings which specifies the path of an image to use
  ;;    and other path of a text file to use if image isn't supported.
  ;;    ("path/to/image/file/image.png" . "path/to/text/file/text.txt").
  ;;  - a list that can display an random banner,
  ;;    supported values are: string (filepath), 'official, 'logo andd integers.

  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)
  ;; vertically center content-height
  (setq dashboard-vertically-center-content t)

  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts nil)

  (add-hook 'after-init-hook (lambda ()
                               (dashboard-insert-startupify-lists)))
  (add-hook 'emacs-startup-hook (lambda ()
                                  (switch-to-buffer dashboard-buffer-name)
                                  (goto-char (point-min))
                                  (redisplay)
                                  (run-hooks 'dashboard-after-initialize-hook))))
