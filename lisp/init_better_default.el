;; 去掉备份文件
(setq make-backup-files nil)
;; 去掉自动保存
(setq auto-save-default nil)

;; 自动加载文件更新
(global-auto-revert-mode t)

;; 快捷选择yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示最近打开文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 20)

;; 选中替换模式开启
(delete-selection-mode 1)

;; 优化括号高亮函数
(when (version< emacs-version "25")
  (defadvice show-paren-function (around fix-show-paren-function activate)
    (cond ((looking-at-p "\\s(") ad-do-it)
          (t (save-excursion
               (ignore-errors (backward-up-list))
               ad-do-it)))
    ))
(when (version<= "25" emacs-version)
  (define-advice show-paren-function (:around (fn) fix-show-paren-function)
    "Highlight enclosing parens."
    (cond ((looking-at-p "\\s(") (funcall fn))
          (t (save-excursion
               (ignore-errors (backward-up-list))
               (funcall fn))))))
;; 开启括号高亮配对模式
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 文本解码设置默认为UTF-8
(set-language-environment "UTF-8")

;; 优化代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

;; 设定hippie代码补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

;; 文件目录操作取消递归确认
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 关闭警告音
(setq ring-bell-function 'ignore)

;; 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 删除\r(^M)换行符
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; occur mode
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;; imuenu list config
(setq imenu-list-focus-after-activation t)
(setq imenu-list-auto-resize t)

;; 鼠标滚轮，默认的滚动太快，这里改为3行
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [wheel-up] 'down-slightly)
(global-set-key [wheel-down] 'up-slightly)

;; my fix for tab indent
(defun haitao/indent-region(numSpaces)
  (progn
    ;; default to start and end of current line
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))

    ;; if there's a selection, use that instead of the current line
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end))
      )

    (save-excursion                          ; restore the position afterwards
      (goto-char regionStart)                ; go to the start of region
      (setq start (line-beginning-position)) ; save the start of the line
      (goto-char regionEnd)                  ; go to the end of region
      (setq end (line-end-position))         ; save the end of the line

      (indent-rigidly start end numSpaces) ; indent between start and end
      (setq deactivate-mark nil)           ; restore the selected region
      )
    )
  )

(defun haitao/tab-region(N)
  (interactive "p")
  (if (use-region-p)
      (haitao/indent-region 4)               ; region was selected, call indent-region
    (insert "    ")                   ; else insert four spaces as expected
    ))

(defun haitao/untab-region(N)
  (interactive "p")
  (haitao/indent-region -4))

(defun haitao/hack-tab-key ()
  (interactive)
  (local-set-key (kbd "<tab>") 'haitao/tab-region)
  (local-set-key (kbd "<backtab>") 'haitao/untab-region)
  )

(add-hook 'prog-mode-hook 'haitao/hack-tab-key)
;;(add-hook 'text-mode-hook 'haitao/hack-tab-key)

;; 空格代替tab
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)

;; comment
(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )

(global-set-key [remap comment-or-uncomment-region] 'comment-or-uncomment-line-or-region)


(provide 'init_better_default)
