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

(defun kanagawa-themes--variant-colors-symbol (variant)
  "Create symbol for color palette of kanagawa-themes VARIANT."
  (intern (format "kanagawa-themes-%s-colors" (symbol-name variant))))

(defmacro kanagawa-themes--define-variant-colors (variant &rest body)
  "Define a color palette for a specific theme variant."
  `(defvar ,(kanagawa-themes--variant-colors-symbol variant)
     (let ,kanagawa-themes-color-palette-list ,@body)))

(defmacro kanagawa-themes--variant-with-colors (variant &rest body)
  "Execute BODY with the color palette of a specified theme VARIANT."
  `(let ,(append (symbol-value (kanagawa-themes--variant-colors-symbol variant))
                 kanagawa-themes-custom-colors)
     ,@body))

(provide 'kanagawa-lib)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; kanagawa-lib.el ends here
