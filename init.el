; package managers
(add-to-list 'load-path "~/.emacs.d/custom/")
(setq package-archives
'(("gnu" . "http://elpa.gnu.org/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")
("melpa" . "http://melpa.milkbox.net/packages/")))

;; go to other window
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "M-o") 'other-window)

;; dabbrev-expand
;;(global-set-key (kbd "TAB") 'dabbrev-expand)

;; set helm-occur
(global-set-key (kbd "M-s") 'helm-occur)

;; set M-n and M-p
(defun next-5-lines()
  "Call `next-line` 5 times"
  (interactive)
  (next-line 5))
(global-set-key (kbd "M-n") 'next-5-lines)
(defun previous-5-lines()
  "Call `previous-line` 5 times"
  (interactive)
  (previous-line 5))
(global-set-key (kbd "M-p") 'previous-5-lines)

;; top-bottom-recenter
(setq recenter-positions '(top bottom middle))

;; also set M-l as recenter-top-bottom
(global-set-key (kbd "M-l") 'recenter-top-bottom)

;; Set helm-index
(global-set-key (kbd "M-i") 'helm-imenu-in-all-buffers)

;; set delete buffer
(global-set-key (kbd "M-C-k") 'kill-this-buffer)

;; magit diff for single file
(global-set-key (kbd "C-c m d") 'magit-diff-buffer-file)
(global-set-key (kbd "C-c m f") 'magit-file-popup)

;;magit
(global-set-key (kbd "M-m") 'magit)

;;revert buffer
(defun my-revert-buffer-noconfirm ()
  "Call `revert-buffer' with the NOCONFIRM argument set."
  (interactive)
  (revert-buffer nil t))
(global-set-key (kbd "M-r") 'my-revert-buffer-noconfirm)

;; line number
(require 'linum)
(global-linum-mode t)
;; use customized linum-format: add a addition space after the line number
(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat "%"
(number-to-string w) "d  ")) line) 'face 'linum)))

;; Duplicate-line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (move-beginning-of-line 1)
)
(global-set-key (kbd "C-d") 'duplicate-line)

;; set global search
(global-set-key (kbd "C-M-s") 'rgrep)

;; helm-find-files
;;(global-set-key (kbd "C-x C-f") 'projectile-find-file)

;; flymake ruby
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
;;; flymake-ruby.el ends here

;; ido mode
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; auto-complete
(setq auto-complete-mode t)
(setq global-auto-complete-mode t)

;;paranthesis mode
(show-paren-mode t)

;;dumb jump
;;(dumb-jump-mode)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;;show line numbers
(global-linum-mode 1)

;; enable ido mode
(require 'ido)
(ido-mode t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("624f3b1e86a81d1873b93edc3cce0947f2042bfeebecc480b393ff1e0aa4abfd" default)))
 '(package-selected-packages
   (quote
    (typescript-mode flycheck csv-mode vlf dumb-jump git-blamed git helm magit haskell-mode ctags-update smart-mode-line diff-hl textmate auto-complete robe rainbow-delimiters rainbow-mode aggressive-indent)))
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; requre MELPA
(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives
    '("MELPA" .
      "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; enable rainbow-delimiters-mode
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; enable robe (jump to class/module definition)
(global-robe-mode t)

;; auto reload buffers when files changes
(global-auto-revert-mode t)

;; do not save backup files
(setq make-backup-files nil)


;; make case insensitive
(setq case-fold-search t)   ; make searches case insensitive

;; path to ctags
(setq path-to-ctags "~/Desktop/onelogin/ctags/") ;;
(defun create-tags (dir-name)
    "Create tags file."
    (interactive "DDirectory: ")
    (shell-command
     (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
  )

;; git
(require 'git)

(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)

;; projectile key modifiers
(setq mac-command-modifier 'super)


;;search word under
(defun xah-search-current-word ()
  "Call `isearch' on current word or text selection.
“word” here is A to Z, a to z, and hyphen 「-」 and underline 「_」, independent of syntax table.
URL `http://ergoemacs.org/emacs/modernization_isearch.html'
Version 2015-04-09"
  (interactive)
  (let ( $p1 $p2 )
    (if (use-region-p)
        (progn
          (setq $p1 (region-beginning))
          (setq $p2 (region-end)))
      (save-excursion
        (skip-chars-backward "-_A-Za-z0-9")
        (setq $p1 (point))
        (right-char)
        (skip-chars-forward "-_A-Za-z0-9")
        (setq $p2 (point))))
    (setq mark-active nil)
    (when (< $p1 (point))
      (goto-char $p1))
    (isearch-mode t)
    (isearch-yank-string (buffer-substring-no-properties $p1 $p2))))

(global-set-key (kbd "M-s") 'xah-search-current-word)
(global-set-key (kbd "C-s") 'isearch-forward)

;; delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)







;; typescript
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
