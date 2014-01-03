;===================================
;; load-path
;===================================
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/vendor/el-get/")

(load "config/init-base.el")
(load "config/init-packages.el")
(load "config/init-anything.el")
(load "config/init-flycheck.el")
(load "config/init-php.el")
(load "config/init-javascript.el")
(load "config/init-yaml.el")
(load "config/init-html.el")
(load "config/init-highlight-symbol.el")
(load "config/init-git-gutter.el")
(load "config/init-magit.el")
(load "config/init-keybindings.el")
