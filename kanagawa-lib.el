;;; kanagawa-lib.el --- kanagawa library -*- lexical-binding: t -*-

;; Copyright (C) 2023 Mikael Konradsson
;; Copyright (C) 2023-2024 Meritamen <meritamen@sdf.org>

;; Author: Meritamen <meritamen@sdf.org>
;; Maintainer: Fabio Kleis <fabiohkrc@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(defmacro kanagawa-theme--define-variant-colors (variant &rest body)
  `(defvar ,(intern (format "kanagawa-theme-%s-colors" (symbol-name variant)))
     (let ,kanagawa-color-palette-alist ,@body)))

(defmacro kanagawa-theme--variant-with-colors (variant &rest body)
  (let ((colors (intern (format "kanagawa-theme-%s-colors" (symbol-name variant)))))
    `(let ,(symbol-value colors) ,@body)))

(provide 'kanagawa-lib)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; kanagawa-lib.el ends here
