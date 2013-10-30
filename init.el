(server-start)
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
;;(add-to-list 'load-path (concat dotfiles-dir "/vendor/js2-refactor"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/git-emacs"))
;(add-to-list 'load-path (concat dotfiles-dir "/vendor/grizzl"))
;(add-to-list 'load-path (concat dotfiles-dir "/vendor/helm"))

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
;(require 'starter-kit-ruby)
;(require 'starter-kit-js)

(require 'git-emacs)
(require 'git-status)
(require 'git-blame)

(require 'coffee-mode)

(require 'tramp)
(setq tramp-default-method "ssh")

(require 'powerline)
(require 'ag)
(setq ag-highlight-search t)

;; (require 'grizzl)
;; (require 'projectile)
;; ;(require 'helm-config)

;; (projectile-global-mode)
;; (setq projectile-enable-caching t)
;; (setq projectile-completion-system 'grizzl)
;; ;; Press Command-p for fuzzy find in project
;; (global-set-key (kbd "s-p") 'projectile-find-file)
;; ;; Press Command-b for fuzzy switch buffer
;; (global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
;; (setq projectile-require-project-root nil)

;; Load Perspective
;;(require 'perspective)
;; Toggle the perspective mode
;;(persp-mode)

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

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

;;(require 'linum)
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

;;(setq skeleton-pair t)
;;(setq skeleton-pair-on-word t) ; apply skeleton trick even in front of a word

;;(global-set-key "[" 'skeleton-pair-insert-maybe)
;;(global-set-key "{" 'skeleton-pair-insert-maybe);; uses c-electric-brace
;;(global-set-key "(" 'skeleton-pair-insert-maybe);; uses c-electric-paren
;;(global-set-key "\"" 'skeleton-pair-insert-maybe)
;;(global-set-key "'" 'skeleton-pair-insert-maybe)

(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-s") 'ack)
(global-set-key (kbd "C-S-r") 'occur)
(global-set-key (kbd "<C-tab>") 'previous-buffer)
(global-set-key (kbd "<C-S-tab>") 'next-buffer)
(global-set-key (kbd "<C-return>") 'other-window)
(global-set-key (kbd "C-M-k") 'delete-window)
(global-set-key (kbd "C-c C-j") 'clojure-jump)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-ƒ") 'ns-toggle-fullscreen)
;;(global-set-key (kbd "S-<f6>") nil)


;; My minor mode to overwrite other major modes
;;(defvar beatle-minor-mode-map (make-keymap) "Beatle-minor-mode keymap.")
;; cycle through buffers with ctrl-(shift-)tab
;;(define-key beatle-minor-mode-map (kbd "<C-tab>") 'previous-buffer)
;;(define-key beatle-minor-mode-map (kbd "<C-S-tab>") 'next-buffer)
;;(define-key beatle-minor-mode-map (kbd "<C-return>") 'other-window)
;;(define-key beatle-minor-mode-map (kbd "<C-S-return>") 'sr-speedbar-select-window)
;;(define-key beatle-minor-mode-map (kbd "C-c C-j") 'clojure-jump)
;;(define-key beatle-minor-mode-map (kbd "C-c C-f") 'lusty-file-explorer)
;; (define-minor-mode beatle-minor-mode
;;   "A minor mode so that my key settings override annoying major modes."
;;   t " Beatle" 'beatle-minor-mode-map)

;; (beatle-minor-mode 1)

;; IBuffer
;;(setq ibuffer-default-sorting-mode 'major-mode)
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

;; (add-hook 'js-mode-hook
;;           '(lambda ()
;;              (turn-on-paredit)))

(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-lisp-symbol))

;; (yas/define-snippets 'js3-mode
;;                      '(("for" "for (var i=0;i<${len};i++) {\n$0\n}" "for" nil nil nil nil nil)
;;                        ("forin" "for (var ${i} in ${var}) {\n$0\n}" "forin" nil nil nil nil nil)
;;                        ("if" "if (${cond}) $0" "if" nil nil nil nil nil)
;;                        ("ifm" "if (${cond}) {\n$0\n}" "if" nil nil nil nil nil)
;;                        ("else" "if (${cond}) {\n$0\n} else {\n\n}" "if else"  nil nil nil nil nil)
;;                        ("var" "var ${variable} = ${value};" "var"  nil nil nil nil nil)
;;                        ("f" "function(${args}) {\n$0\n}" "function" nil nil nil nil nil)
;;                        ("l" "console.log('${message}');" "console.log"  nil nil nil nil nil))
;;                      '(text-mode))

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


;; swank.js see
;; https://raw.github.com/magnars/.emacs.d/master/setup-slime-js.el
;; M-x package-install swank-js

;; Set up slime-js
;;
;; To install, see https://github.com/swank-js/swank-js/wiki/Installation
;;
;; This is what I did:
;;
;;     npm install swank-js -g
;;     M-x package-install slime-js
;;
;; The slime-js version in marmalade requires swank 2010.04.04, or at least
;; one prior to the breaking change in 2011.
;;
;; It also requires js2-mode, which is a good choice in either case. I highly
;; recommend this fork:
;;
;;     https://github.com/mooz/js2-mode
;;
;; My settings found in this file also requires js2-refactor:
;;
;;     https://github.com/magnars/js2-refactor.el
;;
;; I have included this file in init.el like so:
;;
;;     (add-hook 'after-init-hook
;;               #'(lambda ()
;;                   (when (locate-library "slime-js")
;;                     (require 'setup-slime-js))))
;;


(require 'slime)
(require 'slime-js)

(setq slime-js-target-url "http://localhost:3000")
(setq slime-js-connect-url "http://localhost:8009")
(setq slime-js-starting-url "/")
(setq slime-js-swank-command "swank-js")
(setq slime-js-swank-args '())
(setq slime-js-browser-command "open -a \"Google Chrome\"")
(setq slime-js-browser-jacked-in-p nil)

(add-hook 'js3-mode-hook (lambda () (slime-js-minor-mode 1)))

(defun slime-js-run-swank ()
  "Runs the swank side of the equation."
  (interactive)
  (apply #'make-comint "swank-js"  slime-js-swank-command nil slime-js-swank-args))

(defun slime-js-jack-in-node ()
  "Start a swank-js server and connect to it, opening a repl."
  (interactive)
  (slime-js-run-swank)
  (sleep-for 1)
  (setq slime-protocol-version 'ignore)
  (slime-connect "localhost" 4005))

(defun slime-js-jack-in-browser ()
  "Start a swank-js server, connect to it, open a repl, open a browser, connect to that."
  (interactive)
  (slime-js-jack-in-node)
  (sleep-for 2)
  (slime-js-set-target-url slime-js-target-url)
  (shell-command (concat slime-js-browser-command " " slime-js-connect-url slime-js-starting-url))
  (sleep-for 3)
  (setq slime-remote-history nil)
  (slime-js-sticky-select-remote (caadr (slime-eval '(js:list-remotes))))
  (setq slime-js-browser-jacked-in-p t)
  (global-set-key [f5] 'slime-js-reload))

(defadvice save-buffer (after save-css-buffer activate)
  (when (and slime-js-browser-jacked-in-p (eq major-mode 'css-mode))
    (slime-js-refresh-css)))

;; (require 'js2-mode)
;; (require 'js2-refactor)

;; (defun js2-eval-friendly-node-p (n)
;;   (or (and (js2-stmt-node-p n) (not (js2-block-node-p n)))
;;       (and (js2-function-node-p n) (js2-function-node-name n))))

;; (defun slime-js--echo-result (result &rest _)
;;   (message result))

;; (defun slime-js--replace-with-result (replacement beg end)
;;   (save-excursion
;;     (goto-char beg)
;;     (delete-char (- end beg))
;;     (insert replacement)))

;; (defun slime-js-eval-region (beg end &optional func)
;;   (lexical-let ((func (or func 'slime-js--echo-result))
;;                 (beg beg)
;;                 (end end))
;;     (slime-flash-region beg end)
;;     (slime-js-eval
;;      (buffer-substring-no-properties beg end)
;;      #'(lambda (s) (funcall func (cadr s) beg end)))))

;; (defun slime-js-eval-statement (&optional func)
;;   (let ((node (js2r--closest 'js2-eval-friendly-node-p)))
;;     (slime-js-eval-region (js2-node-abs-pos node)
;;                           (js2-node-abs-end node)
;;                           func)))

;; (defun slime-js-eval-current ()
;;   (interactive)
;;   (if (use-region-p)
;;       (slime-js-eval-region (point) (mark))
;;     (slime-js-eval-statement)))

;; (defun slime-js-eval-and-replace-current ()
;;   (interactive)
;;   (if (use-region-p)
;;       (slime-js-eval-region (point) (mark) 'slime-js--replace-with-result)
;;     (slime-js-eval-statement 'slime-js--replace-with-result)))

;; (define-key slime-js-minor-mode-map (kbd "C-x C-e") 'slime-js-eval-current)
;; (define-key slime-js-minor-mode-map (kbd "C-c C-e") 'slime-js-eval-and-replace-current)

;; ;; Remove slime-minor-mode from mode line if diminish.el is installed
;; (when (boundp 'diminish)
;;   (diminish 'slime-js-minor-mode))

(define-key slime-js-minor-mode-map (kbd "C-x C-e") 'slime-eval-last-expression)

(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js3-mode))

(defvar autopair-modes '(r-mode ruby-mode js3-mode))
(defun turn-on-autopair-mode () (autopair-mode 1))
(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))

(defun turn-on-hl-mode () (hl-line-mode 1))
(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-hl-mode))


;; (require 'paredit)
;; (defadvice paredit-mode (around disable-autopairs-around (arg))
;;   "Disable autopairs mode if paredit-mode is turned on"
;;   ad-do-it
;;   (if (null ad-return-value)
;;       (autopair-mode 1)
;;     (autopair-mode 0)
;;     ))

;; (ad-activate 'paredit-mode)

(defun my-align-single-equals ()
  "Align on a single equals sign (with a space either side)."
  (interactive)
  (align-regexp
   (region-beginning) (region-end)
   "\\(\\s-*\\) = " 1 0 nil))

(global-set-key (kbd "C-x a") 'my-align-single-equals)

(auto-fill-mode -1)

(remove-hook 'text-mode-hook 'turn-on-auto-fill)

(desktop-save-mode 1)
(add-to-list 'desktop-modes-not-to-save 'dired-mode)

(hl-line-mode 1)
