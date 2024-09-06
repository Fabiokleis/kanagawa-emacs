;;; kanagawa-colors.el --- kanagawa colors -*- lexical-binding: t -*-

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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'kanagawa-theme)
(require 'kanagawa-palette)

(kanagawa-theme--define-variant-colors
 wave
 `((fg ,fuji-white)
   (fg-dim ,old-white)
   (fg-reverse ,wave-blue-1)

   (bg-dim ,sumi-ink-1)
   (bg-gutter ,sumi-ink-4)

   (bg-m3 ,sumi-ink-0)
   (bg-m2 ,sumi-ink-1)
   (bg-m1 ,sumi-ink-2)
   (bg ,sumi-ink-3)
   (bg-p1 ,sumi-ink-4)
   (bg-p2 ,sumi-ink-5)

   (special ,spring-violet-1)
   (nontext ,sumi-ink-6)
   (whitespace ,sumi-ink-6)

   (bg-visual ,wave-blue-1)
   (bg-search ,wave-blue-2)

   (pmenu-fg ,fuji-white)
   (pmenu-fg-sel nil)
   (pmenu-bg ,wave-blue-1)
   (pmenu-bg-sel ,wave-blue-2)
   (pmenu-bg-sbar ,wave-blue-1)
   (pmenu-bg-thumb ,wave-blue-2)

   (float-fg ,old-white)
   (float-bg ,sumi-ink-0)
   (float-fg-border ,sumi-ink-6)
   (float-bg-border ,sumi-ink-0)

   (syn-string ,spring-green)
   (syn-variable nil)
   (syn-number ,sakura-pink)
   (syn-constant ,surimi-orange)
   (syn-identifier ,carp-yellow)
   (syn-parameter ,oni-violet-2)
   (syn-fun ,crystal-blue)
   (syn-statement ,oni-violet)
   (syn-keyword ,oni-violet)
   (syn-operator ,boat-yellow-2)
   (syn-perproc ,wave-red)
   (syn-type ,wave-aqua-2)
   (syn-regex ,boat-yellow-2)
   (syn-deprecated ,katana-gray)
   (syn-comment ,fuji-gray)
   (syn-punct ,spring-violet-2)
   (syn-special-1 ,spring-blue)
   (syn-special-2 ,wave-red)
   (syn-special-3 ,peach-red)

   (vcs-added ,autumn-green)
   (vcs-removed ,autumn-red)
   (vcs-changed ,autumn-yellow)

   (diff-add ,winter-green)
   (diff-delete ,winter-red)
   (diff-change ,winter-blue)
   (diff-text ,winter-yellow)

   (diag-ok ,spring-green)
   (diag-error ,samurai-red)
   (diag-warning ,ronin-yellow)
   (diag-info ,dragon-blue)
   (diag-hint ,wave-aqua-1)

   (black ,sumi-ink-0)
   (red ,autumn-red)
   (green ,autumn-green)
   (yellow ,boat-yellow-2)
   (blue ,crystal-blue)
   (magenta ,oni-violet)
   (cyan ,wave-aqua-1)
   (white ,old-white)
   (bright-black ,fuji-gray)
   (bright-red ,samurai-red)
   (bright-green ,spring-green)
   (bright-yellow ,carp-yellow)
   (bright-blue ,spring-blue)
   (bright-magenta ,spring-violet-1)
   (brignt-cyan ,wave-aqua-2)
   (bright-white ,fuji-white)
   (extend-color-1 ,surimi-orange)
   (extend-color-2 ,peach-red)))

(kanagawa-theme--define-variant-colors
 dragon
 `((fg ,dragon-white)
   (fg-dim ,old-white)
   (fg-reverse ,wave-blue-1)

   (bg-dim ,dragon-black-1)
   (bg-gutter ,dragon-black-4)

   (bg-m3 ,dragon-black-0)
   (bg-m2 ,dragon-black-1)
   (bg-m1 ,dragon-black-2)
   (bg ,dragon-black-3)
   (bg-p1 ,dragon-black-4)
   (bg-p2 ,dragon-black-5)

   (special ,dragon-gray-3)
   (nontext ,dragon-black-6)
   (whitespace ,dragon-black-6)

   (bg-visual ,wave-blue-1)
   (bg-search ,wave-blue-2)

   (pmenu-fg ,fuji-white)
   (pmenu-fg-sel nil)
   (pmenu-bg ,wave-blue-1)
   (pmenu-bg-sel ,wave-blue-2)
   (pmenu-bg-sbar ,wave-blue-1)
   (pmenu-bg-thumb ,wave-blue-2)

   (float-fg ,old-white)
   (float-bg ,dragon-black-0)
   (float-fg-border ,sumi-ink-6)
   (float-bg-border ,dragon-black-0)

   (syn-string ,dragon-green-2)
   (syn-variable nil)
   (syn-number ,dragon-pink)
   (syn-constant ,dragon-orange)
   (syn-identifier ,carp-yellow)
   (syn-parameter ,dragon-gray)
   (syn-fun ,dragon-blue-2)
   (syn-statement ,dragon-violet)
   (syn-keyword ,dragon-violet)
   (syn-operator ,dragon-red)
   (syn-perproc ,dragon-red)
   (syn-type ,dragon-aqua)
   (syn-regex ,dragon-red)
   (syn-deprecated ,katana-gray)
   (syn-comment ,dragon-ash)
   (syn-punct ,dragon-green-2)
   (syn-special-1 ,dragon-teal)
   (syn-special-2 ,dragon-red)
   (syn-special-3 ,dragon-red)

   (vcs-added ,autumn-green)
   (vcs-removed ,autumn-red)
   (vcs-changed ,autumn-yellow)

   (diff-add ,winter-green)
   (diff-delete ,winter-red)
   (diff-change ,winter-blue)
   (diff-text ,winter-yellow)

   (diag-ok ,spring-green)
   (diag-error ,samurai-red)
   (diag-warning ,ronin-yellow)
   (diag-info ,dragon-blue)
   (diag-hint ,wave-aqua-1)

   (black ,dragon-black-0)
   (red ,dragon-red)
   (green ,dragon-green-2)
   (yellow ,dragon-yellow)
   (blue ,dragon-blue-2)
   (magenta ,dragon-pink)
   (cyan ,dragon-aqua)
   (white ,old-white)
   (bright-black ,dragon-gray)
   (bright-red ,wave-red)
   (bright-green ,dragon-green)
   (bright-yellow ,carp-yellow)
   (bright-blue ,spring-blue)
   (bright-magenta ,spring-violet-1)
   (brignt-cyan ,wave-aqua-2)
   (bright-white ,dragon-white)
   (extend-color-1 ,dragon-orange)
   (extend-color-2 ,dragon-orange-2)))

(kanagawa-theme--define-variant-colors
 lotus
 `((fg ,lotus-ink-1)
   (fg-dim ,lotus-ink-2)
   (fg-reverse ,lotus-gray)

   (bg-dim ,lotus-white-1)
   (bg-gutter ,lotus-white-4)

   (bg-m3 ,lotus-white-0)
   (bg-m2 ,lotus-white-1)
   (bg-m1 ,lotus-white-2)
   (bg ,lotus-white-3)
   (bg-p1 ,lotus-white-4)
   (bg-p2 ,lotus-white-5)

   (special ,lotus-violet-2)
   (nontext ,lotus-violet-1)
   (whitespace ,lotus-violet-1)

   (bg-visual ,lotus-violet-3)
   (bg-search ,lotus-blue-2)

   (pmenu-fg ,lotus-ink-2)
   (pmenu-fg-sel nil)
   (pmenu-bg ,lotus-blue-1)
   (pmenu-bg-sel ,lotus-blue-3)
   (pmenu-bg-sbar ,lotus-blue-1)
   (pmenu-bg-thumb ,lotus-blue-2)

   (float-fg ,lotus-ink-2)
   (float-bg ,lotus-white-0)
   (float-fg-border ,lotus-gray-2)
   (float-bg-border ,lotus-white-0)

   (syn-string ,lotus-green)
   (syn-variable nil)
   (syn-number ,lotus-pink)
   (syn-constant ,lotus-orange)
   (syn-identifier ,lotus-yellow)
   (syn-parameter ,lotus-blue-5)
   (syn-fun ,lotus-blue-4)
   (syn-statement ,lotus-violet-4)
   (syn-keyword ,lotus-violet-4)
   (syn-operator ,lotus-yellow-2)
   (syn-perproc ,lotus-red)
   (syn-type ,lotus-aqua)
   (syn-regex ,lotus-yellow-2)
   (syn-deprecated ,lotus-gray-3)
   (syn-comment ,lotus-gray-3)
   (syn-punct ,lotus-teal-1)
   (syn-special-1 ,lotus-teal-2)
   (syn-special-2 ,lotus-red)
   (syn-special-3 ,peach-red)

   (vcs-added ,lotus-green-2)
   (vcs-removed ,lotus-red-2)
   (vcs-changed ,lotus-yellow-3)

   (diff-add ,lotus-green-3)
   (diff-delete ,lotus-red-4)
   (diff-change ,lotus-cyan)
   (diff-text ,lotus-yellow-4)

   (diag-ok ,lotus-green)
   (diag-error ,lotus-red-3)
   (diag-warning ,lotus-orange2)
   (diag-info ,lotus-teal-3)
   (diag-hint ,lotus-aqua-2)

   (black ,sumi-ink-3)
   (red ,lotus-red)
   (green ,lotus-green)
   (yellow ,lotus-yellow)
   (blue ,lotus-blue-4)
   (magenta ,lotus-pink)
   (cyan ,lotus-aqua)
   (white ,lotus-ink-1)
   (bright-black ,lotus-gray-3)
   (bright-red ,lotus-red-2)
   (bright-green ,lotus-green-2)
   (bright-yellow ,lotus-yellow-2)
   (bright-blue ,lotus-teal-2)
   (bright-magenta ,lotus-violet-4)
   (brignt-cyan ,lotus-aqua-2)
   (bright-white ,lotus-ink-2)
   (extend-color-1 ,lotus-orange2)
   (extend-color-2 ,lotus-red-3)))

(provide 'kanagawa-colors)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; kanagawa-colors.el ends here
