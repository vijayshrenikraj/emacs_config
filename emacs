(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" default))
 '(highlight-indent-guides-auto-character-face-perc 30)
 '(highlight-indent-guides-method 'character)
 '(highlight-indent-guides-suppress-auto-error t)
 '(package-selected-packages '(origami highlight-indent-guides zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; theme
(load-theme 'zenburn t)

;; highlight indent
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; line number
(global-display-line-numbers-mode 1)

;; move next and previous 5 lines
(global-set-key (kbd "M-n")
    (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p")
    (lambda () (interactive) (previous-line 5)))

;; search word under cursor
(global-set-key (kbd "M-s")
    (lambda () (interactive) (isearch-forward-symbol-at-point)))

;; python indentation
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 2)
        (setq python-indent-offset 2)))

;; origami - close / open node
(require 'origami)
(add-hook origami-mode)
;;(global-set-key 'C-<return>' origami-toggle-node)
