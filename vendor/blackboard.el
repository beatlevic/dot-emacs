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
      (background-color . "#21221d")
      ;;(background-color . "#231e1e")
      ;;(background-color . "#232323")
      (background-mode . dark)
      ;;(border-color . "#21221d")
      (border-color . "#111111")
      (cursor-color . "#A7A7A7")
      ;;(foreground-color . "#F8F8F8")
      (foreground-color . "#E6E1DC")
      ;(foreground-color . "white")
      (mouse-color . "sienna1"))
     ;;(default ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     ;;(default ((t (:background "#1d1919" :foreground "#F8F8F8"))))
     (default ((t (:background "#21221d" :foreground "#F8F8F8"))))
     ;(default ((t (:background "#21221d" :foreground "white"))))
     ;;(blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     ;;(border-glyph ((t (nil))))
     ;;(buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (fringe ((t (:background "#21221d"))))
     (font-lock-builtin-face ((t (:foreground "#94bff3"))))
     ;;(font-lock-comment-face ((t (:italic t :foreground "#AEAEAE"))))
     (font-lock-comment-face ((t (:italic t :foreground "#7A7A7A"))))
     (font-lock-doc-face ((t (:italic t :foreground "#AEAEAE"))))
     ;;(font-lock-constant-face ((t (:foreground "#D8FA3C"))))
     (font-lock-constant-face ((t (:foreground "#6D9CBE"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     ;;(font-lock-function-name-face ((t (:foreground "#FF6400"))))
     (font-lock-function-name-face ((t (:foreground "#FFC66D"))))
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
     (region ((t (:background "#444444"))))
     ;;(mode-line ((t (:background "grey75" :foreground "black"))))
     (mode-line-inactive ((t (:background "#393939" :foreground "#E6E1DC"))))
     (mode-line ((t (:background "#636363" :foreground "#E6E1DC")))) ;696969
     ;;(highlight ((t (:background "#222222"))))
     ;;(highlight ((t (:background "#272822"))))
     (highlight ((t (:background "#303030"))))
     (highline-face ((t (:background "SeaGreen"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (zmacs-region ((t (:background "snow" :foreground "black")))))))
