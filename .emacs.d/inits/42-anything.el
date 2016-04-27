;; (auto-install-batch "anything")
(when (require 'anything nil t)
  (setq
   ;; ����\������܂ł̎��ԁB�f�t�H���g��0.5
   anything-idle-delay 0.3
   ;; �^�C�v���čĕ`�ʂ���܂ł̎��ԁB�f�t�H���g��0.1
   anything-input-idle-delay 0.2
   ;; ���̍ő�\�����B�f�t�H���g��50
   anything-candidate-number-limit 100
   ;; ��₪�����Ƃ��ɑ̊����x�𑁂�����
   anything-quick-update t
   ;; ���I���V���[�g�J�b�g���A���t�@�x�b�g��
   anything-enable-shortcuts 'alphabet)

  (when (require 'anything-config nil t)
    ;; root�����ŃA�N�V���������s����Ƃ��̃R�}���h
    ;; �f�t�H���g��"su"
    (setq anything-su-or-sudo "sudo"))

  (require 'anything-match-plugin nil t)

  (when (and (executable-find "cmigemo")
             (require 'migemo nil t))
    (require 'anything-migemo nil t))

  (when (require 'anything-complete nil t)
    ;; lisp�V���{���̕⊮���̍Č�������
    (anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil t)

;  (when (require 'auto-install nil t)
;    (require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
    ;; describe-bindings��Anything�ɒu��������
    (descbinds-anything-install)))

;; ���v�g���@�\�C���X�g�[����
;;; P127-128 �ߋ��̗�������y�[�X�g����anything-show-kill-ring
;; M-y��anything-show-kill-ring�����蓖�Ă�
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)

;; ���v�g���@�\�C���X�g�[����
;;; P128-129 moccur�𗘗p���鄟��anything-c-moccur
(when (require 'anything-c-moccur nil t)
  (setq
   ;; anything-c-moccur�p `anything-idle-delay'
   anything-c-moccur-anything-idle-delay 0.1
   ;; �o�b�t�@�̏����n�C���C�g����
   anything-c-moccur-higligt-info-line-flag t
   ;; ���ݑI�𒆂̌��̈ʒu���ق���window�ɕ\������
   anything-c-moccur-enable-auto-look-flag t
   ;; �N�����Ƀ|�C���g�̈ʒu�̒P��������p�^�[���ɂ���
   anything-c-moccur-enable-initial-pattern t)
  ;; C-M-o��anything-c-moccur-occur-by-moccur�����蓖�Ă�
  (global-set-key (kbd "C-M-o") 'anything-c-moccur-occur-by-moccur))
