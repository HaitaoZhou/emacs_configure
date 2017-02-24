(with-eval-after-load 'org

  ;; 设置默认 Org Agenda 文件目录
  (setq org-agenda-files '("~/work/work_lists/org"))

  ;;高亮org文本内语法
  (setq org-src-fontify-natively t)

  ;; 设定org capture
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/work/work_lists/org/gtd.org" "TO-DO")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("e" "Emacs Better" entry (file+headline "~/work/work_lists/org/better_emacs.org" "Emacs Better")
           "* TODO %?\n  %i\n")))
  )


(provide 'init_org)
