;; counsel key配置
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; 绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; 透明操作
(global-set-key (kbd "<f10>") 'loop-alpha)

;; 绑定调整代码缩进
(global-set-key (kbd "M-s-\\") 'indent-region-or-buffer)

;; 设定hippie补全
(global-set-key (kbd "M-s-/") 'hippie-expand)

;; iedit mode
(global-set-key (kbd "M-s-e") 'iedit-mode)

;; occur mode
(global-set-key (kbd "M-s-o") 'occur-dwim)

(provide 'init_keybindings)
