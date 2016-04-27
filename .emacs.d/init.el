;;emacsの初期画面(welcome メッセージ)非表示
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(set-language-environment "Japanese")
;; ファイル新規作成時の文字コードを CP932 にする
;;(prefer-coding-system 'cp932)
;; ファイル新規作成時の文字コードを utf8 にする
(prefer-coding-system 'utf-8)
;; ファイル名の文字コードを CP932 にする
(set-file-name-coding-system 'cp932)
(set-keyboard-coding-system 'cp932)
(set-terminal-coding-system 'cp932)
(setq default-file-name-coding-system 'cp932)

;; フォントとして MS ゴシック、14 ポイントを使用
(add-to-list 'default-frame-alist
  '(font . "ＭＳ ゴシック-14"))

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; ベースは Shift-JIS のまま
(set-language-environment "Japanese")
;; ファイルのデフォルトを HTML や C++ 用に BOM 付き UTF-8
(setq default-buffer-file-coding-system 'utf-8-with-signature)
;; BOM なし UTF-8 でなければならない言語
(modify-coding-system-alist 'file "\\.java\\'" 'utf-8) ;; Java
(modify-coding-system-alist 'file "\\.clj\\'" 'utf-8) ;; Clojure
(modify-coding-system-alist 'file "\\.\\(scala\\|sbt\\)\\'" 'utf-8) ;; Scala
(modify-coding-system-alist 'file "\\.[eh]rl\\'" 'utf-8) ;; Erlang
(modify-coding-system-alist 'file "\\.exs?\\'" 'utf-8) ;; Elixir

;; Use init-loader.el
;; ref. https://github.com/emacs-jp/init-loader

;; Load downloaded init-loader.el
;; ref. http://tatsuyano.github.io/blog/2013/03/19/emacs-el-get-init-loader/
;;setq load-path
;;  (append
;;  (list
;;  (expand-file-name "~/.emacs.d/")
;;(expand-file-name "~/.emacs.d/lisp/")
;;(expand-file-name "~/.emacs.d/site-lisp/")
;;(expand-file-name "~/.emacs.d/site-lisp/yatex")
;;  )
;;  load-path))

;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
	  (let ((default-directory
	          (expand-file-name (concat user-emacs-directory path))))
	    (add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
		    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "lisp" "site-lisp" "elisp")

;; Define directory of init files.
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/inits")

;;;; auto-installの設定
;;(when (require 'auto-install nil t)
;;  ;; インストールディレクトリを設定する　初期値は ~/.emacs.d/auto-install/
;;  (setq auto-install-directory "~/.emacs.d/elisp/")
;;  ;;EmacsWikiに登録されているelispの名前を取得する
;;  (auto-install-update-emacswiki-package-name t)
;;  ;;必要であればプロキシの設定を行う
;;  ;;(setq url-proxy-services '(("http" . "localhost:8339")))
;;  ;; install-elispの関数を利用可能とする
;;  (auto-install-compatibility-setup))

;; カラム番号も表示
(column-number-mode t)
;; ファイルサイズを表示
(size-indication-mode t)
;; 時計を表示（好みに応じてフォーマットを変更可能）
;; (setq display-time-day-and-date t) ; 曜日・月・日を表示
;; (setq display-time-24hr-format t) ; 24時表示
(display-time-mode t)
;; 行番号を常に表示する
;; (global-linum-mode t)
;; バックアップファイルを作成しない
;; (setq make-backup-files nil) ; 初期値はt
;; オートセーブファイルを作らない
;; (setq auto-save-default nil) ; 初期値はt

(define-key global-map (kbd "C-l") 'anything)

;; Python用Flymakeの設定
(when (require 'flmake-python nil t)
  (setq flymake-python-syntax-checker "flake8")
  ;; pep8を利用する
  ;; (setq flymake-python-syntax-checker "pep8")
  )

;; undohistの設定
(when (require 'undohist nil t)
  (undohist-initialize)
  )

;; undo-treeの設定
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))











