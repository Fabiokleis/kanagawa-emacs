;;; kanagawa-theme.el --- kanagawa theme -*- lexical-binding: t -*-

;; Copyright (C) 2023 Mikael Konradsson
;; Copyright (C) 2023-2024 Meritamen <meritamen@sdf.org>

;; Author: Meritamen <meritamen@sdf.org>

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

(defcustom kanagawa-theme-underline-parens t
  "If non-nil, underline matching parens when using `show-paren-mode' or similar."
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
    `((default (:foreground ,fg :background ,bg)))))

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
