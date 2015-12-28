(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(set-face-attribute 'default nil :font "Monaco" :height 120)
;(setq-default line-spacing 1)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name))) ;; .emacs.d/

(setq backup-directory-alist `(("." . ,(expand-file-name (concat dotfiles-dir "backups")))))

;(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file "~/.emacs.d/vendor/custom.el")

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq inhibit-startup-message t
      initial-scratch-message nil
      make-backup-files nil
      auto-save-list-file-name nil
      auto-save-default nil
      save-place t
      visible-bell t
      echo-keystrokes 0.1
      font-lock-maximum-decoration 6
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
      set-fill-column 100
      fill-column 100
      ns-pop-up-frames nil
      frame-title-format '(buffer-file-name "%f" ("%b"))
      save-place-file (concat dotfiles-dir "places"))

(setq-default cursor-type 'bar)

(setq explicit-shell-file-name "/usr/local/bin/fish")

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args ""
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Fullscreen theme settings
(require 'color-theme)
(color-theme-initialize)
(load-file (concat dotfiles-dir "/vendor/blackboard.el"))
(color-theme-blackboard)
(highlight-numbers-mode 1)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/themes/")
;; (load-theme 'monokai t)
;;(setq linum-delay t)
;;(global-linum-mode 1)


;; (require 'sublimity)
;; (require 'sublimity-scroll)
;; ;;(require 'sublimity-map)
;; (sublimity-mode 1)
(setq ns-use-native-fullscreen nil)

(load custom-file)

(if (and (fboundp 'server-running-p)
         (not (server-running-p)))
    (server-start))

(server-start) ;; used by terminal command line invocation

(require 'saveplace)
(require 'uniquify)
(require 'recentf)

;(require 'textmate)
(require 'sr-speedbar)
(require 'smart-tab)
(require 'lusty-explorer)
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

(require 'yasnippet)
(yas/global-mode 1)

(require 'align-cljlet)

;(auto-dim-other-buffers-mode 1)
;(set-face-attribute 'auto-dim-other-buffers-face nil :background "#383836")

;(require 'flx-ido)
;(ido-mode 1)
;(ido-everywhere 1)
;(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
;(setq ido-use-faces nil)

;; (setq smart-tab-completion-functions-alist
;;       '((emacs-lisp-mode . lisp-complete-symbol)
;;         (text-mode . dabbrev-completion) ;; this is the "default"
;;         emacs expansion function))

;; (setq hippie-expand-try-functions-list
;;       '(yas/hippie-try-expand
;;         try-expand-dabbrev
;;         try-expand-dabbrev-all-buffers
;;         try-expand-dabbrev-from-kill
;;         try-complete-file-name
;;         try-complete-lisp-symbol))

;; required to run ack command
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:/usr/local/git/bin/:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "/usr/local/git/bin" exec-path)
  (push "/usr/local/go/bin" exec-path)
  (push "/usr/local/bin" exec-path))

;; Autoload
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js3-mode))

(autoload 'coffee-mode "coffee-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))


;; Modes
(tooltip-mode -1)
(blink-cursor-mode -1)
(auto-fill-mode -1)

(projectile-global-mode)

(mouse-wheel-mode 1)
(setq column-number-mode 1)
(show-paren-mode 1) ;; Highlight matching parentheses when the point is on them.
(auto-compression-mode 1) ;; Transparently open compressed files
(global-font-lock-mode 1) ;; Enable syntax highlighting for older Emacsen that have it off
(recentf-mode 1)
(normal-erase-is-backspace-mode 1) ;; Backspace should not be delete
(global-hl-line-mode 1)
(global-smart-tab-mode 1) ;; switch on smart-tab everywhere
(desktop-save-mode 1)


(whitespace-mode) ;http://www.emacswiki.org/emacs/whitespace.el
;(textmate-mode)

(electric-pair-mode 1)

;;(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(defun delete-trailing-whitespace-special()
  "Delete trailing whitespace when not in markdown mode"
  (when (not (eq major-mode 'markdown-mode))
    (delete-trailing-whitespace)))

(add-hook 'before-save-hook 'delete-trailing-whitespace-special)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(autoload 'puppet-mode "puppet-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines nil)
(set-default 'imenu-auto-rescan t)

(delete 'try-expand-line hippie-expand-try-functions-list)

;; Go-mode
(setq default-tab-width 2)

(add-hook 'python-mode-hook '(lambda ()
 (setq tab-width 2)))

;; Scroll Settings
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Key bindings
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;; (global-set-key (kbd "C-x C-d") 'helm-browse-project)


(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-s") 'ack)
(global-set-key (kbd "C-S-t") 'ack-find-file)
(global-set-key (kbd "<C-tab>") 'previous-buffer)
(global-set-key (kbd "<C-S-tab>") 'next-buffer)
(global-set-key (kbd "<C-return>") 'other-window)
(global-set-key (kbd "C-M-k") 'delete-window)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-ƒ") 'toggle-frame-fullscreen)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-o") 'projectile-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-j") 'ido-switch-buffer)

(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

(global-set-key (kbd "C-S-f") 'follow-mode)

(global-set-key (kbd "C-x a") 'my-align-single-equals)

(global-set-key (kbd "<C-M-return>") 'toggle-sr-speedbar)
(global-set-key [f5] 'sr-speedbar-toggle)

(global-set-key (kbd "S-<f5>") 'revert-all-buffers) ;; M-x revert-buffer => reads buffer from file again
;;(global-set-key (kbd "<f6>") 'writeroom-mode) ;; M-x revert-buffer => reads buffer from file again

(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer);
(global-set-key (kbd "C-x C-m") 'move-buffer-file);

(global-set-key (kbd "M-s") 'swap-windows);
(global-set-key (kbd "C-<right>") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "C-<left>") 'paredit-backward-barf-sexp)

(global-set-key (kbd "M-[") 'indent-rigidly-left-to-tab-stop)
(global-set-key (kbd "M-]") 'indent-rigidly-right-to-tab-stop)

(global-set-key (kbd "C-M-i") 'align-cljlet)

;;(global-set-key (kbd "C-c C-r") 'go-run)
(add-hook 'go-mode-hook
          (lambda () (local-set-key (kbd "C-c C-r") #'go-run)))

(add-hook 'cider-mode-hook
          (lambda () (local-set-key (kbd "M-[") #'cider-format-defun)))

(add-hook 'paredit-mode-hook
          (lambda () (local-set-key (kbd "C-<up>") #'paredit-splice-sexp)))

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

;; IBuffer
(setq ibuffer-saved-filter-groups
      '(("home"
         ("Clojure" (or (mode . clojure-mode)
                        (filename . "clojure")
                        (filename . "boot")))
         ("Emacs" (or (filename . ".emacs.d")
                      (filename . "emacs-config")))
         ("Javascript" (or (mode . esspresso-mode)
                           (mode . js3-mode)
                           (mode . js2-mode)
                           (mode . js-mode)
                           (filename . "js")))
         ("Julia" (or (mode . julia-mode)
                      (filename . "jl")))
         ("Go" (mode . go-mode))
         ("Org" (or (mode . org-mode)
                     (filename . "org")))
         ("PHP" (or (mode . php-mode)
                    (filename . "php")))
         ("Python" (or (mode . python-mode)
                       (filename . "py")))
         ("Ruby" (or (mode . ruby-mode)
                     (filename . "rb")))
         ("Rust" (or (mode . rust-mode)
                     (filename . "toml")))
         ;;        ("Subversion" (name . "\*svn"))
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

;; (defvar autopair-modes '(r-mode ruby-mode js3-mode go-mode))
;; (defun turn-on-autopair-mode () (autopair-mode 1))
;; (dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))

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

(defface dim-paren-face
   ;; '((((class color) (background dark)) (:foreground "grey50"))
  ;;   (((class color) (background light)) (:foreground "grey55")))
  '((((class color) (background dark)) (:foreground "grey70"))
    (((class color) (background light)) (:foreground "grey70")))
   "Face used to dim parentheses."
   :group 'my-faces)

(defface dim-bracket-face
   '((((class color) (background dark)) (:foreground "grey70"))
     (((class color) (background light)) (:foreground "grey70")))
   "Face used to dim brackets"
   :group 'my-faces)


(dolist (x '(scheme emacs-lisp lisp clojure))
  (font-lock-add-keywords
   (intern (concat (symbol-name x) "-mode")) '(("(\\|)" . 'dim-paren-face)))
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) 'turn-on-paredit))


;;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;;(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-use-clojure-font-lock t)


(font-lock-add-keywords
 nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):" 1 font-lock-warning-face t)))

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
          (if (string-match dir "\\(?:/\\|\\\\)$")
              (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (progn
        (copy-file filename newname 1)
	(delete-file filename)
        (set-visited-file-name newname)
        (set-buffer-modified-p nil)
	t))))

(defun swap-windows ()
 "If you have 2 windows, it swaps them."
(interactive)
(if (= (count-windows) 2) (swap-windows2)
  (if (= (count-windows) 3) (progn (toggle-sr-speedbar) (swap-windows3) (other-window 1))
    (message "You need exactly 2 or 3 windows to do this.")
  )))

(defun swap-windows2 ()
 "If you have 2 windows, it swaps them."
(interactive)
(cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
 (t
  (let* ((w1 (first (window-list)))
	 (w2 (second (window-list)))
	 (b1 (window-buffer w1))
	 (b2 (window-buffer w2))
	 (s1 (window-start w1))
	 (s2 (window-start w2)))
    (set-window-buffer w1 b2)
    (set-window-buffer w2 b1)
    (set-window-start w1 s2)
    (set-window-start w2 s1)))))

(defun swap-windows3 ()
 "If you have 3 windows, it swaps them."
(interactive)
(cond ((not (= (count-windows) 3)) (message "You need exactly 3 windows to do this."))
 (t
  (let* ((w1 (second (window-list)))
	 (w2 (third (window-list)))
	 (b1 (window-buffer w1))
	 (b2 (window-buffer w2))
	 (s1 (window-start w1))
	 (s2 (window-start w2)))
    (set-window-buffer w1 b2)
    (set-window-buffer w2 b1)
    (set-window-start w1 s2)
    (set-window-start w2 s1)))))

(setq python-indent 4)

(add-to-list 'smart-tab-disabled-major-modes 'eshell-mode)
(add-to-list 'smart-tab-disabled-major-modes 'inferior-python-mode)

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)

(setq ispell-program-name "aspell")

(setq tramp-default-method "ssh")
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

(setq debug-on-error t)

;; (setq deft-text-mode 'markdown-mode)
;; (setq deft-use-filename-as-title t)
;; (global-set-key [f7] 'deft)
;; (global-set-key (kbd "<C-f7>") 'deft-new-file-named)

(setq cider-known-endpoints '(("coen@titan" "4343")))
(setq cider-known-endpoints '(("localhost" "4343")))
(global-set-key (kbd "C-x C-g") 'magit-status)

(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
     (propertize (format (format " %%%dd" w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)
;; (setq nlinum-format 'linum-format-func)

(eval-after-load 'clojure-mode '(require 'clojure-mode-extra-font-locking))

(defvar clojure-operators
  '(;; Math operators
    "=" "==" ">" ">=" "<" "<=" "+" "-" "/" "*"))

(font-lock-add-keywords 'clojure-mode
                        `((,(concat "(\\(?:\.*/\\)?"
                                    (regexp-opt clojure-operators t)
                                    "\\>")
                           1 font-lock-builtin-face)))

(require 'linum-off)
