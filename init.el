;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager

(add-to-list 'load-path dotfiles-dir)

(add-to-list 'load-path (concat dotfiles-dir "/starter-kit"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/rinari"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/git-emacs"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(require 'package)

(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))

(package-initialize)
(require 'starter-kit-elpa)

;; packages that can also be found in ELPA or Marmalade
;;(add-to-list 'load-path (concat dotfiles-dir "/vendor/packages"))

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Load up starter kit customizations

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
;;(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
;;(require 'starter-kit-perl)
(require 'starter-kit-ruby)
(require 'starter-kit-js)

(require 'git-emacs)
(require 'git-status)
(require 'git-blame)

(require 'coffee-mode)

(setq ns-pop-up-frames nil)

(regen-autoloads)
(load custom-file 'noerror)

;; You can keep system- or user-specific customizations here
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))

;; Set initial emacs window size
;; (setq default-frame-alist (append (list
;;   '(width  . 180)  ; Width set to 81 characters
;;   '(height . 51)) ; Height set to 60 lines
;;   default-frame-alist))

(ns-toggle-fullscreen)
(setq set-fill-column 120) ; default is 70

;; Basic emacs settings
(setq inhibit-startup-message   t)   ; Don't want any startup message
(setq initial-scratch-message nil)   ; No scratch text
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

;; Blackboard theme
(color-theme-blackboard)
;;(pc-selection-mode)

;; White space
(whitespace-mode) ;http://www.emacswiki.org/emacs/whitespace.el
;; nuke trailing whitespaces when writing to a file
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Mac key bindings
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Backspace should not be delete
(normal-erase-is-backspace-mode 1)

;;(global-linum-mode 1)
(setq column-number-mode t)

;;(toggle-sr-speedbar)
;;(other-window 1)
;;(split-window-horizontally)

;;; init.el ends here

;; My own additions next to all the starter-kit stuff

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:/usr/local/git/bin/:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "/usr/local/git/bin" exec-path)
  (push "/usr/local/bin" exec-path))

(require 'linum)
(require 'undo-tree) ;http://www.dr-qubit.org/download.php?file=undo-tree/undo-tree.el
(require 'elein) ;http://github.com/remvee/elein/raw/master/elein.el
(require 'autopair)
(require 'textmate)
(require 'peepopen) ;; peepopen plugin
(require 'sr-speedbar)
(require 'lusty-explorer)
(require 'php-mode) ;http://php-mode.svn.sourceforge.net/svnroot/php-mode/tags/php-mode-1.5.0/php-mode.el
(require 'rinari)

(textmate-mode)

(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; (autoload 'ack-and-a-half-same "ack-and-a-half" nil t)
;; (autoload 'ack-and-a-half "ack-and-a-half" nil t)
;; (autoload 'ack-and-a-half-find-file-samee "ack-and-a-half" nil t)
;; (autoload 'ack-and-a-half-find-file "ack-and-a-half" nil t)
;; (defalias 'ack 'ack-and-a-half)
;; (defalias 'ack-same 'ack-and-a-half-same)
;; (defalias 'ack-find-file 'ack-and-a-half-find-file)
;; (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

(setq skeleton-pair t)
(setq skeleton-pair-on-word t) ; apply skeleton trick even in front of a word

(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe);; uses c-electric-brace
(global-set-key "(" 'skeleton-pair-insert-maybe);; uses c-electric-paren
;;(global-set-key "\"" 'skeleton-pair-insert-maybe)
;;(global-set-key "'" 'skeleton-pair-insert-maybe)

(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-s") 'ack)
;;(global-set-key (kbd "<C-tab>") 'previous-buffer)
;;(global-set-key (kbd "<C-S-tab>") 'next-buffer)
;;(global-set-key (kbd "<C-return>") 'other-window)
(global-set-key (kbd "C-c C-j") 'clojure-jump)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-ƒ") 'ns-toggle-fullscreen)
;;(global-set-key (kbd "S-<f6>") nil)


;; My minor mode to overwrite other major modes
(defvar beatle-minor-mode-map (make-keymap) "Beatle-minor-mode keymap.")
;; cycle through buffers with ctrl-(shift-)tab
(define-key beatle-minor-mode-map (kbd "<C-tab>") 'previous-buffer)
(define-key beatle-minor-mode-map (kbd "<C-S-tab>") 'next-buffer)
(define-key beatle-minor-mode-map (kbd "<C-return>") 'other-window)
(define-key beatle-minor-mode-map (kbd "<C-S-return>") 'sr-speedbar-select-window)
;;(define-key beatle-minor-mode-map (kbd "C-c C-j") 'clojure-jump)
;;(define-key beatle-minor-mode-map (kbd "C-c C-f") 'lusty-file-explorer)
(define-minor-mode beatle-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " Beatle" 'beatle-minor-mode-map)

(beatle-minor-mode 1)

;; IBuffer
;;(setq ibuffer-default-sorting-mode 'major-mode)
(setq ibuffer-saved-filter-groups
      '(("home"
         ("Clojure" (or (mode . clojure-mode)
                        (filename . "clojure")))
         ("Javascript" (or (mode . esspresso-mode)
                           (mode . js3-mode)
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

(defun toggle-sr-speedbar ()
  (interactive) (if (not (sr-speedbar-exist-p)) (sr-speedbar-toggle)) (sr-speedbar-select-window))
(global-set-key (kbd "<C-M-return>") 'toggle-sr-speedbar)
(global-set-key [f5] 'sr-speedbar-toggle)

(defun phplint-thisfile ()
  (interactive)
  (compile (format "php -l %s" (buffer-file-name))))

(add-hook 'php-mode-hook
          '(lambda ()
             (local-set-key [f7] 'phplint-thisfile)))

(add-hook 'php-mode-hook
          '(lambda () (autopair-mode)))

;; Revert buffers which comes in handy after a git pull
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files."))

(global-set-key (kbd "S-<f5>") 'revert-all-buffers) ;; M-x revert-buffer => reads buffer from file again

;; Jump to browser url
(defun browser-jump (base-url)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myurl (concat base-url myword))
    (browse-url myurl)))

;; Jump to clojure docs
(defun clojure-jump () (interactive)
  (browser-jump "http://clojuredocs.org/search?x=0&y=0&q=%40name+"))

;;(set-frame-parameter (selected-frame) 'alpha '(100 100))
;;(add-to-list 'default-frame-alist '(alpha 100 100))

(require 'smart-tab) ;; make sure smart-tab.el is reachable in your load-path first
(global-smart-tab-mode 1) ;; switch on smart-tab everywhere
(setq smart-tab-completion-functions-alist
      '((emacs-lisp-mode . lisp-complete-symbol)
        (text-mode . dabbrev-completion) ;; this is the "default"
        emacs expansion function
        (clojure-mode . slime-complete-symbol))) ;; see update below

(add-to-list 'smart-tab-disabled-major-modes 'eshell-mode)

(add-hook 'js-mode-hook
          '(lambda ()
             (turn-on-paredit)))

(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-lisp-symbol))

;; Auto-complete
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
;; (ac-config-default)
;; For this see
;; http://github.com/purcell/ac-slime
;; http://groups.google.com/group/clojure/browse_thread/
;; thread/09dde36a2ab572df/1ca36e456d31aa58#1ca36e456d31aa58
;; (require 'ac-slime)
;; (add-hook 'slime-mode-hook 'set-up-slime-ac)
;; (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; (setq ac-sources (append '(ac-source-slime-simple) ac-sources))

(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)

(setq ibuffer-formats '((mark modified read-only " " (name 32 32) " "
                              (size 6 -1 :right) " " (filename 55 55));;" " (mode 16 16 :center)
                    	   (mark " " (name 16 -1) " " filename))
      ibuffer-elide-long-columns t
      ibuffer-eliding-string "..")

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
