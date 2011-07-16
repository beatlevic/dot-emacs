(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;;(add-to-list 'load-path (concat dotfiles-dir "/auto-complete-1.3.1"))
(add-to-list 'load-path (concat dotfiles-dir "/ac-slime"))

;; Set initial emacs window size
(setq default-frame-alist (append (list
  '(width  . 180)  ; Width set to 81 characters
  '(height . 51)) ; Height set to 60 lines
  default-frame-alist))

(setq set-fill-column 120) ; default is 70

;; Basic emacs settings
(setq inhibit-startup-message   t)   ; Don't want any startup message
(setq initial-scratch-message nil)   ; No scratch text
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

;; Blackboard theme
(color-theme-blackboard)
(pc-selection-mode)

;; White space
;;(whitespace-mode) ;http://www.emacswiki.org/emacs/whitespace.el
;; nuke trailing whitespaces when writing to a file
;;(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Mac key bindings
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Backspace should not be delete
(normal-erase-is-backspace-mode 1)

;; Elein: Leinigen emacs
(require 'elein) ;http://github.com/remvee/elein/raw/master/elein.el

;; Php mode
(require 'php-mode) ;http://php-mode.svn.sourceforge.net/svnroot/php-mode/tags/php-mode-1.5.0/php-mode.el

(require 'autopair)

(add-hook 'php-mode-hook
          '(lambda () (autopair-mode)))

(add-hook 'esspresso-mode-hook
          '(lambda () (autopair-mode)))


;;(add-to-list 'load-path "/path/to/ack-and-a-half")
;; (autoload 'ack-and-a-half-same "ack-and-a-half" nil t)
;; (autoload 'ack-and-a-half "ack-and-a-half" nil t)
;; (autoload 'ack-and-a-half-find-file-samee "ack-and-a-half" nil t)
;; (autoload 'ack-and-a-half-find-file "ack-and-a-half" nil t)
;; ;; Create shorter aliases
;; (defalias 'ack 'ack-and-a-half)
;; (defalias 'ack-same 'ack-and-a-half-same)
;; (defalias 'ack-find-file 'ack-and-a-half-find-file)
;; (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

(global-set-key (kbd "C-S-s") 'ack)

(add-to-list 'load-path (concat dotfiles-dir "/packages/emacs-tiny-tools/lisp/tiny"))
(add-to-list 'load-path (concat dotfiles-dir "/packages/emacs-tiny-tools/lisp/other"))

(require 'tinypair)
;;     (tinypair-pair-type-select 'us)         ;; US `style'
(tinypair-pair-type-select 'european)   ;; European 'style'


(setq skeleton-pair t)
(setq skeleton-pair-on-word t) ; apply skeleton trick even in front of
                               ; a word
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe);; uses c-electric-brace
(global-set-key "(" 'skeleton-pair-insert-maybe);; uses c-electric-paren
;;(global-set-key "\"" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)


;; run php lint when press f6 key
;; php lint
(defun phplint-thisfile ()
  (interactive)
  (compile (format "php -l %s" (buffer-file-name))))

(add-hook 'php-mode-hook
          '(lambda ()
             (local-set-key [f7] 'phplint-thisfile)))
;; end of php lint

;; Visual undo tree
(require 'undo-tree) ;http://www.dr-qubit.org/download.php?file=undo-tree/undo-tree.el

;; line numbers
(require 'linum)
;;(global-linum-mode 1)
(setq column-number-mode t)

;; Ecb
;; (load-file "~/.emacs.d/cedet/common/cedet.el") ;http://cedet.sourceforge.net/
;; (add-to-list 'load-path "~/.emacs.d/ecb") ;http://ecb.sourceforge.net/
;; (require 'ecb)

;; (setq ecb-tip-of-the-day nil)
;; (setq ecb-tree-buffer-style 'ascii-guides)

;; (setq ecb-cache-directory-contents '(("^/\\([^:/]*@\\)?\\([^@:/]*\\):.*" .
;;                                       0) (".*" . 500))
;;       ecb-cache-directory-contents-not nil) ;'("^/Users/Beatle/.*"))

;; (setq my-projects '("~/Documents/nodejs"
;;                     "~/Documents/ruby/apps"
;;                     "~/Documents/clojure/projects"
;;                     "~/Documents/org"
;;                     "~/.emacs.d"))

;; (setq ecb-source-path my-projects)
;; ;;(setq tags-table-list my-projects)
;;(global-set-key (kbd "C-<tab>") 'complete-tag)

;; (defun toggle-ecb ()
;;   (interactive) (delete-other-windows) (ecb-minor-mode))
;;
;;(global-set-key [f6] 'toggle-ecb)

;; Smart Tab
;; https://github.com/haxney/smart-tab
;; (require 'smart-tab) ;; make sure smart-tab.el is reachable in your load-path first
;; (global-smart-tab-mode 1) ;; switch on smart-tab everywhere
;; (setq smart-tab-completion-functions-alist
;;       '((emacs-lisp-mode . lisp-complete-symbol)
;;         (text-mode . dabbrev-completion) ;; this is the "default"
;;         emacs expansion function
;;         (clojure-mode . slime-complete-symbol))) ;; see update below

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

;; Textmate mode for search
(require 'textmate)
(require 'peepopen) ;; peepopen plugin
(setq ns-pop-up-frames nil)
(textmate-mode)

;; Shell: a real terminal and not eshell
(defun open-localhost ()
  (interactive)
  (ansi-term "tcsh" "localhost"))

;; IBuffer
;;(setq ibuffer-default-sorting-mode 'major-mode)
(setq ibuffer-saved-filter-groups
      '(("home"
         ("Clojure" (or (mode . clojure-mode)
                        (filename . "clojure")))
         ("Javascript" (or (mode . esspresso-mode)
                           (filename . "js")))
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

;; Revert buffers which comes in handy after a git pull
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files."))

(global-set-key [f5] 'revert-all-buffers)
;; M-x revert-buffer => reads buffer from file again

;; Woman: M-x woman
(autoload 'woman "woman" "Decode and browse a UN*X man page." t)
(autoload 'woman-find-file "woman"
  "Find, decode and browse a specific UN*X man-page file." t)

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

;; My minor mode to overwrite other major modes
(defvar beatle-minor-mode-map (make-keymap) "Beatle-minor-mode keymap.")

;; cycle through buffers with ctrl-(shift-)tab
(define-key beatle-minor-mode-map (kbd "<C-tab>") 'bury-buffer)
(define-key beatle-minor-mode-map (kbd "<C-S-tab>") 'unbury-buffer)
(define-key beatle-minor-mode-map (kbd "<C-return>") 'other-window)
(define-key beatle-minor-mode-map (kbd "<C-S-return>") 'sr-speedbar-select-window)
(define-key beatle-minor-mode-map (kbd "C-c C-j") 'clojure-jump)
;;(define-key beatle-minor-mode-map (kbd "C-c C-f") 'lusty-file-explorer)

(define-minor-mode beatle-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " Beatle" 'beatle-minor-mode-map)

(beatle-minor-mode 1)

;; ide-skel => mouse drawer
;; (require 'tabbar)
;; (require 'ide-skel)
;; (partial-completion-mode)
;; (icomplete-mode)

(require 'sr-speedbar)

(defun toggle-sr-speedbar ()
  (interactive) (sr-speedbar-toggle) (sr-speedbar-refresh))

(global-set-key [f6] 'toggle-sr-speedbar)

;; (add-to-list 'load-path "~/.emacs.d/nav/")
;; (require 'nav)

(require 'lusty-explorer)
(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-z") 'undo)
;;(set-frame-parameter (selected-frame) 'alpha '(100 100))
;;(add-to-list 'default-frame-alist '(alpha 100 100))

;;swank autostart + cake -r
;;If you are using cake/master, it should't be necessary to stop swank at all. Each swank thread is served from the most recent project classloader, so to get a fresh classloader, all you should need to do is 'cake -r' then disconnect and reconnect in emacs.

(defun slimy ()
  (interactive)
  (slime-connect "127.0.0.1" "4005"))

;; (defun cake-project-root ()
;;   "Look for project.clj file to find project root."
;;   (let ((cwd default-directory)
;;         (found nil)
;;         (max 10))
;;     (while (and (not found) (> max 0))
;;       (if (file-exists-p (concat cwd "project.clj"))
;;         (setq found cwd)
;;         (setq cwd (concat cwd "../") max (- max 1))))
;;     (and found (expand-file-name found))))

;; (defmacro cake-in-project-root (body)
;;   "Wrap BODY to make `default-directory' the project root."
;;   (let ((dir (gensym)))
;;     `(let ((,dir (cake-project-root)))
;;        (if ,dir
;;          (let ((default-directory ,dir)) ,body)
;;          (error "No cake project root found")))))
         
;; (defun cake-swank ()
;;   "Connect or reconnect to swank while reloading cake class path files with cake -r."
;;   (interactive)
;;   (if (slime-connected-p)
;;       (slime-disconnect))
;;   (let ((buffer (get-buffer-create "*cake-swank*")))
;;     (flet ((display-buffer (buffer-or-name &optional not-this-window frame) nil))
;;       (bury-buffer buffer)
;;       (cake-in-project-root (shell-command "cake -r" buffer)))
;;     (slime-connect "127.0.0.1" "4005")))

;; (global-set-key [f6] 'cake-swank)
