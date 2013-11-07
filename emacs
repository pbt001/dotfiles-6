;;; .emacs

;; load stuff
(add-to-list 'load-path "~/.emacs.d")

;; behavior
(prefer-coding-system 'utf-8-unix)
(setq-default fill-coumn 79)
(setq-default indent-tabs-mode nil)
(setq backup-directory-alist '((".*" . "~/.emacs_backups/"))
      coding-system-for-read 'utf-8-unix
      coding-system-for-write 'utf-8-unix
      default-tab-width 4
      c-basic-offset 4
      c-indent-level 4)
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; download packages
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my-packages '(auctex cider clojure-mode color-theme
                             color-theme-solarized haskell-mode markdown-mode
                             paredit recentf reftex slime slime-repl))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; packaged stuff & modes
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(line-number-mode 1)
(global-set-key (kbd "M-/") 'hippie-expand)
(require 'ido)
(ido-mode t)
(load-theme 'solarized-dark t)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 500
      recentf-max-menu-items 60)
(autoload
  'enable-paredit-mode
  "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'cider-mode-hook            #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
