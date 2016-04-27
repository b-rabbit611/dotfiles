;;emacs�̏������(welcome ���b�Z�[�W)��\��
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(set-language-environment "Japanese")
;; �t�@�C���V�K�쐬���̕����R�[�h�� CP932 �ɂ���
;;(prefer-coding-system 'cp932)
;; �t�@�C���V�K�쐬���̕����R�[�h�� utf8 �ɂ���
(prefer-coding-system 'utf-8)
;; �t�@�C�����̕����R�[�h�� CP932 �ɂ���
(set-file-name-coding-system 'cp932)
(set-keyboard-coding-system 'cp932)
(set-terminal-coding-system 'cp932)
(setq default-file-name-coding-system 'cp932)

;; �t�H���g�Ƃ��� MS �S�V�b�N�A14 �|�C���g���g�p
(add-to-list 'default-frame-alist
  '(font . "�l�r �S�V�b�N-14"))

;; �o�b�N�A�b�v�t�@�C�������Ȃ�
(setq backup-inhibited t)

;; �x�[�X�� Shift-JIS �̂܂�
(set-language-environment "Japanese")
;; �t�@�C���̃f�t�H���g�� HTML �� C++ �p�� BOM �t�� UTF-8
(setq default-buffer-file-coding-system 'utf-8-with-signature)
;; BOM �Ȃ� UTF-8 �łȂ���΂Ȃ�Ȃ�����
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

;; load-path��ǉ�����֐����`
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
	  (let ((default-directory
	          (expand-file-name (concat user-emacs-directory path))))
	    (add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
		    (normal-top-level-add-subdirs-to-load-path))))))

;; �����̃f�B���N�g���Ƃ��̃T�u�f�B���N�g����load-path�ɒǉ�
(add-to-load-path "lisp" "site-lisp" "elisp")

;; Define directory of init files.
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/inits")

;;;; auto-install�̐ݒ�
;;(when (require 'auto-install nil t)
;;  ;; �C���X�g�[���f�B���N�g����ݒ肷��@�����l�� ~/.emacs.d/auto-install/
;;  (setq auto-install-directory "~/.emacs.d/elisp/")
;;  ;;EmacsWiki�ɓo�^����Ă���elisp�̖��O���擾����
;;  (auto-install-update-emacswiki-package-name t)
;;  ;;�K�v�ł���΃v���L�V�̐ݒ���s��
;;  ;;(setq url-proxy-services '(("http" . "localhost:8339")))
;;  ;; install-elisp�̊֐��𗘗p�\�Ƃ���
;;  (auto-install-compatibility-setup))

;; �J�����ԍ����\��
(column-number-mode t)
;; �t�@�C���T�C�Y��\��
(size-indication-mode t)
;; ���v��\���i�D�݂ɉ����ăt�H�[�}�b�g��ύX�\�j
;; (setq display-time-day-and-date t) ; �j���E���E����\��
;; (setq display-time-24hr-format t) ; 24���\��
(display-time-mode t)
;; �s�ԍ�����ɕ\������
;; (global-linum-mode t)
;; �o�b�N�A�b�v�t�@�C�����쐬���Ȃ�
;; (setq make-backup-files nil) ; �����l��t
;; �I�[�g�Z�[�u�t�@�C�������Ȃ�
;; (setq auto-save-default nil) ; �����l��t

(define-key global-map (kbd "C-l") 'anything)

;; Python�pFlymake�̐ݒ�
(when (require 'flmake-python nil t)
  (setq flymake-python-syntax-checker "flake8")
  ;; pep8�𗘗p����
  ;; (setq flymake-python-syntax-checker "pep8")
  )

;; undohist�̐ݒ�
(when (require 'undohist nil t)
  (undohist-initialize)
  )

;; undo-tree�̐ݒ�
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))











