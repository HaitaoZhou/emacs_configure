
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init_package)
(require 'init_ui)
(require 'init_better_default)
(require 'init_org)
(require 'init_keybindings)

(setq custom-file (expand-file-name "lisp/init_custom.el" user-emacs-directory))
(load-file custom-file)

