;===================================
;; package
;===================================
(require 'package)
(setq package-user-dir "~/.emacs.d/vendor/")
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(package-refresh-contents)
(defvar my/packages
  '(
    anything anything-config anything-match-plugin anything-complete anything-show-completion
    auto-complete
    php-mode js2-mode yaml-mode
    flycheck
    anzu
    highlight-symbol auto-highlight-symbol
    git-gutter magit
))
(dolist (package my/packages)
  (unless (package-installed-p package)
    (package-install package)))


;===================================
;; el-get
;===================================
(setq el-get-dir "~/.emacs.d/vendor/")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(defvar my/el-get-packages
  '(
    php-completion
    ))
(el-get 'sync my/el-get-packages)
