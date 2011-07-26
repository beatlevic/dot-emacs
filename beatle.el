;; My own additions next to all the starter-kit stuff

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:/usr/local/git/bin/:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "/usr/local/git/bin" exec-path))

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
(global-set-key (kbd "<C-tab>") 'bury-buffer)
(global-set-key (kbd "<C-S-tab>") 'unbury-buffer)
(global-set-key (kbd "<C-return>") 'other-window)
(global-set-key (kbd "<C-S-return>") 'sr-speedbar-select-window)
(global-set-key (kbd "C-c C-j") 'clojure-jump)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "S-<f6>") 'ns-toggle-fullscreen)

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

(defun toggle-sr-speedbar ()
  (interactive) (sr-speedbar-toggle) (sr-speedbar-refresh))
(global-set-key [f5] 'toggle-sr-speedbar)

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
