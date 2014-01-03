;=====================================
; Language, CodingSystem, Dictionary
;=====================================
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq dired-default-file-coding-system 'utf-8)
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

;; 同一ファイル名を区別できるように
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


;===================================
;; dired
;===================================
;; 2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のディレクトリにする
(setq dired-dwim-target t)
;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
;; C-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

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


;===================================
; Show tab, zenkaku-space, whitespaces at end of line, etc.
;===================================
(require 'whitespace)
(setq whitespace-style '(face spaces space-mark tabs tab-mark empty trailing))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode 1)
(set-face-attribute 'whitespace-trailing nil
                    :background "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background "Purple")
(set-face-attribute 'whitespace-space nil
                    :background "LimeGreen"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background "Red"
                    :underline t)

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
;; trim-buffer を実行(M-o)
(global-set-key "\eo" 'trim-buffer)
