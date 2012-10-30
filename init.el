;===================================
;; load-path
;===================================
(setq user-emacs-directory "~/.emacs.d")
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name user-emacs-directory)))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "vendor" "auto-install")

(load "config/init-base.el")
(load "config/init-keybindings.el")
(load "config/init-color.el")
(load "config/init-auto-install.el")
(load "config/init-anything.el")
(load "config/init-php.el")
(load "config/init-yaml.el")
(load "config/init-javascript.el")
(load "config/init-yasnippet.el")
(load "config/init-zencoding.el")
