(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name))) ;; .emacs.d/
(setq backup-directory-alist `(("." . ,(expand-file-name (concat dotfiles-dir "backups")))))
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(setq package-user-dir (concat dotfiles-dir "elpa"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'ensure-packages)

(setq ensure-packages
      '(alchemist
        all-the-icons ;; M-x all-the-icons-install-fonts
        anaconda-mode
        async
	auto-complete
        autopair
        cider
        color-theme
        company
        company-anaconda
        dockerfile-mode
        ensime
        haml-mode
        highlight-numbers
        highlight-symbol
        js2-mode
        json-mode
        json-reformat
        json-snatcher
        less-css-mode
        linum-off
        markdown-mode
        neotree
        paredit
        projectile
        protobuf-mode
        sass-mode
        use-package
        yaml-mode))

(ensure-packages-install-missing)

(setq inhibit-startup-message t
      initial-scratch-message nil
      make-backup-files nil
      auto-save-list-file-name nil
      auto-save-default nil
      save-place t
      visible-bell nil
      ring-bell-function 'ignore
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

(setq split-height-threshold 1200)
(setq split-width-threshold 2000)

(setq-default cursor-type 'bar)

;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (ansi-color-for-comint-mode-on)

;; (add-to-list 'safe-local-variable-values '(lexical-binding . t))
;; (add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Fullscreen theme settings
(require 'color-theme)
(color-theme-initialize)
(load-file (concat dotfiles-dir "/vendor/blackboard.el"))
(color-theme-blackboard)
(highlight-numbers-mode 1)

(require 'highlight-symbol)
(highlight-symbol-mode 1)
(highlight-symbol-nav-mode 1)
(setq highlight-symbol-idle-delay 1.0
      highlight-symbol-on-navigation-p t)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)

(setq ns-use-native-fullscreen nil)

(setq custom-file "~/.emacs.d/vendor/custom.el")
(load custom-file)

(server-start) ;; used by terminal command line invocation

(require 'saveplace)
(require 'uniquify)
(require 'recentf)
(require 'smart-tab)
(require 'lusty-explorer)
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
;;(auto-complete-mode 1)

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

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

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
(electric-pair-mode 1)
;;(dumb-jump-mode)

(defun delete-trailing-whitespace-special()
  "Delete trailing whitespace when not in markdown mode"
  (when (not (eq major-mode 'markdown-mode))
    (delete-trailing-whitespace)))

(add-hook 'before-save-hook 'delete-trailing-whitespace-special)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

(add-to-list 'desktop-modes-not-to-save 'dired-mode)

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

(add-hook 'python-mode-hook '(lambda () (setq tab-width 2)))

(add-hook 'scala-mode-hook (lambda() (highlight-symbol-mode 1) (ensime-mode)))

(add-hook 'scala-mode-hook (lambda() (highlight-symbol-nav-mode nil)))

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

(defun lusty-open ()
  (interactive)
  (neotree-hide)
  (lusty-file-explorer)
  (neotree-show))

(global-set-key (kbd "C-x C-f") 'lusty-open)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-s") 'ack)
(global-set-key (kbd "C-S-t") 'ack-find-file)
(global-set-key (kbd "<C-tab>") 'previous-buffer)
(global-set-key (kbd "<C-S-tab>") 'next-buffer)
(global-set-key (kbd "<C-return>") 'other-window)
(global-set-key (kbd "C-M-k") 'delete-window)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-H-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "M-`") 'other-frame)

(global-set-key (kbd "<S-tab>") 'ensime-company)

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
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window -1))) ;; back one

