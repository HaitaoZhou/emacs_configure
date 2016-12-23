(with-eval-after-load 'org

  ;; 设置默认 Org Agenda 文件目录
  (setq org-agenda-files '("~/work/work_lists/org"))

  ;;高亮org文本内语法
  (setq org-src-fontify-natively t)

  )

(provide 'init_org)
