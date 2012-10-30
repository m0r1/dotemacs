;===================================
;; zencoding-mode
;===================================
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
(add-hook 'text-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap "\C-i" 'zencoding-expand-line)