(global-set-key (kbd "C-S-f") 'follow-mode)
(global-set-key (kbd "C-x a") 'my-align-single-equals)

(global-set-key (kbd "S-<f5>") 'revert-all-buffers) ;; M-x revert-buffer => reads buffer from file again
(global-set-key (kbd "C-x r") 'revert-all-buffers) ;; M-x revert-buffer => reads buffer from file again
;;(global-set-key (kbd "<f6>") 'writeroom-mode) ;; M-x revert-buffer => reads buffer from file again

(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer);
(global-set-key (kbd "C-x C-m") 'move-buffer-file);

(global-set-key (kbd "M-s") 'swap-windows);
(global-set-key (kbd "C-<right>") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "C-<left>") 'paredit-backward-barf-sexp)

(global-set-key (kbd "M-[") 'indent-rigidly-left-to-tab-stop)
(global-set-key (kbd "M-]") 'indent-rigidly-right-to-tab-stop)

(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") #'go-run)))
(add-hook 'cider-mode-hook (lambda () (local-set-key (kbd "M-[") #'cider-format-defun)))
(add-hook 'paredit-mode-hook (lambda () (local-set-key (kbd "C-<up>") #'paredit-splice-sexp)))

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(global-set-key (kbd "C-x <up>")     'buf-move-up)
(global-set-key (kbd "C-x <down>")   'buf-move-down)
(global-set-key (kbd "C-x <left>")   'buf-move-left)
(global-set-key (kbd "C-x <right>")  'buf-move-right)

;; IBuffer
(setq ibuffer-saved-filter-groups
      '(("home"
         ("Scala" (or (mode . scala-mode)
                      (mode . ensime-mode)
                      (mode . sbt-mode)
                      (filename . "sbt")
                      (filename . "scala")))
         ("Elixir" (or (mode . elixir-mode)
                       (filename . "ex")
                       (filename . "exs")
                       (filename . "eex")))
         ("Clojure" (or (mode . clojure-mode)
                        (filename . "clojure")
                        (filename . "cljs")
                        (filename . "boot")))
         ("Emacs" (or (filename . ".emacs.d")
                      (filename . "emacs-config")))
         ("Javascript" (or (mode . esspresso-mode)
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
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files."))

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
(if (= (count-windows) 2) (progn (swap-windows2) (other-window 1))
  (if (= (count-windows) 3) (progn (neotree-toggle) (swap-windows2) (other-window 1) (neotree-toggle))
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

;;(add-hook 'find-file-hook 'flymake-find-file-hook)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
(delete '("\\.java?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
(delete '("\\.xml?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
(delete '("\\.properties?\\'" flymake-xml-init) flymake-allowed-file-name-masks)

(setq ispell-program-name "aspell")

(setq tramp-default-method "ssh")
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

(setq debug-on-error t)

(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
     (propertize (format (format " %%%dd" w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)
;; (setq nlinum-format 'linum-format-func)

;(eval-after-load 'clojure-mode '(require 'clojure-mode-extra-font-locking))

;; (defvar clojure-operators
;;   '(;; Math operators
;;     "=" "==" ">" ">=" "<" "<=" "+" "-" "/" "*"))

;; (font-lock-add-keywords 'clojure-mode
;;                         `((,(concat "(\\(?:\.*/\\)?"
;;                                     (regexp-opt clojure-operators t)
;;                                     "\\>")
;;                            1 font-lock-builtin-face)))

(require 'linum-off)
(require 'alchemist)

(setq ensime-startup-notification nil)
(setq ensime-startup-snapshot-notification nil)
(setq ensime-typecheck-when-idle nil)

;;(defun scala-mode-newline-comments ()
;;  "Custom newline appropriate for `scala-mode'."
;;  ;; shouldn't this be in a post-insert hook?
;;  (interactive)
;;  (newline-and-indent)
;;  (scala-indent:insert-asterisk-on-multiline-comment))

;; (bind-key "RET" 'scala-mode-newline-comments scala-mode-map)

;; (setq comment-start "/* "
;;	  comment-end " */"
;;	  comment-style 'multi-line
;;	  comment-empty-lines t
;; )

;; (setq ac-use-menu-map t)
;; ;; Default settings
;; (define-key ac-menu-map "\C-n" 'ac-next)
;; (define-key ac-menu-map "\C-p" 'ac-previous)

(require 'neotree)

(setq neo-smart-open t)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

(global-set-key [f5] 'neotree-project-dir)
(global-set-key (kbd "C-x t") 'neotree-project-dir)

(defun refresh-neo ()
   (interactive)
   (neotree-project-dir)
   (neotree-project-dir))

(global-set-key (kbd "<C-H-return>") 'refresh-neo)
(global-set-key (kbd "C-x T") 'refresh-neo)

(defun prev-window ()
   (interactive)
   (other-window -1))

(setq mac-option-modifier 'hyper)
(define-key global-map (kbd "<C-M-return>") 'prev-window)
(setq projectile-switch-project-action 'neotree-projectile-action)

(setq ensime-sem-high-enabled-p nil)
(setq scala-indent:align-parameters t)
(setq scala-indent:align-forms t)
(setq ensime-eldoc-hints 'all)
(setq ensime-graphical-tooltips t)
(setq ensime-auto-generate-config t)

(defun scala-mode-newline-comments ()
  "Custom newline appropriate for `scala-mode'."
  ;; shouldn't this be in a post-insert hook?
  (interactive)
  (newline-and-indent)
  (scala-indent:insert-asterisk-on-multiline-comment))

;;(bind-key "RET" 'scala-mode-newline-comments scala-mode-map)

(add-hook 'after-init-hook 'global-company-mode)

;; (eval-after-load "company"
;;   '(add-to-list 'company-backends 'company-anaconda))

;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(use-package anaconda-mode
  :ensure t
  :commands anaconda-mode
  :diminish anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :ensure t
  :init
  (add-to-list 'company-backends 'company-anaconda)
  (add-hook 'python-mode-hook 'company-mode))

(use-package pyvenv
        :ensure t
        :init
        (setenv "WORKON_HOME" "/Users/beatlevic/opt/miniconda3/envs")
        (pyvenv-mode 1)
        (pyvenv-tracking-mode 1))

  ;; (defun anaconda-description (candidate)
  ;;   (concat
  ;;    " "
  ;;    (car (last (split-string
  ;;                    (aref (get-text-property 0 'struct candidate) 2)
  ;;                    "\n"
  ;;                    ))
  ;;     )))

  ;; (setq company-anaconda-annotation-function 'anaconda-description)
