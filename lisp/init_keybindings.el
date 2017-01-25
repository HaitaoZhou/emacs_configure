;; counsel key配置
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 设置 org快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; 绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(global-set-key (kbd "C-x f") 'find-file-in-project)

;; 透明操作
(global-set-key (kbd "<f10>") 'loop-alpha)

;; imenu list
(global-set-key (kbd "<f12>") 'imenu-list-minor-mode)

;; 绑定调整代码缩进
(global-set-key (kbd "M-C-\\") 'indent-region-or-buffer)

;; 设定hippie补全
(global-set-key (kbd "M-C-;") 'hippie-expand)

;; iedit mode
(global-set-key (kbd "M-C-i") 'iedit-mode)

;; occur mode
(global-set-key (kbd "M-C-o") 'occur-dwim)

;; company-yasnippet
(global-set-key (kbd "M-C-y") 'company-yasnippet)

;; mwim
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)
(global-set-key (kbd "<home>") 'mwim-beginning-of-line-or-code)
(global-set-key (kbd "<end>") 'mwim-end-of-line-or-code)

;; comment
(global-set-key (kbd "M-C-/") 'comment-or-uncomment-region)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)

(provide 'init_keybindings)
