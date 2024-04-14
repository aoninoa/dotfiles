;;; package.el
(require 'package)
;; add melpa
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; MELPA-stable
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; Marmalade
(add-to-list 'package-archives  '("marmalade" . "https://marmalade-repo.org/packages/"))
;; Org
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; initialize
(package-initialize)

(load-theme 'base16-da-one-gray)
(require 'xclip)
(custom-set-variablesp
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f4868f17f7c5f4ec9c9a5d7341856c1307c768e13211e8197d4f4793debe7ffd" "0c860c4fe9df8cff6484c54d2ae263f19d935e4ff57019999edbda9c7eda50b8" default))
 '(package-selected-packages
   '(base16-theme zenburn-theme xclip use-package rust-mode compat color-theme-sanityinc-tomorrow atom-one-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
