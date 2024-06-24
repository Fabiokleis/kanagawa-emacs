;;; kanagawa-theme.el --- An elegant theme inspired by The Great Wave off Kanagawa by Katsushika Hokusa -*- lexical-binding: t -*-

;; Copyright (C) 2023 Mikael Konradsson
;; Copyright (C) 2023-2024 Shira Filianore <meritamen@sdf.org>

;; Author: Shira Filianore <meritamen@sdf.org>
;; URL: https://github.com/meritamen/emacs-kanagawa-theme
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.3"))
;; Created: 16 September 2023
;; Keywords: themes faces

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Kanagawa is a theme inspired by the colors of the famous painting
;; The Great Wave off Kanagawa by Katsushika Hokusa.
;; Original theme created by rebelot see: https://github.com/rebelot/kanagawa.nvim

;;; Code:

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

;;; Customizations:

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
  "Inherit text bold for org headings"
  :type 'boolean
  :group 'kanagawa-theme)

(defcustom kanagawa-theme-org-priority-bold t
  "Inherit text bold for priority items in agenda view"
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

(defcustom kanagawa-theme-custom-colors nil
  "Specify a list of custom colors."
  :type 'alist
  :group 'kanagawa-theme)

(defun true-color-p ()
  (or (display-graphic-p)
      (= (tty-display-color-cells) 16777216)))

(deftheme kanagawa "An elegant theme inspired by The Great Wave off Kanagawa by Katsushika Hokusa")

(eval-when-compile
  (defvar kanagawa-dark-palette
    `((fuji-white       ,(if (true-color-p) "#DCD7BA" "#ffffff"))
      (old-white        ,(if (true-color-p) "#C8C093" "#ffffff"))
      (sumi-ink-0       ,(if (true-color-p) "#16161D" "#000000"))
      (sumi-ink-1b      ,(if (true-color-p) "#1f1f28" "#000000"))
      (sumi-ink-1       ,(if (true-color-p) "#1F1F28" "#080808"))
      (sumi-ink-2       ,(if (true-color-p) "#2A2A37" "#121212"))
      (sumi-ink-3       ,(if (true-color-p) "#363646" "#303030"))
      (sumi-ink-4       ,(if (true-color-p) "#54546D" "#303030"))
      (wave-blue-1      ,(if (true-color-p) "#223249" "#4e4e4e"))
      (wave-blue-2      ,(if (true-color-p) "#2D4F67" "#585858"))
      (wave-aqua-1      ,(if (true-color-p) "#6A9589" "#6a9589"))
      (wave-aqua-2      ,(if (true-color-p) "#7AA89F" "#717C7C"))
      (winter-green     ,(if (true-color-p) "#2B3328" "#585858"))
      (winter-yellow    ,(if (true-color-p) "#49443C" "#585858"))
      (winter-red       ,(if (true-color-p) "#43242B" "#585858"))
      (winter-blue      ,(if (true-color-p) "#252535" "#585858"))
      (autumn-green     ,(if (true-color-p) "#76946A" "#585858"))
      (autumn-red       ,(if (true-color-p) "#C34043" "#585858"))
      (autumn-yellow    ,(if (true-color-p) "#DCA561" "#585858"))
      (samurai-red      ,(if (true-color-p) "#E82424" "#585858"))
      (ronin-yellow     ,(if (true-color-p) "#FF9E3B" "#585858"))
      (dragon-blue      ,(if (true-color-p) "#658594" "#658594"))
      (fuji-gray        ,(if (true-color-p) "#727169" "#717C7C"))
      (spring-violet-1  ,(if (true-color-p) "#938AA9" "#717C7C"))
      (oni-violet       ,(if (true-color-p) "#957FB8" "#717C7C"))
      (crystal-blue     ,(if (true-color-p) "#7E9CD8" "#717C7C"))
      (spring-violet-2  ,(if (true-color-p) "#9CABCA" "#717C7C"))
      (spring-blue      ,(if (true-color-p) "#7FB4CA" "#717C7C"))
      (light-blue       ,(if (true-color-p) "#A3D4D5" "#717C7C"))
      (spring-green     ,(if (true-color-p) "#98BB6C" "#717C7C"))
      (boat-yellow-1    ,(if (true-color-p) "#938056" "#717C7C"))
      (boat-yellow-2    ,(if (true-color-p) "#C0A36E" "#717C7C"))
      (carp-yellow      ,(if (true-color-p) "#E6C384" "#717C7C"))
      (sakura-pink      ,(if (true-color-p) "#D27E99" "#717C7C"))
      (wave-red         ,(if (true-color-p) "#E46876" "#717C7C"))
      (peach-red        ,(if (true-color-p) "#FF5D62" "#717C7C"))
      (surimi-orange    ,(if (true-color-p) "#FFA066" "#717C7C"))
      (katana-gray      ,(if (true-color-p) "#717C7C" "#717C7C"))
      (comet            ,(if (true-color-p) "#54536D" "#4e4e4e")))))

(defmacro define-kanagawa-dark-theme (theme &rest faces)
  `(let ((class '((class color) (min-colors 89)))
         ,@kanagawa-dark-palette)
     (cl-loop for (cvar . val) in kanagawa-theme-custom-colors
              do (set cvar val))
     (custom-theme-set-faces ,theme ,@faces)))

(define-kanagawa-dark-theme
 'kanagawa
 ;; Customize faces
 `(default                                       ((,class (:background ,sumi-ink-1b :foreground ,fuji-white))))
 `(border                                        ((,class (:background ,sumi-ink-1b :foreground ,sumi-ink-0))))
 `(button                                        ((,class (:foreground ,wave-aqua-2))))
 `(child-frame                                   ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-0))))
 `(child-frame-border                            ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-0))))
 `(cursor                                        ((,class (:background ,light-blue :foreground ,sumi-ink-0 :weight bold))))
 `(error                                         ((,class (:foreground ,samurai-red))))
 `(fringe                                        ((,class (:foreground ,sumi-ink-3))))
 `(glyph-face                                    ((,class (:background ,sumi-ink-4))))
 `(glyphless-char                                ((,class (:foreground ,sumi-ink-4))))
 `(header-line                                   ((,class (:background ,sumi-ink-0))))
 `(highlight                                     ((,class (:background ,comet :foreground ,spring-violet-1))))
 `(hl-line                                       ((,class (:background ,sumi-ink-2))))
 `(homoglyph                                     ((,class (:foreground ,light-blue))))
 `(internal-border                               ((,class (:background ,sumi-ink-1b))))
 `(line-number                                   ((,class (:foreground ,sumi-ink-4))))
 `(line-number-current-line                      ((,class (:foreground ,spring-violet-2 :background ,sumi-ink-2 :weight bold))))
 `(lv-separator                                  ((,class (:foreground ,wave-blue-2 :background ,sumi-ink-2))))
 `(match                                         ((,class (:background ,carp-yellow :foreground ,sumi-ink-0))))
 `(menu                                          ((,class (:background ,sumi-ink-0 :foreground ,fuji-white))))
 `(mode-line                                     ((,class (:background ,sumi-ink-0))))
 `(mode-line-inactive                            ((,class (:background unspecified :foreground ,sumi-ink-4))))
 `(mode-line-active                              ((,class (:background ,sumi-ink-0 :foreground ,old-white))))
 `(mode-line-highlight                           ((,class (:foreground ,boat-yellow-2))))
 `(mode-line-buffer-id                           ((,class (:foreground ,wave-aqua-2 :weight bold))))
 `(numbers                                       ((,class (:background ,sakura-pink))))
 `(region                                        ((,class (:background ,wave-blue-2))))
 `(separator-line                                ((,class (:background ,sumi-ink-0))))
 `(shadow                                        ((,class (:background ,sumi-ink-0))))
 `(success                                       ((,class (:foreground ,wave-aqua-2))))
 `(vertical-border                               ((,class (:foreground ,sumi-ink-4))))
 `(warning                                       ((,class (:foreground ,ronin-yellow))))
 `(window-border                                 ((,class (:background ,sumi-ink-1b))))
 `(window-divider                                ((,class (:foreground ,sumi-ink-2))))
 `(hi-yellow                                     ((,class (:background ,carp-yellow :foreground ,sumi-ink-1b))))

 ;; Font lock
 `(font-lock-type-face                           ((,class (:foreground ,wave-aqua-2))))
 `(font-lock-regexp-grouping-backslash           ((,class (:foreground ,boat-yellow-2))))
 `(font-lock-keyword-face                        ((,class (:foreground ,oni-violet :weight semi-bold :slant ,(if kanagawa-theme-keyword-italic 'italic 'normal)))))
 `(font-lock-warning-face                        ((,class (:foreground ,ronin-yellow))))
 `(font-lock-string-face                         ((,class (:foreground ,spring-green :slant italic))))
 `(font-lock-builtin-face                        ((,class (:foreground ,spring-blue))))
 `(font-lock-reference-face                      ((,class (:foreground ,peach-red))))
 `(font-lock-constant-face                       ((,class (:foreground ,carp-yellow))))
 `(font-lock-function-name-face                  ((,class (:foreground ,crystal-blue))))
 `(font-lock-variable-name-face                  ((,class (:foreground ,wave-red))))
 `(font-lock-negation-char-face                  ((,class (:foreground ,peach-red))))
 `(font-lock-comment-face                        ((,class (:foreground ,fuji-gray :slant ,(if kanagawa-theme-keyword-italic 'italic 'normal)))))
 `(font-lock-comment-delimiter-face              ((,class (:foreground ,fuji-gray :slant ,(if kanagawa-theme-keyword-italic 'italic 'normal)))))
 `(font-lock-doc-face                            ((,class (:foreground ,comet))))
 `(font-lock-doc-markup-face                     ((,class (:foreground ,comet))))
 `(font-lock-preprocessor-face                   ((,class (:foreground ,boat-yellow-2))))
 `(elisp-shorthand-font-lock-face                ((,class (:foreground ,fuji-white))))
 `(info-xref                                     ((,class (:foreground ,carp-yellow))))
 `(minibuffer-prompt-end                         ((,class (:foreground ,autumn-red :background ,winter-red))))
 `(minibuffer-prompt                             ((,class (:foreground ,carp-yellow :background ,winter-yellow))))
 `(epa-mark                                      ((,class (:foreground ,wave-red))))
 `(dired-mark                                    ((,class (:foreground ,wave-red))))
 `(trailing-whitespace                           ((,class (:background ,comet))))
 `(mode-line                                     ((,class (:background ,sumi-ink-0 :foreground ,fuji-white :weight bold))))

 ;; Battery colors
 `(doom-modeline-battery-critical                ((,class (:foreground ,peach-red))))
 `(doom-modeline-battery-warning                 ((,class (:foreground ,spring-green))))
 `(doom-modeline-battery-charging                ((,class (:foreground ,fuji-gray))))
 `(doom-modeline-battery-error                   ((,class (:foreground ,peach-red))))
 `(doom-modeline-battery-normal                  ((,class (:foreground ,spring-violet-1))))
 `(doom-modeline-battery-full                    ((,class (:foreground ,wave-aqua-2))))

 ;; Doom visual state
 `(doom-modeline-evil-motion-state               ((,class (:foreground ,light-blue))))
 `(doom-modeline-evil-emacs-state                ((,class (:foreground ,crystal-blue))))
 `(doom-modeline-evil-insert-state               ((,class (:foreground ,peach-red))))
 `(doom-modeline-evil-normal-state               ((,class (:foreground ,light-blue))))
 `(doom-modeline-evil-visual-state               ((,class (:foreground ,spring-green))))
 `(doom-modeline-evil-replace-state              ((,class (:foreground ,ronin-yellow))))
 `(doom-modeline-evil-operator-state             ((,class (:foreground ,crystal-blue))))

 `(doom-modeline-project-dir                     ((,class (:weight bold :foreground ,wave-aqua-2))))
 `(doom-modeline-buffer-path                     ((,class (:inherit bold :foreground ,wave-aqua-2))))
 `(doom-modeline-buffer-file                     ((,class (:inherit bold :foreground ,oni-violet))))
 `(doom-modeline-buffer-modified                 ((,class (:inherit bold :foreground ,carp-yellow))))
 `(doom-modeline-error                           ((,class (:background ,peach-red))))
 `(doom-modeline-buffer-major-mode               ((,class (:foreground ,wave-aqua-2 :weight bold))))
 `(doom-modeline-info                            ((,class (:weight bold :foreground ,light-blue))))
 `(doom-modeline-project-dir                     ((,class (:weight bold :foreground ,surimi-orange))))
 `(doom-modeline-bar                             ((,class (:weight bold :background ,spring-violet-1))))
 `(doom-modeline-panel                           ((,class (:inherit bold :background ,boat-yellow-2 :foreground ,sumi-ink-2))))
 `(doom-themes-visual-bell                       ((,class (:background ,autumn-red))))

 ;; elfeed
 `(elfeed-search-feed-face                       ((,class (:foreground ,spring-violet-1))))
 `(elfeed-search-tag-face                        ((,class (:foreground ,wave-aqua-2))))

 ;; message colors
 `(message-header-name                           ((,class (:foreground ,sumi-ink-4))))
 `(message-header-other                          ((,class (:foreground ,surimi-orange))))
 `(message-header-subject                        ((,class (:foreground ,carp-yellow))))
 `(message-header-to                             ((,class (:foreground ,old-white))))
 `(message-header-cc                             ((,class (:foreground ,wave-aqua-2))))
 `(message-header-xheader                        ((,class (:foreground ,old-white))))
 `(custom-link                                   ((,class (:foreground ,crystal-blue))))
 `(link                                          ((,class (:foreground ,crystal-blue))))

 ;; org-mode
 `(org-done                                      ((,class (:foreground ,dragon-blue))))
 `(org-code                                      ((,class (:background ,sumi-ink-0))))
 `(org-meta-line                                 ((,class (:background ,winter-green :foreground ,spring-green))))
 `(org-block                                     ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4))))
 `(org-block-begin-line                          ((,class (:background ,winter-blue :foreground ,spring-blue))))
 `(org-block-end-line                            ((,class (:background ,winter-red :foreground ,peach-red))))
 `(org-headline-done                             ((,class (:foreground ,dragon-blue :strike-through t))))
 `(org-todo                                      ((,class (:foreground ,surimi-orange :weight bold))))
 `(org-headline-todo                             ((,class (:foreground ,sumi-ink-2))))
 `(org-upcoming-deadline                         ((,class (:foreground ,peach-red))))
 `(org-footnote                                  ((,class (:foreground ,wave-aqua-2))))
 `(org-indent                                    ((,class (:background ,sumi-ink-1b :foreground ,sumi-ink-1b))))
 `(org-hide                                      ((,class (:background ,sumi-ink-1b :foreground ,sumi-ink-1b))))
 `(org-date                                      ((,class (:foreground ,wave-blue-2))))
 `(org-ellipsis                                  ((,class (:foreground ,wave-blue-2 :weight bold))))
 `(org-level-1                                   ((,class (:inherit bold :foreground ,peach-red :height ,(if kanagawa-theme-org-height 1.3 1.0) :weight ,(if kanagawa-theme-org-bold 'unspecified 'normal)))))
 `(org-level-2                                   ((,class (:inherit bold :foreground ,spring-violet-2 :height ,(if kanagawa-theme-org-height 1.2 1.0) :weight ,(if kanagawa-theme-org-bold 'unspecified 'normal)))))
 `(org-level-3                                   ((,class (:foreground ,boat-yellow-2 :height ,(if kanagawa-theme-org-height 1.1 1.0)))))
 `(org-level-4                                   ((,class (:foreground ,fuji-white))))
 `(org-level-5                                   ((,class (:foreground ,fuji-white))))
 `(org-level-6                                   ((,class (:foreground ,carp-yellow))))
 `(org-level-7                                   ((,class (:foreground ,surimi-orange))))
 `(org-level-8                                   ((,class (:foreground ,spring-green))))
 `(org-priority                                  ((,class (:foreground ,peach-red :inherit bold :weight ,(if kanagawa-theme-org-priority-bold 'unspecified 'normal)))))

 ;; which-key
 `(which-key-key-face                            ((,class (:inherit font-lock-variable-name-face))))
 `(which-func                                    ((,class (:inherit font-lock-function-name-face :weight bold))))
 `(which-key-group-description-face              ((,class (:foreground ,wave-red))))
 `(which-key-command-description-face            ((,class (:foreground ,crystal-blue))))
 `(which-key-local-map-description-face          ((,class (:foreground ,carp-yellow))))
 `(which-key-posframe                            ((,class (:background ,wave-blue-1))))
 `(which-key-posframe-border                     ((,class (:background ,wave-blue-1))))

 ;; swiper
 `(swiper-line-face                              ((,class (:foreground ,carp-yellow))))
 `(swiper-background-match-face-1                ((,class (:background ,surimi-orange :foreground ,sumi-ink-0))))
 `(swiper-background-match-face-2                ((,class (:background ,crystal-blue :foreground ,sumi-ink-0))))
 `(swiper-background-match-face-3                ((,class (:background ,boat-yellow-2 :foreground ,sumi-ink-0))))
 `(swiper-background-match-face-4                ((,class (:background ,peach-red :foreground ,sumi-ink-0))))
 `(swiper-match-face-1                           ((,class (:inherit swiper-background-match-face-1))))
 `(swiper-match-face-2                           ((,class (:inherit swiper-background-match-face-2))))
 `(swiper-match-face-3                           ((,class (:inherit swiper-background-match-face-3))))
 `(swiper-match-face-4                           ((,class (:inherit swiper-background-match-face-4))))

 `(counsel-outline-default                       ((,class (:foreground ,carp-yellow))))
 `(info-header-xref                              ((,class (:foreground ,carp-yellow))))
 `(xref-file-header                              ((,class (:foreground ,carp-yellow))))
 `(xref-match                                    ((,class (:foreground ,carp-yellow))))

 ;; rainbow delimiters
 `(rainbow-delimiters-mismatched-face            ((,class (:foreground ,peach-red))))
 `(rainbow-delimiters-unmatched-face             ((,class (:foreground ,wave-aqua-2))))
 `(rainbow-delimiters-base-error-face            ((,class (:foreground ,peach-red))))
 `(rainbow-delimiters-base-face                  ((,class (:foreground ,sumi-ink-4))))

 `(rainbow-delimiters-depth-1-face               ((,class (:foreground ,spring-violet-2))))
 `(rainbow-delimiters-depth-2-face               ((,class (:foreground ,dragon-blue))))
 `(rainbow-delimiters-depth-3-face               ((,class (:foreground ,spring-violet-1))))
 `(rainbow-delimiters-depth-4-face               ((,class (:foreground ,spring-green))))
 `(rainbow-delimiters-depth-5-face               ((,class (:foreground ,wave-aqua-2))))
 `(rainbow-delimiters-depth-6-face               ((,class (:foreground ,carp-yellow))))
 `(rainbow-delimiters-depth-7-face               ((,class (:foreground ,wave-red))))
 `(rainbow-delimiters-depth-8-face               ((,class (:foreground ,light-blue))))
 `(rainbow-delimiters-depth-9-face               ((,class (:foreground ,spring-violet-2))))

 ;; show-paren
 `(show-paren-match                              ((,class (:background ,wave-aqua-1 :foreground ,sumi-ink-0 :weight bold :underline ,(when kanagawa-theme-underline-parens t)))))
 `(show-paren-match-expression                   ((,class (:background ,wave-aqua-1 :foreground ,sumi-ink-0 :weight bold))))
 `(show-paren-mismatch                           ((,class (:background ,peach-red :foreground ,old-white :underline ,(when kanagawa-theme-underline-parens t)))))
 `(tooltip                                       ((,class (:foreground ,sumi-ink-0 :background ,carp-yellow :weight bold))))

 ;; company-box
 `(company-tooltip                               ((,class (:background ,sumi-ink-2))))
 `(company-tooltip-common                        ((,class (:foreground ,autumn-yellow))))
 `(company-tooltip-quick-access                  ((,class (:foreground ,spring-violet-2))))
 `(company-tooltip-scrollbar-thumb               ((,class (:background ,autumn-red))))
 `(company-tooltip-scrollbar-track               ((,class (:background ,sumi-ink-2))))
 `(company-tooltip-search                        ((,class (:background ,carp-yellow :foreground ,sumi-ink-0 :distant-foreground ,fuji-white))))
 `(company-tooltip-selection                     ((,class (:background ,peach-red :foreground ,winter-red :weight bold))))
 `(company-tooltip-mouse                         ((,class (:background ,sumi-ink-2 :foreground ,sumi-ink-0 :distant-foreground ,fuji-white))))
 `(company-tooltip-annotation                    ((,class (:foreground ,peach-red :distant-foreground ,sumi-ink-1))))
 `(company-scrollbar-bg                          ((,class (:inherit tooltip))))
 `(company-scrollbar-fg                          ((,class (:background ,peach-red))))
 `(company-preview                               ((,class (:foreground ,carp-yellow))))
 `(company-preview-common                        ((,class (:foreground ,peach-red :weight bold))))
 `(company-preview-search                        ((,class (:inherit company-tooltip-search))))
 `(company-template-field                        ((,class (:inherit match))))

 ;; flycheck
 `(flycheck-posframe-background-face             ((,class (:background ,sumi-ink-0))))
 `(flycheck-posframe-face                        ((,class (:background ,sumi-ink-0))))
 `(flycheck-posframe-info-face                   ((,class (:background ,sumi-ink-0 :foreground ,autumn-green))))
 `(flycheck-posframe-warning-face                ((,class (:background ,sumi-ink-0 :foreground ,light-blue))))
 `(flycheck-posframe-error-face                  ((,class (:background ,sumi-ink-0 :foreground ,samurai-red))))
 `(flycheck-fringe-warning                       ((,class (:foreground ,light-blue))))
 `(flycheck-fringe-error                         ((,class (:foreground ,samurai-red))))
 `(flycheck-fringe-info                          ((,class (:foreground ,autumn-green))))
 `(flycheck-error-list-warning                   ((,class (:foreground ,ronin-yellow :weight bold))))
 `(flycheck-error-list-error                     ((,class (:foreground ,samurai-red :weight bold))))
 `(flycheck-error-list-info                      ((,class (:foreground ,wave-aqua-1 :weight bold))))
 `(flycheck-inline-error                         ((,class (:foreground ,samurai-red :background ,winter-red :slant italic :weight bold :height 138))))
 `(flycheck-inline-info                          ((,class (:foreground ,light-blue :background ,winter-blue :slant italic  :weight bold :height 138))))
 `(flycheck-inline-warning                       ((,class (:foreground ,winter-yellow :background ,carp-yellow :slant italic :weight bold :height 138))))

 ;; indent dots
 `(highlight-indent-guides-character-face        ((,class (:foreground ,sumi-ink-3))))
 `(highlight-indent-guides-stack-character-face  ((,class (:foreground ,sumi-ink-3))))
 `(highlight-indent-guides-stack-odd-face        ((,class (:foreground ,sumi-ink-3))))
 `(highlight-indent-guides-stack-even-face       ((,class (:foreground ,comet))))
 `(highlight-indent-guides-stack-character-face  ((,class (:foreground ,sumi-ink-3))))
 `(highlight-indent-guides-even-face             ((,class (:foreground ,sumi-ink-2))))
 `(highlight-indent-guides-odd-face              ((,class (:foreground ,comet))))

 `(highlight-operators-face                      ((,class (:foreground ,boat-yellow-2))))
 `(highlight-quoted-symbol                       ((,class (:foreground ,spring-green))))
 `(highlight-numbers-face                        ((,class (:foreground ,sakura-pink))))
 `(highlight-symbol-face                         ((,class (:background ,wave-blue-1 :foreground ,light-blue))))

 ;; ivy
 `(ivy-current-match                             ((,class (:background ,crystal-blue :foreground ,sumi-ink-0 :weight bold))))
 `(ivy-action                                    ((,class (:background unspecified :foreground ,fuji-white))))
 `(ivy-grep-line-number                          ((,class (:background unspecified :foreground ,spring-green))))
 `(ivy-minibuffer-match-face-1                   ((,class (:background unspecified :foreground ,wave-red))))
 `(ivy-minibuffer-match-face-2                   ((,class (:background unspecified :foreground ,spring-green))))
 `(ivy-minibuffer-match-highlight                ((,class (:foreground ,light-blue))))
 `(ivy-grep-info                                 ((,class (:foreground ,light-blue))))
 `(ivy-grep-line-number                          ((,class (:foreground ,spring-violet-2))))
 `(ivy-confirm-face                              ((,class (:foreground ,wave-aqua-2))))

 ;; posframe's
 `(ivy-posframe                                  ((,class (:background ,sumi-ink-2))))
 `(ivy-posframe-border                           ((,class (:background ,sumi-ink-3))))

 ;;treemacs
 `(treemacs-directory-collapsed-face             ((,class (:foreground ,fuji-white))))
 `(treemacs-directory-face                       ((,class (:foreground ,fuji-white))))

 `(treemacs-file-face                            ((,class (:foreground ,fuji-white))))

 `(treemacs-git-added-face                       ((,class (:foreground ,surimi-orange))))
 `(treemacs-git-renamed-face                     ((,class (:foreground ,fuji-white))))
 `(treemacs-git-ignored-face                     ((,class (:foreground ,sumi-ink-4))))
 `(treemacs-git-unmodified-face                  ((,class (:foreground ,fuji-white))))
 `(treemacs-git-renamed-face                     ((,class (:foreground ,fuji-white))))
 `(treemacs-git-modified-face                    ((,class (:foreground ,spring-green))))

 ;; lsp and lsp-ui
 `(lsp-headerline-breadcrumb-path-error-face     ((,class (:underline (:color ,spring-green :style wave) :foreground ,sumi-ink-4 :background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-path-face           ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-path-hint-face      ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-path-info-face      ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-separator-face      ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-symbols-face        ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((,class (:background ,sumi-ink-0))))
 `(lsp-headerline-breadcrumb-symbols-error-face  ((,class (:foreground ,peach-red))))

 `(lsp-ui-doc-background                         ((,class (:background ,sumi-ink-0 :foreground ,peach-red))))
 `(lsp-ui-doc-header                             ((,class (:background ,sumi-ink-0 :foreground ,peach-red))))
 `(lsp-ui-doc-border                             ((,class (:background unspecified :foreground unspecified))))
 `(lsp-ui-peek-filename                          ((,class (:foreground ,light-blue))))
 `(lsp-ui-sideline-code-action                   ((,class (:foreground ,carp-yellow))))
 `(lsp-ui-sideline-current-symbol                ((,class (:foreground ,spring-blue))))
 `(lsp-ui-sideline-symbol                        ((,class (:foreground ,dragon-blue))))

 ;; dashboard
 `(dashboard-heading                             ((,class (:foreground ,spring-violet-2 :weight bold))))
 `(dashboard-items-face                          ((,class (:bold unspecified :foreground ,fuji-white))))
 `(dashboard-banner-logo-title                   ((,class (:weight bold :height 200))))
 `(dashboard-no-items-face                       ((,class (:foreground ,sumi-ink-4))))

 ;; all-the-icons
 `(all-the-icons-dgreen                          ((,class (:foreground ,wave-aqua-2))))
 `(all-the-icons-green                           ((,class (:foreground ,wave-aqua-2))))
 `(all-the-icons-dpurple                         ((,class (:foreground ,spring-violet-2))))
 `(all-the-icons-purple                          ((,class (:foreground ,spring-violet-2))))

 ;; evil
 `(evil-ex-lazy-highlight                        ((,class (:foreground ,winter-green :background ,autumn-green :weight bold))))
 `(evil-ex-substitute-matches                    ((,class (:foreground ,winter-red :background ,autumn-red :weight bold))))
 `(evil-ex-substitute-replacement                ((,class (:foreground ,surimi-orange :strike-through unspecified :inherit evil-ex-substitute-matches))))
 `(evil-search-highlight-persist-highlight-face  ((,class (:background ,carp-yellow))))

 ;; term
 `(term                                          ((,class (:background ,sumi-ink-0 :foreground ,fuji-white))))
 `(term-color-blue                               ((,class (:background ,crystal-blue :foreground ,crystal-blue))))
 `(term-color-bright-blue                        ((,class (:inherit term-color-blue))))
 `(term-color-green                              ((,class (:background ,wave-aqua-2 :foreground ,wave-aqua-2))))
 `(term-color-bright-green                       ((,class (:inherit term-color-green))))
 `(term-color-black                              ((,class (:background ,sumi-ink-0 :foreground ,fuji-white))))
 `(term-color-bright-black                       ((,class (:background ,sumi-ink-1b :foreground ,sumi-ink-1b))))
 `(term-color-white                              ((,class (:background ,fuji-white :foreground ,fuji-white))))
 `(term-color-bright-white                       ((,class (:background ,old-white :foreground ,old-white))))
 `(term-color-red                                ((,class (:background ,peach-red :foreground ,peach-red))))
 `(term-color-bright-red                         ((,class (:background ,spring-green :foreground ,spring-green))))
 `(term-color-yellow                             ((,class (:background ,carp-yellow :foreground ,carp-yellow))))
 `(term-color-bright-yellow                      ((,class (:background ,carp-yellow :foreground ,carp-yellow))))
 `(term-color-cyan                               ((,class (:background ,spring-blue :foreground ,spring-blue))))
 `(term-color-bright-cyan                        ((,class (:background ,spring-blue :foreground ,spring-blue))))
 `(term-color-magenta                            ((,class (:background ,spring-violet-2 :foreground ,spring-violet-2))))
 `(term-color-bright-magenta                     ((,class (:background ,spring-violet-2 :foreground ,spring-violet-2))))

 ;; popup
 `(popup-face                                    ((,class (:inherit tooltip))))
 `(popup-selection-face                          ((,class (:inherit tooltip))))
 `(popup-tip-face                                ((,class (:inherit tooltip))))

 ;; anzu
 `(anzu-match-1                                  ((,class (:foreground ,wave-aqua-2 :background ,sumi-ink-2))))
 `(anzu-match-2                                  ((,class (:foreground ,carp-yellow :background ,sumi-ink-2))))
 `(anzu-match-3                                  ((,class (:foreground ,light-blue :background ,sumi-ink-2))))

 `(anzu-mode-line                                ((,class (:foreground ,sumi-ink-0 :background ,spring-violet-2))))
 `(anzu-mode-no-match                            ((,class (:foreground ,fuji-white :background ,peach-red))))
 `(anzu-replace-to                               ((,class (:foreground ,spring-blue :background ,winter-blue))))
 `(anzu-replace-highlight                        ((,class (:foreground ,peach-red :background ,winter-red :strike-through t))))

 ;; ace
 `(ace-jump-face-background                      ((,class (:foreground ,wave-blue-2))))
 `(ace-jump-face-foreground                      ((,class (:foreground ,peach-red :background ,sumi-ink-0 :weight bold))))

 ;; vertico
 `(vertico-multiline                             ((,class (:background ,samurai-red))))
 `(vertico-group-title                           ((,class (:background ,winter-blue :foreground ,light-blue :weight bold))))
 `(vertico-group-separator                       ((,class (:background ,winter-blue :foreground ,light-blue :strike-through t))))
 `(vertico-current                               ((,class (:foreground ,carp-yellow :weight bold :slant italic :background ,wave-blue-1))))

 `(vertico-posframe-border                       ((,class (:background ,sumi-ink-3))))
 `(vertico-posframe                              ((,class (:background ,sumi-ink-2))))
 `(orderless-match-face-0                        ((,class (:foreground ,crystal-blue :weight bold))))

 `(comint-highlight-prompt                       ((,class (:background ,spring-violet-2 :foreground ,sumi-ink-1))))
 `(completions-annotations                       ((,class (:background unspecified :foreground ,dragon-blue :slant italic))))
 `(marginalia-file-priv-no                       ((,class (:background unspecified))))

 ;; hydra
 `(hydra-face-amaranth                           ((,class (:foreground ,autumn-red))))
 `(hydra-face-blue                               ((,class (:foreground ,spring-blue))))
 `(hydra-face-pink                               ((,class (:foreground ,sakura-pink))))
 `(hydra-face-red                                ((,class (:foreground ,peach-red))))
 `(hydra-face-teal                               ((,class (:foreground ,light-blue))))

 ;; centaur-tabs

 `(centaur-tabs-active-bar-face                  ((,class (:background ,spring-blue :foreground ,fuji-white))))
 `(centaur-tabs-selected                         ((,class (:background ,sumi-ink-1b :foreground ,fuji-white :weight bold))))
 `(centaur-tabs-selected-modified                ((,class (:background ,sumi-ink-1b :foreground ,fuji-white))))
 `(centaur-tabs-modified-marker-selected         ((,class (:background ,sumi-ink-1b :foreground ,autumn-yellow))))
 `(centaur-tabs-close-selected                   ((,class (:inherit centaur-tabs-selected))))
 `(tab-line                                      ((,class (:background ,sumi-ink-0))))

 `(centaur-tabs-unselected                       ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4))))
 `(centaur-tabs-default                          ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4))))
 `(centaur-tabs-unselected-modified              ((,class (:background ,sumi-ink-0 :foreground ,peach-red))))
 `(centaur-tabs-modified-marker-unselected       ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4))))
 `(centaur-tabs-close-unselected                 ((,class (:background ,sumi-ink-0 :foreground ,sumi-ink-4))))

 `(centaur-tabs-close-mouse-face                 ((,class (:background unspecified :foreground ,peach-red))))
 `(centaur-tabs-default                          ((,class (:background ,ronin-yellow ))))
 `(centaur-tabs-name-mouse-face                  ((,class (:foreground ,spring-blue :weight bold))))

 `(git-gutter:added                              ((,class (:foreground ,autumn-green))))
 `(git-gutter:deleted                            ((,class (:foreground ,wave-red))))
 `(git-gutter:modified                           ((,class (:foreground ,spring-blue))))

 `(diff-hl-margin-change                         ((,class (:foreground ,spring-blue :background ,winter-blue))))
 `(diff-hl-margin-delete                         ((,class (:foreground ,peach-red :background ,winter-red))))
 `(diff-hl-margin-insert                         ((,class (:foreground ,comet :background ,winter-blue))))

 `(bm-fringe-face                                ((,class (:background ,peach-red :foreground ,sumi-ink-3))))
 `(bm-fringe-persistent-face                     ((,class (:background ,peach-red :foreground ,sumi-ink-3))))

 `(ansi-color-green                              ((,class (:foreground ,spring-green))))
 `(ansi-color-black                              ((,class (:background ,sumi-ink-0))))
 `(ansi-color-cyan                               ((,class (:foreground ,wave-aqua-2))))
 `(ansi-color-magenta                            ((,class (:foreground ,sakura-pink))))
 `(ansi-color-blue                               ((,class (:foreground ,crystal-blue))))
 `(ansi-color-red                                ((,class (:foreground ,peach-red))))
 `(ansi-color-white                              ((,class (:foreground ,fuji-white))))
 `(ansi-color-yellow                             ((,class (:foreground ,autumn-yellow))))
 `(ansi-color-bright-white                       ((,class (:foreground ,old-white))))
 `(ansi-color-bright-white                       ((,class (:foreground ,old-white))))

 `(tree-sitter-hl-face:attribute                 ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:escape                    ((,class (:foreground ,wave-red))))
 `(tree-sitter-hl-face:constructor               ((,class (:foreground ,wave-red :weight semi-bold))))

 `(tree-sitter-hl-face:constant                  ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:constant.builtin          ((,class (:foreground ,carp-yellow :weight semi-bold))))

 `(tree-sitter-hl-face:embedded                  ((,class (:foreground ,boat-yellow-2))))


 `(tree-sitter-hl-face:function.builtin          ((,class (:foreground ,peach-red :slant italic :background ,winter-red))))
 `(tree-sitter-hl-face:function.call             ((,class (:foreground ,spring-violet-2))))
 `(tree-sitter-hl-face:function.macro            ((,class (:foreground ,samurai-red))))
 `(tree-sitter-hl-face:function.special          ((,class (:foreground ,sakura-pink))))
 `(tree-sitter-hl-face:function.label            ((,class (:foreground ,surimi-orange))))

 `(tree-sitter-hl-face:method                    ((,class (:foreground ,light-blue))))
 `(tree-sitter-hl-face:method.call               ((,class (:foreground ,light-blue))))

 `(tree-sitter-hl-face:property                  ((,class (:foreground ,carp-yellow))))
 `(tree-sitter-hl-face:property.definition       ((,class (:foreground ,old-white :slant italic))))

 `(tree-sitter-hl-face:tag                       ((,class (:foreground ,peach-red))))

 `(tree-sitter-hl-face:type                      ((,class (:foreground ,wave-aqua-2 :weight semi-bold))))
 `(tree-sitter-hl-face:type.argument             ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:type.builtin              ((,class (:foreground ,autumn-red))))
 `(tree-sitter-hl-face:type.parameter            ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:type.super                ((,class (:foreground ,samurai-red :weight bold))))

 `(tree-sitter-hl-face:variable                  ((,class (:foreground ,spring-blue :slant italic))))
 `(tree-sitter-hl-face:variable.builtin          ((,class (:foreground ,wave-red))))
 `(tree-sitter-hl-face:variable.parameter        ((,class (:foreground ,spring-violet-2 :slant italic))))
 `(tree-sitter-hl-face:variable.special          ((,class (:foreground ,surimi-orange))))
 `(tree-sitter-hl-face:variable.synthesized      ((,class (:foreground ,light-blue))))

 `(tree-sitter-hl-face:number                    ((,class (:foreground ,sakura-pink))))
 `(tree-sitter-hl-face:operator                  ((,class (:foreground ,sakura-pink :weight bold))))

 `(tree-sitter-hl-face:punctuation               ((,class (:foreground ,light-blue))))
 `(tree-sitter-hl-face:punctuation.bracket       ((,class (:foreground ,spring-violet-2 :slant italic))))
 `(tree-sitter-hl-face:punctuation.delimiter     ((,class (:foreground ,spring-violet-2 :slant italic))))
 `(tree-sitter-hl-face:punctuation.special       ((,class (:foreground ,peach-red))))

 `(tree-sitter-hl-face:case-pattern              ((,class (:foreground ,wave-red))))
 `(tree-sitter-hl-face:variable.synthesized      ((,class (:foreground ,wave-red))))
 `(tree-sitter-hl-face:keyword.compiler          ((,class (:foreground ,peach-red :slant italic))))

 `(focus-unfocused                               ((,class (:foreground ,sumi-ink-4)))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'kanagawa)
;;; kanagawa-theme.el ends here
