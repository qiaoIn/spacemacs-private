;; org-mode configuration

(setq org-src-fontify-natively t)
;; insert timestamp when toggle state 'TODO' to 'DONE'
(setq org-log-done 'time)
(setq org-log-done 'note)

;; setting blog
(setq hexo-dir "/Users/bing/Documents/blog")
(defun blog-new (post-name)
  "create a hexo org post"
  (interactive "sInput post name:")
  (find-file (format "%s/source/_posts/%s.org" hexo-dir post-name))
  (insert (format "#+TITLE: %s
#+DATE: <%s>
#+OPTIONS: toc:nil
#+STARTUP: content

*添加摘要内容*
#+BEGIN_HTML
<!--more-->
#+END_HTML

#+TOC: headlines [level-num]

正文从这里开始， *注意* 仅使用 一级标题 =*= 和 三级标题 =***=
" post-name (format-time-string "%Y-%m-%d %H:%M:%S"))))

(with-eval-after-load 'org
  (setq org-agenda-files '("~/GTD")))

;; help function for insert chrome tabs
(defun zilongshanren/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (let ((result (do-applescript
                 (concat
                  "set frontmostApplication to path to frontmost application\n"
                  "tell application \"Google Chrome\"\n"
                  "	set theUrl to get URL of active tab of first window\n"
                  "	set theResult to (get theUrl) \n"
                  "end tell\n"
                  "activate application (frontmostApplication as text)\n"
                  "set links to {}\n"
                  "copy theResult to the end of links\n"
                  "return links as string\n"))))
    (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))

;; org templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/GTD/mygtd.org" "Tasks")
         "* TODO [#B] %?\n Added on %U\n %i\n %a"
         :empty-lines 1)
        ;; ("i" "Idea" entry (file+headline "~/GTD/mygtd.org" "Ideas") 
        ;;  "* TODO [#B] %?\n Added on %U\n %i\n %a"
        ;;  :empty-lines 1)
        ("s" "Someday" entry (file+datetree "~/GTD/someday.org" "Someday to complete")
         "* %?\n Added on %U\n %i\n %a"
         :empty-lines 1)
        ("n" "Note" entry (file+datetree "~/GTD/mynote.org" "Notes")
         "* %?\n Added on %U\n %i\n %a"
         :empty-lines 1)
        ("l" "Chrome links" entry (file+headlline "~/GTD/mygtd.org" "Quick notes")
         "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
         :empty-lines 1)
        ("j" "Journal" entry (file+datetree "~/GTD/journal.org")
         "* %?\n Added on %U\n %i\n %a"
         :empty-lines 1)))

; open org agenda view
(global-set-key (kbd "C-c a") 'org-agenda)
;; switch between =.org= files
(global-set-key (kbd "C-c b") 'org-iswitchb)
;; org capture
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-archive-location "~/GTD/archive.org::datetree/* From %s Finished Tasks") 

;; refile and archive
;; (setq org-refile-targets
;;       (quote (("mygtd.org" :maxlevel. 1)
;;               ("archive.org" :level . 2))))

;; Custom Agenda Commands
;; http://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
;; configuration later


(provide 'init-org)
