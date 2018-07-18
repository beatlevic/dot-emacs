;; Blackboard Colour Theme for Emacs.
;;
;; Defines a colour scheme resembling that of the original TextMate Blackboard colour theme.
;; To use add the following to your .emacs file (requires the color-theme package):
;;
;; (require 'color-theme)
;; (color-theme-initialize)
;; (load-file "~/.emacs.d/themes/color-theme-blackboard.el")
;;
;; And then (color-theme-blackboard) to activate it.
;;
;; MIT License Copyright (c) 2008 JD Huntington <jdhuntington at gmail dot com>
;; Credits due to the excellent TextMate Blackboard theme
;;
;; All patches welcome

(require 'color-theme)

;;;###autoload
(defun color-theme-blackboard ()
  "Color theme by JD Huntington, based off the TextMate Blackboard theme, created 2008-11-27"
  (interactive)
  (color-theme-install
   '(color-theme-blackboard
     (;;(background-color . "#0C1021")
      (background-color . "#272822") ;; ;; "#21221d" ;; blue "#242F3B"
      ;;(background-color . "#231e1e")
      ;;(background-color . "#232323")
      (background-mode . dark)
      ;;(border-color . "#21221d")
      (border-color . "#111111")
      (cursor-color . "#A7A7A7")
      ;;(foreground-color . "#F8F8F8")
      (foreground-color . "gray80") ;; "#E6E1DC" ;; #C7C2BD ;; "#D6D2CE"
      ;(foreground-color . "white")
      (mouse-color . "SteelBlue3"))
     ;;(default ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     ;;(default ((t (:background "#1d1919" :foreground "#F8F8F8"))))
     (default ((t (:background "#272822" :foreground "gray85")))) ;; "#272822" ;; "#E6E1DC" ;; blue "#242F3B"
     ;(default ((t (:background "#21221d" :foreground "white"))))
     ;;(blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     ;;(border-glyph ((t (nil))))
     ;;(buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (fringe ((t (:background "#272822")))) ;; "#272822" ;; blue "#242F3B"
     (font-lock-builtin-face ((t (:foreground "#94bff3"))))
     ;;(font-lock-comment-face ((t (:italic t :foreground "#AEAEAE"))))
     (font-lock-comment-face ((t (:italic t :foreground "#7A7A7A"))))
     (font-lock-doc-face ((t (:italic t :foreground "#AEAEAE"))))
     ;;(font-lock-constant-face ((t (:foreground "#D8FA3C"))))
     (font-lock-constant-face ((t (:foreground "#6D9CBE"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     ;;(font-lock-function-name-face ((t (:foreground "#FF6400"))))
     ;;;;(font-lock-function-name-face ((t (:foreground "#EDBF6B")))) ;; "#FFC66D"
     ;;(font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
     (font-lock-keyword-face ((t (:foreground "#CC7833"))))
     (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     (font-lock-reference-face ((t (:foreground "SlateBlue"))))

     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "#232323"))))

     ;;(font-lock-string-face ((t (:foreground "#61CE3C"))))
     (font-lock-string-face ((t (:foreground "#A5C261"))))
     ;;(font-lock-string-face ((t (:foreground "#8F9D6A"))))
     (font-lock-type-face ((t (:foreground "#8DA6CE"))))
     (font-lock-variable-name-face ((t (:foreground "#8DA6CE"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
     ;;(region ((t (:background "#253B76"))))
     ;;(region ((t (:background "#7A7A7A")))) ;; "#444444";; #66D9EF ;; :foreground "#272822"
     (region ((t (:background "grey30")))) ;; "#444444";; #66D9EF ;; :foreground "#272822"
     ;;(mode-line ((t (:background "grey75" :foreground "black"))))
     (mode-line-inactive ((t (:background "#393939" :foreground "gray80" )))) ;; "#E6E1DC"
     (mode-line ((t (:background "#636363" :foreground "gray80")))) ;696969 ;; "#E6E1DC"
     ;;(mode-line-buffer-id ((t (:foreground "#94C928" :bold t))))  ;;#FFC66D
     ;;(highlight ((t (:background "#222222"))))
     ;;(highlight ((t (:background "#272822"))))
     (highlight ((t (:background "#303030"))))
     (highline-face ((t (:background "SeaGreen"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (zmacs-region ((t (:background "snow" :foreground "black"))))
     (show-paren-match ((t (:foreground "#E6E1DC" :underline t))))))) ;; :background "#6D9CBE"
