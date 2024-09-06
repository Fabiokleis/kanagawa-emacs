;;; kanagawa-theme.el --- kanagawa theme -*- lexical-binding: t -*-

;; Copyright (C) 2023 Mikael Konradsson
;; Copyright (C) 2023-2024 Meritamen <meritamen@sdf.org>

;; Author: Meritamen <meritamen@sdf.org>
;; Maintainer: Fabio Kleis <fabiohkrc@gmail.com>
;; URL: https://github.com/Fabiokleis/emacs-kanagawa-theme
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.3"))
;; Created: 16 September 2023
;; Keywords: themes faces

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(defgroup kanagawa-theme nil
  "Kanagawa-theme options."
  :group 'faces)

(defcustom kanagawa-theme-comment-italic t
  "Enable italics for comments and also disable background."
  :type 'boolean
  :group 'kanagawa-theme)

(defcustom kanagawa-theme-keyword-italic t
  "Enable italics for keywords."
  :type 'boolean
  :group 'kanagawa-theme)

(defcustom kanagawa-theme-org-height t
  "Use varying text heights for org headings."
  :type 'boolean
  :group 'kanagawa-theme)

(defcustom kanagawa-theme-org-bold t
  "Inherit text bold for org headings."
  :type 'boolean
  :group 'kanagawa-theme)

(defcustom kanagawa-theme-org-priority-bold t
  "Inherit text bold for priority items in agenda view."
  :type 'boolean
  :group 'kanagawa-theme)

(defcustom kanagawa-theme-org-highlight nil
  "Highlight org headings."
  :type 'boolean
  :group 'kanagawa-theme)

(defmacro kanagawa-theme--define-variant-colors (variant &rest body)
  `(defvar ,(intern (format "kanagawa-theme-%s-colors" (symbol-name variant)))
     (let ,kanagawa-color-palette-alist ,@body)))

(defmacro kanagawa-theme--variant-with-colors (variant &rest body)
  (let ((colors (intern (format "kanagawa-theme-%s-colors" (symbol-name variant)))))
    `(let ,(symbol-value colors) ,@body)))

(defmacro kanagawa-theme--faces-spec ()
  `(mapcar
    #'(lambda (f) (list (car f) `((t ,@(cdr f)))))
    `(

;;;;;; Built-in packages

;;;;;;; Basic coloring
      (button (:underline t))
      (link :foreground ,bright-blue :underline t :weight bold)
      (link-visited :foreground ,blue :underline t :weight normal)
      (default (:foreground ,fg :background ,bg))
      (cursor (:foreground ,bg :background ,fg))
      (widget-field (:foreground ,fg :background ,bg-p1))
      (escape-glyph (:foreground ,special :weight bold))
      (fringe (:foreground ,fg :background ,bg))
      (header-line (:foreground ,bg :background ,fg-dim :extend t))
      (highlight (:foreground ,fg :background ,bg-dim :weight bold))
      (success (:foreground ,diag-ok :weight bold))
      (warning (:foreground ,diag-warning :weight bold))
      (tooltip (:foreground ,pmenu-fg :background ,pmenu-bg))
      (menu (:foreground ,fg :background ,bg))
;;;;;;; font lock
      (font-lock-builtin-face (:foreground ,fg))
      (font-lock-comment-face (:foreground ,syn-comment
                                           :slant ,(if kanagawa-theme-comment-italic 'italic 'normal)))
      (font-lock-comment-delimiter-face (:foreground ,syn-comment))
      (font-lock-constant-face (:foreground ,syn-constant))
      (font-lock-doc-face (:foreground ,syn-string))
      (font-lock-function-name-face (:foreground ,syn-fun))
      (font-lock-keyword-face (:foreground ,syn-keyword :weight bold
                                           :slant ,(if kanagawa-theme-keyword-italic 'italic 'normal)))
      (font-lock-negation-char-face (:inherit font-lock-keyword-face))
      (font-lock-preprocessor-face (:foreground ,syn-perproc))
      (font-lock-regexp-grouping-construct (:foreground ,syn-regex :weight bold))
      (font-lock-regexp-grouping-backslash (:foreground ,syn-regex :weight bold))
      (font-lock-string-face (:foreground ,syn-string))
      (font-lock-type-face (:foreground ,syn-type))
      (font-lock-variable-name-face (:foreground ,syn-identifier))
      (font-lock-warning-face (:foreground ,diag-warning))
      (c-annotation-face (:inherit font-lock-constant-face))
;;;;;;; line numbers
      (line-number (:foreground ,nontext :background ,bg-gutter))
      (line-number-current-line (:inherit line-number))
;;;;;;; ansi-colors
      (ansi-color-black (:foreground ,black))
      (ansi-color-red (:foreground ,red))
      (ansi-color-green (:foreground ,green))
      (ansi-color-yellow (:foreground ,yellow))
      (ansi-color-blue (:foreground ,blue))
      (ansi-color-magenta (:foreground ,magenta))
      (ansi-color-cyan (:foreground ,cyan))
      (ansi-color-white (:foreground ,white))
      (ansi-color-bright-black (:foreground ,bright-black))
      (ansi-color-bright-red (:foreground ,bright-red))
      (ansi-color-bright-green (:foreground ,bright-green))
      (ansi-color-bright-yellow (:foreground ,bright-yellow))
      (ansi-color-bright-blue (:foreground ,bright-blue))
      (ansi-color-bright-magenta (:foreground ,bright-magenta))
      (ansi-color-bright-cyan (:foreground ,brignt-cyan))
      (ansi-color-bright-white (:foreground ,bright-white))
;;;;;;; isearch
      (isearch (:foreground ,fg-reverse :background ,diag-warning))
      (isearch-fail (:foreground ,fg :background ,diag-error))
      (lazy-highlight (:foreground ,fg :background ,bg-search))
      (minibuffer-prompt (:foreground ,fg :weight bold))
;;;;;;; mode-line
      (mode-line (:foreground ,fg-dim :background ,bg-m3))
      (mode-line-inactive (:foreground ,nontext :background ,bg-m3))
;;;;;;; hl-line-mode
      (hl-line (:background ,bg-p2)))))

(defmacro kanagawa-theme--define-theme (variant)
  (let ((name (intern (format "kanagawa-%s" (symbol-name variant))))
        (doc (format "The Kanagawa %s theme" variant)))
    `(progn
       (deftheme ,name ,doc)
       (kanagawa-theme--variant-with-colors
        ,variant
        (apply 'custom-theme-set-faces ',name (kanagawa-theme--faces-spec))
        (provide-theme ',name)))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'kanagawa-theme)

;; Local Variables
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; kanagawa-theme.el ends here
