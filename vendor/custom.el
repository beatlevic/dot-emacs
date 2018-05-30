(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "coral1" "green4" "yellow3" "DarkSlateGray3" "magenta3" "cyan3" "gray90"])
 '(c-basic-offset (quote set-from-style))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(ensime-implicit-gutter-icons nil)
 '(flymake-allowed-file-name-masks
   (quote
    (("\\.py\\'" flymake-pyflakes-init nil nil)
     ("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init nil nil)
     ("\\.xml\\'" flymake-xml-init nil nil)
     ("\\.cs\\'" flymake-simple-make-init nil nil)
     ("\\.p[ml]\\'" flymake-perl-init nil nil)
     ("\\.php[345]?\\'" flymake-php-init nil nil)
     ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup nil)
     ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup nil)
     ("\\.tex\\'" flymake-simple-tex-init nil nil)
     ("\\.idl\\'" flymake-simple-make-init nil nil))))
 '(helm-adaptive-mode t nil (helm-adaptive))
 '(helm-adaptive-sort-by-frequent-recent-usage t)
 '(js-auto-indent-flag nil)
 '(js-indent-level 2)
 '(js2-bounce-indent-p t)
 '(linum-delay t)
 '(neo-autorefresh nil)
 '(neo-force-change-root t)
 '(neo-theme (quote icons))
 '(neo-toggle-window-keep-p t)
 '(neo-window-fixed-size nil)
 '(neo-window-position (quote left))
 '(neo-window-width 45)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 6))))
 '(package-selected-packages
   (quote
    (helm groovy-mode all-the-icons all-the-icons-dired tabbar neotree highlight-symbol align-cljlet projectile ensime ein auto-complete alchemist buffer-move smex coffee-mode persp-mode sr-speedbar yaml-mode sass-mode protobuf-mode paredit markdown-mode linum-off less-css-mode julia-mode json-mode js2-mode highlight-numbers haml-mode flymake-cursor f dockerfile-mode dash color-theme clojure-mode-extra-font-locking cider autopair auto-dim-other-buffers async)))
 '(safe-local-variable-values
   (quote
    ((encoding . utf-8)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby")
     (whitespace-line-column . 80)
     (lexical-binding . t))))
 '(scss-compile-at-save nil)
 '(smart-tab-using-hippie-expand t)
 '(speedbar-hide-button-brackets-flag t)
 '(speedbar-obj-do-check nil)
 '(speedbar-show-unknown-files t)
 '(speedbar-smart-directory-expand-flag nil)
 '(speedbar-supported-extension-expressions
   (quote
    (".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".clj" ".rb" ".erb" ".php")))
 '(speedbar-use-images nil)
 '(speedbar-use-tool-tips-flag nil)
 '(speedbar-vc-do-check nil)
 '(speedbar-verbosity-level 0)
 '(sr-speedbar-auto-refresh nil)
 '(sr-speedbar-delete-windows nil)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(sr-speedbar-width-x 35)
 '(writeroom-global-effects nil)
 '(writeroom-width 120))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#272822" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Monaco"))))
 '(custom-comment-tag ((t (:foreground "forest green"))))
 '(flymake-errline ((((class color)) (:underline "black"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(font-lock-function-name-face ((t (:foreground "#EDBF6B"))))
 '(linum ((t (:foreground "gray30"))))
 '(neo-file-link-face ((t (:foreground "gray80"))))
 '(org-level-1 ((t (:inherit nil :foreground "LightSkyBlue"))))
 '(org-level-2 ((t (:foreground "#94bff3"))))
 '(org-level-3 ((t (:foreground "#8DA6CE"))))
 '(persp-face-lighter-buffer-not-in-persp ((t (:foreground "#FFF" :weight bold))))
 '(show-paren-match ((t (:background "SteelBlue4"))))
 '(speedbar-button-face ((t (:foreground "#7A7A7A"))))
 '(speedbar-directory-face ((t (:foreground "#A1A1A1"))))
 '(speedbar-file-face ((t (:foreground "#7A7A7A"))))
 '(speedbar-selected-face ((((class color) (background dark)) (:foreground "#F8F8F8")))))
