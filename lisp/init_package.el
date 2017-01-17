;; cl - Common Lisp Extension
(require 'cl)

;; 配置package
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; Add Packages
(defvar haitao/packages '(
			  company
			  hungry-delete
			  swiper
			  counsel
			  smex
			  smartparens
			  popwin
			  iedit
			  which-key
			  yasnippet
			  monokai-theme
			  youdao-dictionary
			  imenu-list
			  ) "Default packages")

(setq package-selected-packages haitao/packages)

(defun haitao/packages-installed-p ()
  (loop for pkg in haitao/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (haitao/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg haitao/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 配置光标自动跳转
(require 'popwin)
(popwin-mode 1)

;; 删除键增强
(global-hungry-delete-mode)

;; 自动补全括号
(smartparens-global-mode)

;; counsel配置
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; 开启全局 Company 补全
(global-company-mode t)

;; require dired-x for c-x c-j打开文件所在目录
(require 'dired-x)

;; require iedit for multiple regions
(require 'iedit)

;; require which key
(require 'which-key)
(which-key-mode)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
	"~/.emacs.d/elpa/yasnippet-20161221.1953/snippets"         ;; the default collection
	))
(yas-global-mode 1)

;; cua-mode
(cua-mode 1)

(provide 'init_package)
