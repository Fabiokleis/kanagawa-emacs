# emacs-kanagawa-theme

kanagawa-theme.el --- An elegant theme inspired by The Great Wave off Kanagawa

Copyright (C) 2023 Mikael Konradsson
Copyright (C) 2023-2024 Shira Filianore <meritamen@sdf.org>

Author: Shira Filianore <meritamen@sdf.org>

Maintainer: Fabio Kleis <fabiohkrc@gmail.com>

Kanagawa is a theme inspired by the colors of the famous painting
The Great Wave off Kanagawa by Katsushika Hokusa.
Original theme created by rebelot see: https://github.com/rebelot/kanagawa.nvim

## Installation
kanagawa-theme are available on melpa. To install add this to your emacs config file:
```elisp
(use-package kanagawa-theme
  :ensure t
  :config
  (load-theme 'kanagawa t))
```

## Customize colors
You can overwrite default palette colors by setting custom variable `kanagawa-theme-custom-colors` like this:
```elisp
(use-package kanagawa-theme
  :ensure t
  :preface
  (setq kanagawa-theme-custom-colors '((sumi-ink-1b "#0A0E14")))
  :config
  (load-theme 'kanagawa t))
```
`use-package` should download `kanagawa-theme`, in order to apply new colors you must recompile `kanagawa-theme`
by running package-recompile and reopen emacs.
