;;redo+の設定
(when (require 'redo+ nil t)
  ;;C-'にリドゥを割り当てる
  ;;(global-set-key (kbd "C-'") 'redo)
  ;; 日本語キーボード場合C-,などがよいかも
 (global-set-key (kbd "C-,") 'redo)
 )
