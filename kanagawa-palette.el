;;; kanagawa-palette.el --- kanagawa palette -*- lexical-binding: t -*-

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

(defvar kanagawa-themes-color-palette-list
  '((sumi-ink-0 "#16161D")
    (sumi-ink-1 "#181820")
    (sumi-ink-2 "#1a1a22")
    (sumi-ink-3 "#1F1F28")
    (sumi-ink-4 "#2A2A37")
    (sumi-ink-5 "#363646")
    (sumi-ink-6 "#54546D") ; fg

    ;; Popup and Floats
    (wave-blue-1 "#223249")
    (wave-blue-2 "#2D4F67")

    ;; Diff and Git
    (winter-green "#2B3328")
    (winter-yellow "#49443C")
    (winter-red "#43242B")
    (winter-blue "#252535")
    (autumn-green "#76946A")
    (autumn-red "#C34043")
    (autumn-yellow "#DCA561")

    ;; Diag
    (samurai-red "#E82424")
    (ronin-yellow "#FF9E3B")
    (wave-aqua-1 "#6A9589")
    (dragon-blue "#658594")

    ;; Fg and Comments
    (old-white "#C8C093")
    (fuji-white "#DCD7BA")
    (fuji-gray "#727169")

    (oni-violet "#957FB8")
    (oni-violet-2 "#b8b4d0")
    (crystal-blue "#7E9CD8")
    (spring-violet-1 "#938AA9")
    (spring-violet-2 "#9CABCA")
    (spring-blue "#7FB4CA")
    (light-blue "#A3D4D5")
    (wave-aqua-2 "#7AA89F") ;; improve lightness: desaturated greenish Aqua

    (spring-green "#98BB6C")
    (boat-yellow-1 "#938056")
    (boat-yellow-2 "#C0A36E")
    (carp-yellow "#E6C384")

    (sakura-pink "#D27E99")
    (wave-red "#E46876")
    (peach-red "#FF5D62")
    (surimi-orange "#FFA066")
    (katana-gray "#717C7C")

    (dragon-black-0 "#0d0c0c")
    (dragon-black-1 "#12120f")
    (dragon-black-2 "#1D1C19")
    (dragon-black-3 "#181616")
    (dragon-black-4 "#282727")
    (dragon-black-5 "#393836")
    (dragon-black-6 "#625e5a")

    (dragon-white "#c5c9c5")
    (dragon-green "#87a987")
    (dragon-green-2 "#8a9a7b")
    (dragon-pink "#a292a3")
    (dragon-orange "#b6927b")
    (dragon-orange-2 "#b98d7b")
    (dragon-gray "#a6a69c")
    (dragon-gray1 "#9e9b93")
    (dragon-gray-3 "#7a8382")
    (dragon-blue-2 "#8ba4b0")
    (dragon-violet "#8992a7")
    (dragon-red "#c4746e")
    (dragon-aqua "#8ea4a2")
    (dragon-ash "#737c73")
    (dragon-teal "#949fb5")
    (dragon-yellow "#c4b28a")

    (lotus-ink-1 "#545464")
    (lotus-ink-2 "#43436c")
    (lotus-gray "#dcd7ba")
    (lotus-gray-2 "#716e61")
    (lotus-gray-3 "#8a8980")
    (lotus-white-0 "#d5cea3")
    (lotus-white-1 "#dcd5ac")
    (lotus-white-2 "#e5ddb0")
    (lotus-white-3 "#f2ecbc")
    (lotus-white-4 "#e7dba0")
    (lotus-white-5 "#e4d794")
    (lotus-violet-1 "#a09cac")
    (lotus-violet-2 "#766b90")
    (lotus-violet-3 "#c9cbd1")
    (lotus-violet-4 "#624c83")
    (lotus-blue-1 "#c7d7e0")
    (lotus-blue-2 "#b5cbd2")
    (lotus-blue-3 "#9fb5c9")
    (lotus-blue-4 "#4d699b")
    (lotus-blue-5 "#5d57a3")
    (lotus-green "#6f894e")
    (lotus-green-2 "#6e915f")
    (lotus-green-3 "#b7d0ae")
    (lotus-pink "#b35b79")
    (lotus-orange "#cc6d00")
    (lotus-orange2 "#e98a00")
    (lotus-yellow "#77713f")
    (lotus-yellow-2 "#836f4a")
    (lotus-yellow-3 "#de9800")
    (lotus-yellow-4 "#f9d791")
    (lotus-red "#c84053")
    (lotus-red-2 "#d7474b")
    (lotus-red-3 "#e82424")
    (lotus-red-4 "#d9a594")
    (lotus-aqua "#597b75")
    (lotus-aqua-2 "#5e857a")
    (lotus-teal-1 "#4e8ca2")
    (lotus-teal-2 "#6693bf")
    (lotus-teal-3 "#5a7785")
    (lotus-cyan "#d7e3d8"))
  "The kanagawa color palette list.")

(provide 'kanagawa-palette)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; kanagawa-palette.el ends here
