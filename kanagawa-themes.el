;;; kanagawa-themes.el --- Elegant theme inspired by The Great Wave off Kanagawa -*- lexical-binding: t -*-

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
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Kanagawa is a theme inspired by the colors of the famous painting
;; The Great Wave off Kanagawa by Katsushika Hokusa.
;; Original theme created by rebelot see: https://github.com/rebelot/kanagawa.nvim

;;; Code:

(require 'kanagawa-palette)
(require 'kanagawa-colors)

(defgroup kanagawa-themes nil
  "Kanagawa-theme options."
  :group 'faces)

(defcustom kanagawa-themes-comment-italic t
  "Enable italics for comments and also disable background."
  :type 'boolean
  :group 'kanagawa-themes)

(defcustom kanagawa-themes-keyword-italic t
  "Enable italics for keywords."
  :type 'boolean
  :group 'kanagawa-themes)

(defcustom kanagawa-themes-org-height t
  "Use varying text heights for org headings."
  :type 'boolean
  :group 'kanagawa-themes)

(defcustom kanagawa-themes-org-bold t
  "Inherit text bold for org headings."
  :type 'boolean
  :group 'kanagawa-themes)

(defcustom kanagawa-themes-org-priority-bold t
  "Inherit text bold for priority items in agenda view."
  :type 'boolean
  :group 'kanagawa-themes)

(defcustom kanagawa-themes-org-highlight nil
  "Highlight org headings."
  :type 'boolean
  :group 'kanagawa-themes)

;;;###autoload
(defcustom kanagawa-themes-custom-colors '()
  "Place to override default theme colors.")

(defmacro kanagawa-themes--faces-spec ()
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
      (header-line (:foreground ,fg :background ,bg-p1 :extend t))
      (highlight (:foreground ,fg :background ,bg-dim :weight bold))
      (success (:foreground ,diag-ok :weight bold))
      (warning (:foreground ,diag-warning :weight bold))
      (tooltip (:foreground ,pmenu-fg :background ,pmenu-bg))
      (menu (:foreground ,fg :background ,bg))
;;;;;;; font lock
      (font-lock-builtin-face (:foreground ,fg))
      (font-lock-comment-face (:foreground ,syn-comment
                                           :slant ,(if kanagawa-themes-comment-italic 'italic 'normal)))
      (font-lock-comment-delimiter-face (:foreground ,syn-comment))
      (font-lock-constant-face (:foreground ,syn-constant))
      (font-lock-doc-face (:foreground ,syn-string))
      (font-lock-function-name-face (:foreground ,syn-fun))
      (font-lock-keyword-face (:foreground ,syn-keyword :weight bold
                                           :slant ,(if kanagawa-themes-keyword-italic 'italic 'normal)))
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
      (ansi-color-bright-cyan (:foreground ,bright-cyan))
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
      (hl-line (:background ,bg-p2))
;;;;;;; message
      (message-header-name (:foreground ,bg-p1))
      (message-header-other (:foreground ,extend-color-1))
      (message-header-subject (:foreground ,bright-yellow))
      (message-header-to (:foreground ,white))
      (message-header-cc (:foreground ,bright-cyan))
      (message-header-xheader (:foreground ,white))
;;;;;;; erc
      (erc-action-face (:inherit erc-default-face))
      (erc-bold-face (:weight bold))
      (erc-current-nick-face (:foreground ,syn-constant :weight bold))
      (erc-direct-msg-face (:inherit erc-default-face))
      (erc-error-face (:foreground ,diag-warning))
      (erc-fool-face (:inherit erc-default-face))
      (erc-input-face (:foreground ,fg))
      (erc-keyword-face (:inherit font-lock-keyword-face))
      (erc-nick-default-face (:foreground ,bright-blue :weight bold))
      (erc-my-nick-face (:foreground ,red))
      (erc-notice-face (:foreground ,syn-string))
      (erc-prompt-face (:inherit minibuffer-prompt))
      (erc-timestamp-face (:inherit font-lock-keyword-face))
      (erc-underline-face (:underline t))
;;;;;;; term
      (term (:foreground ,fg :background ,bg))
      (term-color-black (:foreground ,black :background ,black))
      (term-color-red (:foreground ,red :background ,red))
      (term-color-green (:foreground ,green :background ,green))
      (term-color-yellow (:foreground ,yellow :background ,yellow))
      (term-color-blue (:foreground ,blue :background ,blue))
      (term-color-magenta (:foreground ,magenta :background ,magenta))
      (term-color-cyan (:foreground ,cyan :background ,cyan))
      (term-color-white (:foreground ,white :background ,white))
;;;;;;; org-mode
      (org-done (:foreground ,diag-info))
      (org-code (:background ,bg-m3))
      (org-meta-line (:foreground ,diag-ok :background ,diff-add))
      (org-block (:foreground ,fg :background ,bg))
      (org-block-begin-line (:foreground ,bright-blue :background ,diff-change))
      (org-block-end-line (:foreground ,extend-color-2 :background ,diff-delete))
      (org-headline-done (:foreground ,diag-info :strike-through t))
      (org-todo (:foreground ,extend-color-1 :weight bold))
      (org-headline-todo (:foreground ,bg-m1))
      (org-upcoming-deadline (:foreground ,extend-color-1))
      (org-footnote (:foreground ,bright-cyan))
      (org-indent (:foreground ,bg :background ,bg))
      (org-hide (:inherit org-indent))
      (org-date (:foreground ,bg-search))
      (org-ellipsis (:foreground ,bg-search :weight bold))
      (org-level-1 (:foreground ,extend-color-1
                                :height ,(if kanagawa-themes-org-height 1.3 1.0)
                                :weight ,(if kanagawa-themes-org-bold 'bold 'normal)))
      (org-level-2 (:foreground ,syn-punct
                                :height ,(if kanagawa-themes-org-height 1.2 1.0)
                                :weight ,(if kanagawa-themes-org-bold 'bold 'normal)))
      (org-level-3 (:foreground ,yellow :height ,(if kanagawa-themes-org-height 1.1 1.0)))
      (org-level-4 (:foreground ,fg))
      (org-level-5 (:foreground ,fg))
      (org-level-6 (:foreground ,bright-yellow))
      (org-level-7 (:foreground ,extend-color-1))
      (org-level-8 (:foreground ,bright-green))
      (org-priority (:foreground ,extend-color-2
                                 :weight ,(if kanagawa-themes-org-priority-bold 'bold 'normal)))
;;;;;; show-paren
      (show-paren-match (:foreground ,diag-warning :weight bold))
      (show-paren-match-expression (:inherit show-paren-match))
      (show-paren-mismatch (:foreground ,bright-black :weight bold))
;;;;;; tab-line
      (tab-line (:background ,bg-m3))
;;;;;; comint
      (comint-highlight-prompt (:background ,syn-punct :foreground ,bg-dim))
;;;;;; completions
      (completions-annotations (:background unspecified :foreground ,diag-info :slant italic))

;;;;;; Third-party packages

;;;;;;; highlight-indent-guides
      (highlight-indent-guides-character-face (:foreground ,bg))
      (highlight-indent-guides-stack-character-face (:foreground ,bg))
      (highlight-indent-guides-stack-odd-face (:foreground ,bg))
      (highlight-indent-guides-stack-even-face (:foreground ,nontext))
      (highlight-indent-guides-stack-character-face (:foreground ,bg))
      (highlight-indent-guides-even-face (:foreground ,bg-m3))
      (highlight-indent-guides-odd-face (:foreground ,nontext))
;;;;;; ivy
      (ivy-current-match (:foreground ,bg-m3 :background ,blue :weight bold))
      (ivy-action (:foreground ,fg))
      (ivy-grep-line-number (:foreground ,bright-green))
      (ivy-minibuffer-match-face-1 (:foreground ,syn-perproc))
      (ivy-minibuffer-match-face-2 (:inherit ivy-grep-line-number))
      (ivy-minibuffer-match-highlight (:foreground ,blue))
      (ivy-grep-info (:foreground ,blue))
      (ivy-grep-line-number (:foreground ,syn-punct))
      (ivy-confirm-face (:foreground ,bright-cyan))
;;;;;;; ivy-posframe
      (ivy-posframe (:background ,bg-m1))
      (ivy-posframe-border (:background ,bg))
;;;;;; treemacs
      (treemacs-directory-collapsed-face (:foreground ,fg))
      (treemacs-directory-face (:inherit treemacs-directory-collapsed-face))
      (treemacs-file-face (:inherit treemacs-directory-face))
      (treemacs-git-added-face (:foreground ,extend-color-1))
      (treemacs-git-renamed-face (:inherit treemacs-file-face))
      (treemacs-git-ignored-face (:foreground ,bg-p1))
      (treemacs-git-unmodified-face (:inhert treemacs-git-renamed-face))
      (treemacs-git-renamed-face (:inhert treemacs-git-unmodified-face))
      (treemacs-git-modified-face (:foreground ,bright-green))
;;;;;;; lsp-mode
      (lsp-headerline-breadcrumb-path-error-face (:underline (:color ,bright-green :style wave)
                                                             :foreground ,bg-p1 :background ,bg-m3))
      (lsp-headerline-breadcrumb-path-face (:background ,bg-m3))
      (lsp-headerline-breadcrumb-path-hint-face (:foreground ,diag-hint))
      (lsp-headerline-breadcrumb-path-info-face (:foreground ,diag-info))
      (lsp-headerline-breadcrumb-separator-face (:inherit lsp-headerline-breadcrumb-path-face))
      (lsp-headerline-breadcrumb-symbols-face (:inherit lsp-headerline-breadcrumb-path-face))
      (lsp-headerline-breadcrumb-project-prefix-face (:inherit lsp-headerline-breadcrumb-path-face))
      (lsp-headerline-breadcrumb-symbols-error-face (:foreground ,extend-color-2))
;;;;;;; lsp-ui
      (lsp-ui-doc-background (:foreground ,extend-color-2 :background ,bg-m3))
      (lsp-ui-doc-header (:inherit lsp-ui-doc-background))
      (lsp-ui-doc-border (:background unspecified :foreground unspecified))
      (lsp-ui-peek-filename (:foreground ,blue))
      (lsp-ui-sideline-code-action (:foreground ,bright-yellow))
      (lsp-ui-sideline-current-symbol (:foreground ,bright-blue))
      (lsp-ui-sideline-symbol (:foreground ,diag-info))
;;;;;;; rainbow-delimiters
      (rainbow-delimiters-mismatched-face (:foreground ,extend-color-2))
      (rainbow-delimiters-unmatched-face (:foreground ,bright-cyan))
      (rainbow-delimiters-base-error-face (:foreground ,extend-color-2))
      (rainbow-delimiters-base-face (:foreground ,bg-p1))
      (rainbow-delimiters-depth-1-face (:foreground ,syn-punct))
      (rainbow-delimiters-depth-2-face (:foreground ,diag-info))
      (rainbow-delimiters-depth-3-face (:foreground ,bright-magenta))
      (rainbow-delimiters-depth-4-face (:foreground ,bright-green))
      (rainbow-delimiters-depth-5-face (:foreground ,bright-cyan))
      (rainbow-delimiters-depth-6-face (:foreground ,bright-yellow))
      (rainbow-delimiters-depth-7-face (:foreground ,extend-color-2))
      (rainbow-delimiters-depth-8-face (:foreground ,blue))
      (rainbow-delimiters-depth-9-face (:foreground ,syn-punct))
;;;;;;; swiper
      (swiper-line-face (:foreground ,bright-yellow))
      (swiper-background-match-face-1 (:foreground ,bg-m3 :background ,syn-constant))
      (swiper-background-match-face-2 (:foreground ,bg-m3 :background ,blue))
      (swiper-background-match-face-3 (:foreground ,bg-m3 :background ,yellow))
      (swiper-background-match-face-4 (:foreground ,bg-m3 :background ,extend-color-2))
      (swiper-match-face-1 (:inherit swiper-background-match-face-1))
      (swiper-match-face-2 (:inherit swiper-background-match-face-2))
      (swiper-match-face-3 (:inherit swiper-background-match-face-3))
      (swiper-match-face-4 (:inherit swiper-background-match-face-4))
;;;;;;; which-key
      (which-key-key-face (:inherit font-lock-variable-name-face))
      (which-func (:inherit font-lock-function-name-face :weight bold))
      (which-key-group-description-face (:foreground ,syn-perproc))
      (which-key-command-description-face (:foreground ,blue))
      (which-key-local-map-description-face (:foreground ,bright-yellow))
      (which-key-posframe  (:background ,pmenu-bg))
      (which-key-posframe-border (:inherit which-key-posframe))
;;;;;;; tree-sitter-hl-mode
      (tree-sitter-hl-face:variable (:foreground ,fg))
      (tree-sitter-hl-face:variable.builtin (:foreground ,syn-special-2 :slant italic))
      (tree-sitter-hl-face:variable.parameter (:foreground ,syn-parameter))
      (tree-sitter-hl-face:variable.special (:foreground ,syn-special-3))
      (tree-sitter-hl-face:string (:foreground ,syn-string))
      (tree-sitter-hl-face:number (:foreground ,syn-number))
      (tree-sitter-hl-face:string.special (:foreground ,syn-regex))
      (tree-sitter-hl-face:attribute (:foreground ,syn-constant))
      (tree-sitter-hl-face:constructor (:foreground ,syn-special-1))
      (tree-sitter-hl-face:operator (:foreground ,syn-operator))
      (tree-sitter-hl-face:keyword (:foreground ,syn-keyword
                                                :slant ,(if kanagawa-themes-keyword-italic 'italic 'normal)))
      (tree-sitter-hl-face:punctuation (:foreground ,syn-punct))
      (tree-sitter-hl-face:punctuation.delimiter (:inherit tree-sitter-hl-face:punctuation))
      (tree-sitter-hl-face:punctuation.bracket (:inhert tree-sitter-hl-face:punctuation))
      (tree-sitter-hl-face:punctuation.special (:foreground ,syn-special-1))
      (tree-sitter-hl-face:comment (:inherit font-lock-comment-face))
      (tree-sitter-hl-face:tag (:inhert tree-sitter-hl-face:attribute))
      (tree-sitter-hl-face:label (:foreground ,syn-punct))
;;;;;;; elfeed
      (elfeed-search-feed-face (:foreground ,bright-magenta))
      (elfeed-search-tag-face (:foreground ,bright-cyan))
;;;;;;; doom-modeline battery colors
      (doom-modeline-battery-critical (:foreground ,extend-color-2))
      (doom-modeline-battery-warning (:foreground ,bright-green))
      (doom-modeline-battery-charging (:foreground ,bright-black))
      (doom-modeline-battery-error (:foreground ,extend-color-2))
      (doom-modeline-battery-normal (:foreground ,bright-magenta))
      (doom-modeline-battery-full (:foreground ,bright-cyan))
;;;;;;; doom-modeline evil state
      (doom-modeline-evil-motion-state (:foreground ,blue))
      (doom-modeline-evil-emacs-state (:foreground ,bright-blue))
      (doom-modeline-evil-insert-state (:foreground ,syn-special-3))
      (doom-modeline-evil-normal-state (:foreground ,blue))
      (doom-modeline-evil-visual-state (:foreground ,bright-green))
      (doom-modeline-evil-replace-state (:foreground ,diag-warning))
      (doom-modeline-evil-operator-state (:foreground ,syn-fun))
;;;;;;; doom-modeline
      (doom-modeline-project-dir (:foreground ,bright-cyan :weight bold))
      (doom-modeline-buffer-path (:inherit doom-modeline-project-dir))
      (doom-modeline-buffer-file (:foreground ,magenta))
      (doom-modeline-buffer-modified (:foreground ,bright-yellow))
      (doom-modeline-error (:background ,extend-color-2))
      (doom-modeline-buffer-major-mode (:inherit doom-modeline-buffer-path))
      (doom-modeline-info (:foreground ,blue))
      (doom-modeline-bar (:background ,bright-magenta :weight bold))
      (doom-modeline-panel (:foreground ,bg-m1 :background ,syn-operator))
      (doom-themes-visual-bell (:background ,vcs-removed))
;;;;;;; anzu
      (anzu-match-1 (:foreground ,bright-cyan :background ,bg-m1))
      (anzu-match-2 (:foreground ,bright-yellow :background ,bg-m1))
      (anzu-match-3 (:foreground ,blue :background ,bg-m1))
      (anzu-mode-line (:foreground ,bg-m3 :background ,syn-punct))
      (anzu-mode-no-match (:foreground ,fg :background ,extend-color-2))
      (anzu-replace-to (:foreground ,bright-blue :background ,diff-change))
      (anzu-replace-highlight (:foreground ,extend-color-2 :background ,diff-delete :strike-through t))
;;;;;;; company
      (company-tooltip (:background ,bg-m1))
      (company-tooltip-common (:foreground ,vcs-changed))
      (company-tooltip-quick-access (:foreground ,syn-punct))
      (company-tooltip-scrollbar-thumb (:background ,vcs-removed))
      (company-tooltip-scrollbar-track (:inherit company-tooltip))
      (company-tooltip-search (:foreground ,bg-m3 :background ,bright-yellow :distant-foreground ,fg))
      (company-tooltip-selection (:foreground ,diff-delete :background ,extend-color-2 :weight bold))
      (company-tooltip-mouse (:foreground ,bg-m3 :background ,bg-m3 :distant-foreground ,fg))
      (company-tooltip-annotation (:foreground ,extend-color-2 :distant-foreground ,bg-dim))
      (company-scrollbar-bg (:inherit tooltip))
      (company-scrollbar-fg (:background ,extend-color-2))
      (company-preview (:foreground ,bright-yellow))
      (company-preview-common (:foreground ,extend-color-2 :weight bold))
      (company-preview-search (:inherit company-tooltip-search))
      (company-template-field (:inherit match))
;;;;;;; ace
      (ace-jump-face-background (:foreground ,bright-blue))
      (ace-jump-face-foreground (:foreground ,extend-color-2 :background ,bg-m3 :weight bold))
;;;;;;; vertigo
      (vertico-multiline (:background ,diag-error))
      (vertico-group-title ( :foreground ,blue :background ,diff-change :weight bold))
      (vertico-group-separator (:inherit vertico-group-title :strike-through t))
      (vertico-current (:foreground ,bright-yellow :background ,fg-reverse :weight bold :slant italic))
;;;;;;; vertico-posfram
      (vertico-posframe-border (:background ,bg))
      (vertico-posframe (:background ,bg-m1))
;;;;;;; vertico
      (marginalia-file-priv-no (:background unspecified))
;;;;;;; hydra
      (hydra-face-amaranth (:foreground ,vcs-removed))
      (hydra-face-blue (:foreground ,bright-blue))
      (hydra-face-pink (:foreground ,syn-number))
      (hydra-face-red (:foreground ,extend-color-2))
      (hydra-face-teal (:foreground ,blue))
;;;;;;; centaur-tabs
      (centaur-tabs-active-bar-face (:foreground ,fg :background ,bright-blue))
      (centaur-tabs-selected (:foreground ,fg :background ,bg :weight bold))
      (centaur-tabs-selected-modified (:foreground ,fg :background ,bg))
      (centaur-tabs-modified-marker-selected  (:foreground ,vcs-changed :background ,bg))
      (centaur-tabs-close-selected (:inherit centaur-tabs-selected))
      (centaur-tabs-unselected (:foreground ,bg-p1 :background ,bg-m3))
      (centaur-tabs-default (:inherit centaur-tabs-unselected))
      (centaur-tabs-unselected-modified (:foreground ,extend-color-2 :background ,bg-m3))
      (centaur-tabs-modified-marker-unselected (:inherit centaur-tabs-unselected))
      (centaur-tabs-close-unselected (:inherit centaur-tabs-unselected))
      (centaur-tabs-close-mouse-face (:foreground ,extend-color-2 :background unspecified))
      (centaur-tabs-default (:background ,diag-warning))
      (centaur-tabs-name-mouse-face (:foreground ,bright-blue :weight bold))
;;;;;;; git-gutter
      (git-gutter:added (:foreground ,vcs-added))
      (git-gutter:deleted  (:foreground ,syn-special-1))
      (git-gutter:modified (:foreground ,bright-blue))
;;;;;;; diff-hl
      (diff-hl-margin-change (:foreground ,bright-blue :background ,diff-change))
      (diff-hl-margin-delete (:foreground ,extend-color-2 :background ,diff-delete))
      (diff-hl-margin-insert (:foreground ,nontext :background ,diff-change))
;;;;;; flycheck
      (flycheck-posframe-background-face (:background ,bg-m3))
      (flycheck-posframe-face (:inherit flycheck-posframe-background-face))
      (flycheck-posframe-info-face (:foreground ,vcs-added :background ,bg-m3))
      (flycheck-posframe-warning-face (:foreground ,blue :background ,bg-m3))
      (flycheck-posframe-error-face (:foreground ,diag-error :background ,bg-m3))
      (flycheck-fringe-warning (:foreground ,blue))
      (flycheck-fringe-error (:foreground ,diag-error))
      (flycheck-fringe-info (:foreground ,vcs-added))
      (flycheck-error-list-warning (:foreground ,diag-warning :weight bold))
      (flycheck-error-list-error (:foreground ,diag-error :weight bold))
      (flycheck-error-list-info (:foreground ,diag-hint :weight bold))
      (flycheck-inline-error (:foreground ,diag-error
                                          :background ,diff-delete :slant italic :weight bold :height 138))
      (flycheck-inline-info (:foreground ,blue :background ,diff-change :slant italic :weight bold :height 138))
      (flycheck-inline-warning (:foreground ,diff-text
                                            :background ,bright-yellow :slant italic :weight bold :height 138))
;;;;;;; emacs-dashboard
      (dashboard-heading (:foreground ,syn-punct :weight bold))
      (dashboard-items-face (:foreground ,fg))
      (dashboard-banner-logo-title (:weight bold :height 200))
      (dashboard-no-items-face (:foreground ,bg-p1))
;;;;;;; popup
      (popup-face (:inherit tooltip))
      (popup-selection-face (:inherit tooltip))
      (popup-tip-face (:inherit tooltip))
;;;;;;; orderless
      (orderless-match-face-0 (:foreground ,green))
      (orderless-match-face-1 (:foreground ,magenta))
      (orderless-match-face-2 (:foreground ,blue))
      (orderless-match-face-3 (:foreground ,cyan)))))

(defmacro kanagawa-themes--define-theme (variant)
  (let ((name (intern (format "kanagawa-%s" (symbol-name variant))))
        (doc (format "The Kanagawa %s theme" variant)))
    `(progn
       (deftheme ,name ,doc)
       (kanagawa-themes--variant-with-colors
        ,variant
        (apply 'custom-theme-set-faces
               ',name
               (kanagawa-themes--faces-spec))
        (provide-theme ',name)))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'kanagawa-themes)

;; Local Variables
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; kanagawa-themes.el ends here
