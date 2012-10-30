;=====================================
; Language, CodingSystem, Dictionary
;=====================================
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; 文字コードの自動判定をオフ
;(setq auto-coding-functions nil)

;; ignore case
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; バックアップファイルを作らない
(setq backup-inhibited t)
(setq auto-save-default nil)

;; スクロールで改行を入れない
(setq next-line-add-newlines nil)

;; 行番号表示
(setq line-number-mode t)

;; 圧縮ファイルを扱えるように
(auto-compression-mode t)

;; ツールバー非表示
; (tool-bar-mode -1)
;; メニューバー非表示
; (menu-bar-mode -1)
;; スタートアップメッセージ非表示
(setq inhibit-startup-message t)
;; スクラッチメッセージ非表示
(setq initial-scratch-message "")

;===================================
;; Indent
;===================================
;; タブをスペースで扱う
(setq-default indent-tabs-mode nil)
;; タブ幅
(custom-set-variables '(tab-width 4))

;===================================
; Display Settings
;===================================
;; 選択範囲をハイライト
(transient-mark-mode t)

;; 対応する括弧をハイライト
(show-paren-mode t)
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "Pink")
(set-face-foreground 'show-paren-match-face "SkyBlue")

(setq default-frame-alist initial-frame-alist)
(progn
  (global-font-lock-mode 1)
  (set-face-foreground 'font-lock-comment-face "MediumSeaGreen")
  (set-face-foreground 'font-lock-string-face  "Purple")
  (set-face-foreground 'font-lock-keyword-face "Pink")
  (set-face-foreground 'font-lock-function-name-face "SkyBlue")
  (set-face-bold-p 'font-lock-function-name-face t)
  (set-face-foreground 'font-lock-variable-name-face "Blue")
  (set-face-foreground 'font-lock-type-face "LightSeaGreen")
  (set-face-foreground 'font-lock-builtin-face "Navy")
  (set-face-foreground 'font-lock-constant-face "Green")
  (set-face-foreground 'font-lock-warning-face "Skyblue")
  (set-face-bold-p 'font-lock-warning-face t)
  (set-background-color "Black")
  (set-cursor-color "Purple")
  (set-face-foreground 'modeline "Purple")
  (set-face-background 'modeline "AntiqueWhite")
)


;===================================
;; Show tab, zenkaku-space, white spaces at end of line
;; http://www.bookshelf.jp/soft/meadow_26.html#SEC317
;===================================
(defface my-face-tab         '((t (:background "Purple"))) nil :group 'my-faces)
(defface my-face-zenkaku-spc '((t (:background "LimeGreen"))) nil :group 'my-faces)
(defface my-face-spc-at-eol  '((t (:foreground "Red" :underline t))) nil :group 'my-faces)
(defvar my-face-tab         'my-face-tab)
(defvar my-face-zenkaku-spc 'my-face-zenkaku-spc)
(defvar my-face-spc-at-eol  'my-face-spc-at-eol)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-tab append)
     ("　" 0 my-face-zenkaku-spc append)
     ("[ \t]+$" 0 my-face-spc-at-eol append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
;; settings for text file
(add-hook 'text-mode-hook
          '(lambda () (progn (font-lock-mode t) (font-lock-fontify-buffer))))

;; 余分な空白を削除する
(defun trim-buffer ()
  "remove excess white space."
  (interactive)
  (save-excursion
    ;; タブを空白に変換
    (mark-whole-buffer)
    (untabify (region-beginning) (region-end))
    ;; 全角空白を半角空白に変換
    (while (re-search-forward "　" nil t)
      (replace-match " " nil nil))
    ;; 行末の空白を削除
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (replace-match "" nil nil))
    ;; ファイルの終わりにある空白行を削除
    (goto-char (point-max))
    (delete-blank-lines)
    ))
;; trim-buffer を実行(保存時)
;;(add-hook 'write-file-hooks '(lambda () (trim-buffer)))
;; trim-buffer を実行(M-o)
(global-set-key "\eo" 'trim-buffer)
