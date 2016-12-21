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

;; 括号高亮配对模式
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init_better_default)
