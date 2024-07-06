# emacs-kanagawa-theme

source code in https://github.com/meritamen/emacs-kanagawa-theme are not available, so I made this repository.
In order to have kanagawa-theme just clone this repository in `~/.emacs.d/themes`
```
git clone git@github.com:Fabiokleis/emacs-kanagawa-theme.git ~/.emacs.d/themes
```

## Customize colors
You can overwrite default palette colors by setting custom variable `kanagawa-theme-custom-colors` like this:
```elisp
(use-package kanagawa-theme
  :load-path "~/.emacs.d/themes"
  :preface
  (setq kanagawa-theme-custom-colors '((sumi-ink-1b "#0A0E14")))
  :config
  (load-theme 'kanagawa t))
```
