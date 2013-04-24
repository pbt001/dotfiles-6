;; who am i?
(setq user-mail-address "graham.enos@gmail.com")


;; load path
(add-to-list 'load-path "~/.emacs.d/")

;; get rid of menu
(menu-bar-mode -99)


;; layout/etc.
; unicode, unix endings
(prefer-coding-system 'utf-8-unix)
(setq coding-system-for-read 'utf-8-unix)
(setq coding-system-for-write 'utf-8-unix)
; fill column = 79, to make M-q nice
(setq-default fill-column 79)
; spaces, please
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
; throw in column-number-mode
(setq-default column-number-mode t)
; death to tildes!
(setq make-backup-files nil)
; color scheme
(set-background-color "black")
(set-foreground-color "white")
; if that doesn't work
(defun color-set ()
  (interactive)
  (progn (set-background-color "black")
         (set-foreground-color "white")))


;; zshell looks hideous inside M-x shell!!
(setq explicit-shell-file-name "/bin/bash")
(setq shell-file-name "bash")


;; highlight FIXME, TODO, and BUG
(defun highlight-fixme ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\)"
                             1 font-lock-warning-face t))))
; adding to python
(add-hook 'python-mode-hook 'highlight-fixme)
; and c*
(add-hook 'c-mode-common-hook 'highlight-fixme)


;; c, c++, etc. programming
(setq c-default-style "bsd")
(defun my-c-mode-hook ()
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (c-set-offset 'substatement-open 0))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)


;; slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")


;; org mode
(setq org-startup-indented t)


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
