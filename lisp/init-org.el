;; org-mode configuration

(setq org-src-fontify-natively t)

;; set org todo keywords, default *ONLY* contain TODO and DONE
;; TODO(t) The item is ready to be done at the earliest opportunity or at the date
;;         (and maybe time) indicated in the SCHEDULED tag. Some tasks are given
;;         a DEADLINE date which is useful for scheduling the tasks during my daily planning.
;; STARTED(s!) I should use this tag when I start on a task, but if I clock in to
;;             a TODO item, I don't really need this task.
;; WAITING(w@/!) I did some work on this task but I am waiting for a response. If I use
;;               this task I schedule the task into the future as a reminder to follow up
;;               with some notes in the body of the task.
;; APPT(a@) Used to tag an activity that can only be done at the specified time and date,
;;          instead of tasks that can be completed at any time.
;; | divide "TODO" sequences and "DONE" sequences
;; DONE(d!) The task is completed.
;; CANCELED(c@/!) I decided not to do this task but have left the task on file with this status.
;; DEFERRED(f@/!) Used to identify a task that will not be activated just yet.
;;                The reason will be included in the task notes.
;; followed this article
;; published on http://members.optusnet.com.au/~charles57/GTD/gtd_workflow.html
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)" "APPT(a@)"
                  "|" "DONE(d!)" "CANCELED(c@/!)" "DEFERRED(f@/!)")))

;; insert timestamp when toggle state 'TODO' to 'DONE'
(setq org-log-done 'time)
(setq org-log-done 'note)

;; setting blog
(setq blog-dir "/Users/bing/org/blog")
(defun new-blog (post-name)
  "create a org post for https://aprilwith.me"
  (interactive "sInput post name:")
  (find-file (format "%s/%s.org" blog-dir post-name))
  (insert (format "#+TITLE: %s
#+DATE: <%s>
#+OPTIONS: toc:nil
#+STARTUP: content

#+TOC: headlines [level-num]

正文从这里开始， *注意* 使用 Org-mode 的方式进行编辑即可。
" post-name (format-time-string "%Y-%m-%d %H:%M:%S"))))

(with-eval-after-load 'org
  (setq org-agenda-files '("~/GTD")))

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

;; Custom Agenda Commands
;; http://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
;; configuration later


(provide 'init-org)
