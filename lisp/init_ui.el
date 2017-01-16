;; 主题配置
(load-theme 'monokai 1)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 140)

;; 高亮当前行
(global-hl-line-mode 1)

;; 启动是全屏运行 
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 定义透明函数处理
(setq alpha-list '((90 90) (100 100)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab))))
     (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))))

;; 启动设定透明
(loop-alpha)

;; 这句指定默认英文字体为Dejavu Sans Mono，大小10
(set-default-font "Dejavu Sans Mono 12")

;; 前面一串“(if...lambda...(with-select-frame frame ())...)"是个很好的函数框架，意思是frame创建后载入，用这个框架可以解决--daemon启动的问题
;; 只有set-fontset-font一句指定修改字符集'unicode的字体为文泉驿等宽微米黑，大小为12
(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(with-selected-frame frame
		  (set-fontset-font "fontset-default"
				    'unicode "WenQuanyi Micro Hei Mono 15"))))
  (set-fontset-font "fontset-default" 'unicode "WenQuanYi Micro Hei Mono 15"))

(provide 'init_ui)
