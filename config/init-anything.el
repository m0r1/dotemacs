;===================================
;; anything
;===================================
(when (require 'anything nil t)
  (setq
   anything-idle-delay 0.2
   anything-input-idle-delay 0.5
   anything-candidate-number-limit 20
   anything-quick-update t
   anything-enable-shortcuts 'alphabet)

  ;; anything-c-source-emacs-functionsの高速化
  (setq anything-c-source-emacs-functions
        '((name . "Emacs Functions")
          (init . (lambda ()
                    (with-current-buffer (anything-candidate-buffer 'global)
                      (insert
                       (mapconcat
                        'identity
                        (let (commands)
                          (mapatoms (lambda (a)
                                      (if (functionp a)
                                          (push (symbol-name a) commands))))
                          (sort commands 'string-lessp))
                        "\n")))))
          (candidates-in-buffer)
          (type . function)
          (requires-pattern . 2)))

  (when (require 'anything-config nil t)
    (setq anything-sources
          '(anything-c-source-buffers
            anything-c-source-recentf
            anything-c-source-man-pages
            anything-c-source-emacs-commands
            anything-c-source-emacs-functions
            anything-c-source-files-in-current-dir))

    (setq anything-su-or-sudo "sudo"))

  (require 'anything-match-plugin nil t)
  (and (equal current-language-environment "Japanese")
       (executable-find "cmigemo")
       (require 'anything-migemo nil t))
  (when (require 'anything-complete nil t)
    ;; M-xによる補完をAnythingで行なう
    (anything-read-string-mode 1)
    ;; lispシンボルの補完候補の再検索時間
    (anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil t)

  (require 'anything-grep nil t)

  (require 'anything-migemo)

  ;; C-hをBackspaceに
  (define-key anything-map (kbd "C-h") 'delete-backward-char))
