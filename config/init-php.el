;===================================
;; php-mode
;===================================
(load "php-mode")
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-hook 'php-mode-hook
          (lambda ()
            (setq tab-width 4
                  indent-tabs-mode nil)))

(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (when (require 'auto-complete nil t)
              (add-to-list 'ac-sources 'ac-source-php-completion)
              (auto-complete-mode t))))
