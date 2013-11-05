(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))) ;; .emacs.d/

(setq backup-directory-alist `(("." . ,(expand-file-name (concat dotfiles-dir "backups")))))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/git-emacs"))
;(add-to-list 'load-path (concat dotfiles-dir "/vendor/grizzl"))

(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(require 'package)

(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))

(package-initialize)

(setq inhibit-startup-message t
      initial-scratch-message nil
      make-backup-files nil
      auto-save-list-file-name nil
      auto-save-default nil
      save-place t
      visible-bell t
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      whitespace-style '(trailing lines space-before-tab indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      set-fill-column 120
      ns-pop-up-frames nil
      frame-title-format '(buffer-file-name "%f" ("%b"))
      save-place-file (concat dotfiles-dir "places"))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Fullscreen theme settings
(autoload 'color-theme-blackboard "vendor/blackboard" "" t nil)
(color-theme-blackboard)
(ns-toggle-fullscreen)
(load custom-file 'noerror)

(server-start) ;; used by terminal command line invocation

(require 'rainbow-delimiters)
(require 'cl)
(require 'saveplace)
(require 'uniquify)
(require 'recentf)
(require 'git-emacs)
(require 'git-status)
(require 'coffee-mode)
(require 'undo-tree) ;http://www.dr-qubit.org/download.php?file=undo-tree/undo-tree.el
(require 'elein) ;http://github.com/remvee/elein/raw/master/elein.el
(require 'autopair)
(require 'textmate)
(require 'peepopen) ;; peepopen plugin
(require 'sr-speedbar)
(require 'lusty-explorer)
(require 'php-mode) ;http://php-mode.svn.sourceforge.net/svnroot/php-mode/tags/php-mode-1.5.0/php-mode.el
(require 'smart-tab) ;; make sure smart-tab.el is reachable in your load-path first
(require 'tramp)
(setq tramp-default-method "ssh")

(setq smart-tab-completion-functions-alist
      '((emacs-lisp-mode . lisp-complete-symbol)
        (text-mode . dabbrev-completion) ;; this is the "default"
        emacs expansion function
        (clojure-mode . slime-complete-symbol)))

(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-lisp-symbol))

;; required to run ack command
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:/usr/local/git/bin/:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "/usr/local/git/bin" exec-path)
  (push "/usr/local/bin" exec-path))

;; Autoload
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js3-mode))

;; Modes

;; (require 'grizzl)
;; (projectile-global-mode)
;; (setq projectile-enable-caching t)
;; (setq projectile-completion-system 'grizzl)
;; ;; Press Command-p for fuzzy find in project
;; (global-set-key (kbd "s-p") 'projectile-find-file)
;; ;; Press Command-b for fuzzy switch buffer
;; (global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

(tooltip-mode -1)
(blink-cursor-mode -1)
(auto-fill-mode -1)

(mouse-wheel-mode 1)
(setq column-number-mode 1)
(show-paren-mode 1) ;; Highlight matching parentheses when the point is on them.
(auto-compression-mode 1) ;; Transparently open compressed files
(global-font-lock-mode 1) ;; Enable syntax highlighting for older Emacsen that have it off
(recentf-mode 1)
(normal-erase-is-backspace-mode 1) ;; Backspace should not be delete
(hl-line-mode 1)
(global-smart-tab-mode 1) ;; switch on smart-tab everywhere
(desktop-save-mode 1)

(global-rainbow-delimiters-mode)
(whitespace-mode) ;http://www.emacswiki.org/emacs/whitespace.el
(textmate-mode)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10))

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines nil)
(set-default 'imenu-auto-rescan t)

(delete 'try-expand-line hippie-expand-try-functions-list)

;; Key bindings
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-s") 'ack)
(global-set-key (kbd "<C-tab>") 'previous-buffer)
(global-set-key (kbd "<C-S-tab>") 'next-buffer)
(global-set-key (kbd "<C-return>") 'other-window)
(global-set-key (kbd "C-M-k") 'delete-window)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-ƒ") 'ns-toggle-fullscreen)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

(global-set-key (kbd "C-S-f") 'follow-mode)

(global-set-key (kbd "C-x a") 'my-align-single-equals)

(global-set-key (kbd "<C-M-return>") 'toggle-sr-speedbar)
(global-set-key [f5] 'sr-speedbar-toggle)

(global-set-key (kbd "S-<f5>") 'revert-all-buffers) ;; M-x revert-buffer => reads buffer from file again

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

;; IBuffer
(setq ibuffer-saved-filter-groups
      '(("home"
         ("Clojure" (or (mode . clojure-mode)
                        (filename . "clojure")))
         ("Python" (or (mode . pyhton-mode)
                        (filename . "py")))
         ("Javascript" (or (mode . esspresso-mode)
                           (mode . js3-mode)
                           (mode . js2-mode)
                           (mode . js-mode)
                           (filename . "js")))
         ("Ruby" (or (mode . ruby-mode)
                     (filename . "rb")))
         ("PHP" (or (mode . php-mode)
                    (filename . "php")))
         ("Org" (or (mode . org-mode)
                    (filename . "org")))
         ;;        ("Subversion" (name . "\*svn"))
         ("Emacs-config" (or (filename . ".emacs.d")
                             (filename . "emacs-config")))
         ("ERC" (mode . erc-mode))
         ("Help" (or (name . "\*Help\*")
                     (name . "\*Apropos\*")
                     (name . "\*info\*"))))))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "home")))

(setq ibuffer-show-empty-filter-groups nil)

(setq ibuffer-formats '((mark modified read-only " " (name 32 32) " "
                              (size 6 -1 :right) " " (filename 55 55));;" " (mode 16 16 :center)
                    	   (mark " " (name 16 -1) " " filename))
      ibuffer-elide-long-columns t
      ibuffer-eliding-string "..")

;; Util functions
(defun toggle-sr-speedbar ()
  (interactive) (if (not (sr-speedbar-exist-p)) (sr-speedbar-toggle)) (sr-speedbar-select-window))

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files."))

(defvar autopair-modes '(r-mode ruby-mode js3-mode))
(defun turn-on-autopair-mode () (autopair-mode 1))
(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))
(defun turn-on-hl-mode () (hl-line-mode 1))
(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-hl-mode))

(defun my-align-single-equals ()
  "Align on a single equals sign (with a space either side)."
  (interactive)
  (align-regexp
   (region-beginning) (region-end) "\\(\\s-*\\) = " 1 0 nil))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(eval-after-load 'paredit
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(defun turn-on-paredit ()
  (paredit-mode t))

(font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):" 1 font-lock-warning-face t)))

;; Default package installation
(defvar default-packages (list 'autopair
                               'clojure-mode
                               ;;'clojure-test-mode
                               'color-theme
                               'css-mode
                               'elein
                               'find-file-in-project
                               ;;'gist
                               'haml-mode
                               'idle-highlight
                               'lusty-explorer
                               'magit
                               'markdown-mode
                               'mark-multiple
                               'paredit
                               'php-mode
                               'sass-mode
                               'scpaste
                               'scss-mode
                               'swank-clojure
                               'undo-tree
                               'yaml-mode
                               'yasnippet-bundle)
  "Libraries that should be installed by default.")

(defun default-packages-install ()
  (interactive)
  (dolist (package default-packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

;(default-packages-install)

