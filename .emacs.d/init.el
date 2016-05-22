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

;;emacsの初期画面(welcome メッセージ)非表示
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(set-language-environment "Japanese")
;; ファイル新規作成時の文字コードを CP932 にする
;;(prefer-coding-system 'cp932)
;; ファイル新規作成時の文字コードを utf8 にする
(prefer-coding-system 'utf-8)


;; プラットフォームを判定して分岐する
(if (eq system-type 'windows-nt) (load "~/.emacs.d/site-lisp/windows.el"))
(if (eq system-type 'gnu/linux) (load "~/.emacs.d/site-lisp/linux.el"))

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
(define-key global-map (kbd "C-;") 'toggle-truncate-lines)

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

;; 入力されるキーシーケンスを置き換える
;; ?\C-hはDELキーのシーケンス
(keyboard-translate ?\C-h ?\C-?)

;; 別のキーバインドにヘルプを割り当てる
(define-key global-map (kbd "C-x ?") 'help-command)

(autoload 'dired-filter-mode "dired-filter" nil t)

;; "C-t"でウィンドウを切り替る。初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)

;; dired-modeでonにする
(defun dired-mode-hooks()
	(dired-filter-mode))
(add-hook 'dired-mode-hook 'dired-mode-hooks)

;; M-yにAnything-show-kill-ringを割り当てる。
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)

;; カーソル位置から行頭まで削除する
;(defun backward-kill-line (arg)
;  "Kill chars backward until encountering the end of a line."
;  (interactive "p")
;  (kill-line 0))
;; C-S-kに設定
;(global-set-key (kbd "C-S-k") 'backward-kill-line)

(define-key global-map (kbd "C-S-k") (kbd "C-u 0 C-k"))

;; "nn" で「ん」を入力
(setq enable-double-n-syntax t)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
