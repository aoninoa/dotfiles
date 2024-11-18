(setq package-enable-at-startup nil)

(setq inhibit-startup-message t)

(add-to-list 'default-frame-alist '(font . "Noto Sans Mono 14"))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(setq make-backup-files nil)

(global-set-key (kbd "C-h") 'delete-backward-char)

(set-message-beep 'silent)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
 
;; download package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; theme
(straight-use-package 'base16-theme)
(use-package base16-theme
  :straight t
  :ensure t
  :config
  (load-theme 'base16-default-dark t))

(straight-use-package 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; move around the region
(straight-use-package 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; multiple cursors
(straight-use-package 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(straight-use-package 'typescript-mode)
