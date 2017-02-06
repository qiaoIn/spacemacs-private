;; org-mode configuration
(setq org-src-fontify-natively t)

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
        ("l" "Chrome links" entry (file+headlline "~/GTD/mygtd.org" "Quick notes")
         "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
         :empty-lines 1)
        ("j" "Journal" entry (file+datetree "~/GTD/journal.org")
         "* %?\n Added on %U\n %i\n %a"
         :empty-lines 1)))

(global-set-key (kbd "C-c r") 'org-capture)

;; Custom Agenda Commands
;; http://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
;; configuration later


(provide 'init-org)
