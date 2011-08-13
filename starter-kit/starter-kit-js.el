;;; starter-kit-js.el --- Some helpful Javascript helpers
;;
;; Part of the Emacs Starter Kit

;; NB: js-mode is part of Emacs since version 23.2 (with an alias
;; javascript-mode). It is derived and updated from Espresso mode.

(autoload 'js-mode "js" "Start js-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;(add-hook 'js-mode-hook 'moz-minor-mode)
;(add-hook 'js-mode-hook 'esk-paredit-nonlisp)
;(add-hook 'js-mode-hook 'run-coding-hook)
(setq js-indent-level 2)

(defun ret-indent ()
  (interactive) (newline) (js-indent-line))

(eval-after-load 'js
  '(progn (define-key js-mode-map "{" 'paredit-open-curly)
          (define-key js-mode-map "}" 'paredit-close-curly-and-newline)
          (define-key js-mode-map (kbd "<RET>") 'ret-indent)
          ;; fixes problem with pretty function font-lock
          (define-key js-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js-mode `(("\\(function *\\)("
                       (0 (progn (compose-region (match-beginning 1)
                                                 (match-end 1) "ƒ")
                                 nil)))))))

(provide 'starter-kit-js)
;;; starter-kit-js.el ends here
