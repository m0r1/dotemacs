;===================================
; Key Bindings
;===================================
;; goto-line
(define-key ctl-x-map "L" 'goto-line)
(global-set-key "\C-xl" 'goto-line)

;; comment, uncomment
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)

;; C-h to backspace
(global-set-key "\C-h" 'delete-backward-char)

;; define the function to kill the characters from the cursor
;; to the beginning of the current line
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
(global-set-key "\C-u" 'backward-kill-line)

;; frame
(global-set-key "\M-2" 'make-frame)
(global-set-key "\M-0" 'delete-frame)

; auto indent
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)
