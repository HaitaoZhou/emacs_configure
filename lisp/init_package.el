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
                          elpy
                          flycheck
                          py-autopep8
                          company-anaconda
                          xcscope
                          mwim
                          ibuffer-projectile
                          magit
                          org-pomodoro
                          expand-region
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
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-transformers '(company-sort-by-occurrence))
(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-yasnippet)))

;; require dired-x for c-x c-j打开文件所在目录
(require 'dired-x)

;; require iedit for multiple regions
(require 'iedit)

;; require which key
(require 'which-key)
(which-key-mode)

;; yasnippet
(require 'yasnippet)
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(setq yas-snippet-dirs
      '("~/work/snippets"                 ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-20161221.1953/snippets" ;; the default collection
        ))
(yas-global-mode 1)

;; xcscope
(require  'xcscope)
(cscope-setup)

;; cua-mode
(cua-mode 1)

;; python-mode config
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'elpy-mode)
(when (require 'flycheck nil t)
  (require 'elpy)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; ibuffer-projectile
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-projectile-set-filter-groups)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

;; pomodoro
(require 'org-pomodoro)

;; expand-region
(require 'expand-region)

(provide 'init_package)
