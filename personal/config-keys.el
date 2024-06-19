;; generic keybind-related stuff

;; function to open the prelude personal config dir
(defun my/open-prelude-personal-dir ()
  (interactive)
  (dired prelude-personal-dir))

;; function to switch focus to the last focused window
(defun my/switch-to-last-window ()
  (interactive)
  (let ((win (get-mru-window t t t)))
    (unless win (error "Last window not found"))
    (let ((frame (window-frame win)))
      (select-frame-set-input-focus frame)
      (select-window win))))

(defun my/dired-go-home ()
  (interactive)
  (dired "~"))



;; create leader-key binds using function from preload/leader-key-definer.el
(leader-keybind
  ;; files
  "f" '(:ignore t :which-key "files")
  "ff" '(find-file :which-key "find file")
  "fr" '(recentf :which-key "recent files")
  "fj" '(dired-jump :which-key "dired jump")
  "fp" '(my/open-prelude-personal-dir :which-key "open personal config dir")
  ;; dired stuff (the same stuff for convenience)
  "d" '(:ignore t :which-key "dired")
  "dd" '(find-file :which-key "find file")
  "dr" '(recentf :which-key "recent files")
  "dj" '(dired-jump :which-key "dired jump")
  "dh" '(my/dired-go-home :which-key "home")
  "db" '(dashboard-open :which-key "dashboard")
  ;; buffers
  "k" '(kill-current-buffer :which-key "kill this buffer")
  "K" '(kill-buffer :which-key "kill buffer")
  "b" '(:ignore t :which-key "buffers")
  "bb" '(consult-buffer :which-key "list buffers")
  "bB" '(ibuffer :which-key "ibuffer-menu")
  "bo" '(crux-switch-to-previous-buffer :which-key "last buffer")
  "bn" '(next-buffer :which-key "next buffer")
  "bp" '(previous-buffer :which-key "next buffer")
  "bk" '(kill-current-buffer :which-key "kill this buffer")
  "bK" '(kill-buffer :which-key "kill buffer")
  ;; magit (version control)
  "v" 'magit
  ;; windows
  "w" '(:ignore t :which-key "windows")
  "wv" '(split-window-right :which-key "split right")
  "ws" '(split-window-below :which-key "split below")
  "wd" '(delete-window :which-key "delete window")
  "wD" '(delete-other-windows :which-key "delete other windows")
  "ww" '(my/switch-to-last-window :which-key "last window")
  "wo" '(my/switch-to-last-window :which-key "last window")
  ;; programs
  "a" '(:ignore t :which-key "applications")
  "at" 'vterm)

;; "M-o" by default runs crux-smart-open-line as per the prelude-mode-map,
;; which isn't so useful so set it to a window-switching command instead.
(define-key prelude-mode-map (kbd "M-o") 'ace-window)
