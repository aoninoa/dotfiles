;;; early settings
;; disable package.el for elpaca
(setq package-enable-at-startup nil)

(setq inhibit-startup-screen t)

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq-default tab-width 4)
(setq scroll-step 1)

(scroll-bar-mode  -1)

(add-to-list 'default-frame-alist '(font . "NotoSansM Nerd Font Mono 18"))

(normal-erase-is-backspace-mode 1)

;; my key bindings
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-w") 'backward-kill-word)

;; Line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(setq make-backup-files nil)

;; dired
(setq dired-dwim-target t)
(setq dired-isearch-filenames t)

