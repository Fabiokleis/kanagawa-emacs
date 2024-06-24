# emacs-kanagawa-theme

source code in https://github.com/meritamen/emacs-kanagawa-theme are not available, so I made this repository.
In order to have kanagawa-theme just clone this repository in `~/.emacs.d/themes`
```
git clone git@github.com:Fabiokleis/emacs-kanagawa-theme.git ~/.emacs.d/themes
```

Add this to `~/.emacs.d/init.el`
```elisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'kanagawa t)
```
