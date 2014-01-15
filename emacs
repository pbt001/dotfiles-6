;;; .emacs

;;; Paths, etc.
;; addition lisp library files
(defvar user-site-lisp-directory (concat user-emacs-directory "site-lisp"))
(add-to-list 'load-path (expand-file-name user-site-lisp-directory))
(let ((default-directory user-site-lisp-directory))
  (normal-top-level-add-subdirs-to-load-path))
;; byte compile everything that needs it
;; (byte-recompile-directory (expand-file-name user-site-lisp-directory) 0)
;; keep backups neatly out of the way in ~/.emacs_backup
(setq backup-directory-alist '(("." . "~/.emacs_backup")))

;;; Download packages
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my-packages '(auctex clojure-mode color-theme
                             haskell-mode markdown-mode paredit))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;; Appearance
(when window-system
  (color-theme-solarized-dark))


;;; Behavior
(prefer-coding-system 'utf-8-unix)
(setq-default fill-coumn 79
              indent-tabs-mode nil)
(setq coding-system-for-read 'utf-8-unix
      coding-system-for-write 'utf-8-unix
      default-tab-width 4
      c-basic-offset 4
      c-indent-level 4
      sentence-end-double-space nil)
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; Packaged stuff & modes
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(line-number-mode 1)
(global-set-key (kbd "M-/") 'hippie-expand)
(dolist (m '(ido recentf)) (require m))
(ido-mode t)
(ido-everywhere t)
(icomplete-mode t)
(recentf-mode 1)
(setq recentf-max-saved-items 500
      recentf-max-menu-items 60)
(dolist (h '(clojure-mode-hook emacs-lisp-mode-hook
                               lisp-mode-hook
                               lisp-interaction-mode-hook
                               scheme-mode-hook))
  (add-hook h '(lambda () (paredit-mode 1))))
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
