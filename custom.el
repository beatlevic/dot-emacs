(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(align-rules-list (quote ((lisp-second-arg (regexp . "\\(^\\s-+[^(
]\\|(\\(\\S-+\\)\\s-+\\)\\S-+\\(\\s-+\\)") (group . 3) (modes . align-lisp-modes) (run-if lambda nil current-prefix-arg)) (lisp-alist-dot (regexp . "\\(\\s-*\\)\\.\\(\\s-*\\)") (group 1 2) (modes . align-lisp-modes)) (open-comment (regexp lambda (end reverse) (funcall (if reverse (quote re-search-backward) (quote re-search-forward)) (concat "[^
\\\\]" (regexp-quote comment-start) "\\(.+\\)$") end t)) (modes . align-open-comment-modes)) (c-macro-definition (regexp . "^\\s-*#\\s-*define\\s-+\\S-+\\(\\s-+\\)") (modes . align-c++-modes)) (c-variable-declaration (regexp . "[*&0-9A-Za-z_]>?[&*]*\\(\\s-+[*&]*\\)[A-Za-z_][0-9A-Za-z:_]*\\s-*\\(\\()\\|=[^=
].*\\|(.*)\\|\\(\\[.*\\]\\)*\\)?\\s-*[;,]\\|)\\s-*$\\)") (group . 1) (modes . align-c++-modes) (justify . t) (valid lambda nil (not (or (save-excursion (goto-char (match-beginning 1)) (backward-word 1) (looking-at "\\(goto\\|return\\|new\\|delete\\|throw\\)")) (if (and (boundp (quote font-lock-mode)) font-lock-mode) (eq (get-text-property (point) (quote face)) (quote font-lock-comment-face)) (eq (caar (c-guess-basic-syntax)) (quote c))))))) (c-assignment (regexp . "[^-=!^&*+<>/|
]\\(\\s-*[-=!^&*+<>/|]*\\)=\\(\\s-*\\)\\([^=
]\\|$\\)") (group 1 2) (modes . align-c++-modes) (justify . t) (tab-stop)) (perl-assignment (regexp . "[^=!^&*-+<>/|
]\\(\\s-*\\)=[~>]?\\(\\s-*\\)\\([^>=
]\\|$\\)") (group 1 2) (modes . align-perl-modes) (tab-stop)) (python-assignment (regexp . "[^=!<>
]\\(\\s-*\\)=\\(\\s-*\\)\\([^>=
]\\|$\\)") (group 1 2) (modes quote (python-mode)) (tab-stop)) (make-assignment (regexp . "^\\s-*\\w+\\(\\s-*\\):?=\\(\\s-*\\)\\([^
 \\\\]\\|$\\)") (group 1 2) (modes quote (makefile-mode)) (tab-stop)) (c-comma-delimiter (regexp . ",\\(\\s-*\\)[^/
]") (repeat . t) (modes . align-c++-modes) (run-if lambda nil current-prefix-arg)) (basic-comma-delimiter (regexp . ",\\(\\s-*\\)[^#
]") (repeat . t) (modes append align-perl-modes (quote (python-mode))) (run-if lambda nil current-prefix-arg)) (c++-comment (regexp . "\\(\\s-*\\)\\(//.*\\|/\\*.*\\*/\\s-*\\)$") (modes . align-c++-modes) (column . comment-column) (valid lambda nil (save-excursion (goto-char (match-beginning 1)) (not (bolp))))) (c-chain-logic (regexp . "\\(\\s-*\\)\\(&&\\|||\\|\\<and\\>\\|\\<or\\>\\)") (modes . align-c++-modes) (valid lambda nil (save-excursion (goto-char (match-end 2)) (looking-at "\\s-*\\(/[*/]\\|$\\)")))) (perl-chain-logic (regexp . "\\(\\s-*\\)\\(&&\\|||\\|\\<and\\>\\|\\<or\\>\\)") (modes . align-perl-modes) (valid lambda nil (save-excursion (goto-char (match-end 2)) (looking-at "\\s-*\\(#\\|$\\)")))) (python-chain-logic (regexp . "\\(\\s-*\\)\\(\\<and\\>\\|\\<or\\>\\)") (modes quote (python-mode)) (valid lambda nil (save-excursion (goto-char (match-end 2)) (looking-at "\\s-*\\(#\\|$\\|\\\\\\)")))) (c-macro-line-continuation (regexp . "\\(\\s-*\\)\\\\$") (modes . align-c++-modes) (column . c-backslash-column)) (basic-line-continuation (regexp . "\\(\\s-*\\)\\\\$") (modes quote (python-mode makefile-mode))) (tex-record-separator (regexp lambda (end reverse) (align-match-tex-pattern "&" end reverse)) (group 1 2) (modes . align-tex-modes) (repeat . t)) (tex-tabbing-separator (regexp lambda (end reverse) (align-match-tex-pattern "\\\\[=>]" end reverse)) (group 1 2) (modes . align-tex-modes) (repeat . t) (run-if lambda nil (eq major-mode (quote latex-mode)))) (tex-record-break (regexp . "\\(\\s-*\\)\\\\\\\\") (modes . align-tex-modes)) (text-column (regexp . "\\(^\\|\\S-\\)\\([ 	]+\\)\\(\\S-\\|$\\)") (group . 2) (modes . align-text-modes) (repeat . t) (run-if lambda nil (and current-prefix-arg (not (eq (quote -) current-prefix-arg))))) (text-dollar-figure (regexp . "\\$?\\(\\s-+[0-9]+\\)\\.") (modes . align-text-modes) (justify . t) (run-if lambda nil (eq (quote -) current-prefix-arg))) (css-declaration (regexp . "^\\s-*\\w+:\\(\\s-*\\).*;") (group 1) (modes quote (css-mode html-mode))))))
 '(c-basic-offset (quote set-from-style))
 '(js-auto-indent-flag nil)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js3-consistent-level-indent-inner-bracket t)
 '(js3-enter-indents-newline t)
 '(js3-highlight-external-variables nil)
 '(js3-indent-on-enter-key t)
 '(safe-local-variable-values (quote ((encoding . utf-8) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby") (whitespace-line-column . 80) (lexical-binding . t))))
 '(scss-compile-at-save nil)
 '(smart-tab-using-hippie-expand t)
 '(speedbar-hide-button-brackets-flag nil)
 '(speedbar-obj-do-check nil)
 '(speedbar-show-unknown-files t)
 '(speedbar-supported-extension-expressions (quote (".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".clj" ".rb" ".erb" ".php")))
 '(speedbar-use-images nil)
 '(speedbar-use-tool-tips-flag nil)
 '(speedbar-vc-do-check nil)
 '(speedbar-verbosity-level 1)
 '(sr-speedbar-auto-refresh nil)
 '(sr-speedbar-delete-windows nil)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(sr-speedbar-width-x 30))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#21221d" :foreground "#E6E1DC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Monaco"))))
 '(ecb-default-highlight-face ((((class color) (background dark)) (:background "blue"))))
 '(ecb-directory-face ((((class color) (background dark)) (:inherit ecb-default-highlight-face :background "blue"))))
 '(linum ((t (:inherit default :foreground "#6c6c6c"))))
 '(org-level-1 ((t (:inherit nil :foreground "LightSkyBlue"))))
 '(org-level-2 ((t (:foreground "#94bff3"))))
 '(org-level-3 ((t (:foreground "#8DA6CE"))))
 '(speedbar-button-face ((t (:foreground "#5C5C5C"))))
 '(speedbar-directory-face ((t (:foreground "#5C5C5C"))))
 '(speedbar-file-face ((t (:foreground "#7A7A7A"))))
 '(speedbar-selected-face ((((class color) (background dark)) (:foreground "#F8F8F8")))))
