;; ファイル名の文字コードを CP932 にする
(set-file-name-coding-system 'cp932)
(set-keyboard-coding-system 'cp932)
(set-terminal-coding-system 'cp932)
(setq default-file-name-coding-system 'cp932)


;; フォントとして
(add-to-list 'default-frame-alist
;  ' MS ゴシック、14 ポイントを使用
;  '(font . "ＭＳ ゴシック-14"))
;  '　ミリカ
  '(font . "Myrica M-14"))
