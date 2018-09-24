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
    ("2cfc1cab46c0f5bae8017d3603ea1197be4f4fff8b9750d026d19f0b9e606fae" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(ensime-implicit-gutter-icons nil)
 '(flymake-proc-allowed-file-name-masks
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
 '(js-auto-indent-flag nil)
 '(js-indent-level 2)
 '(js2-bounce-indent-p t)
 '(neo-autorefresh nil)
 '(neo-force-change-root t)
 '(neo-hidden-regexp-list (quote ("\\.pyc$" "~$" "^#.*#$" "\\.elc$")))
 '(neo-theme (quote icons))
 '(neo-toggle-window-keep-p t)
 '(neo-window-fixed-size nil)
 '(neo-window-position (quote left))
 '(neo-window-width 45)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 6))))
 '(package-selected-packages
   (quote
    (pyvenv use-package anaconda-mode company company-anaconda ein github-modern-theme groovy-mode undo-tree)))
 '(scss-compile-at-save nil)
 '(smart-tab-using-hippie-expand t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(window-divider ((t (:foreground "gray60"))))
 '(window-divider-first-pixel ((t (:foreground "grey80")))))
