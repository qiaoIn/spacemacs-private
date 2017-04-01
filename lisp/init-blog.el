(require 'ox-html)
(require 'ox-publish)

(setq org-publish-project-alist
      '(
        ("blog" :components ("blog-notes" "blog-static"))
        ("blog-notes"
         :base-directory "~/org/blog/"
         :html-extension "html"
         :base-extension "org"
         :publishing-directory "~/org/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :section-numbers nil
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "Sitemap"
         :sitemap-sort-files anti-chronologically
         :sitemap-style list
         :with-latex t
         :auto-preamble t
         :author "qiaoin"
         :email "qiao dot liubing at gmail dot com"
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/site.css\"/>"
         )
        ("blog-static"
         :base-directory "~/org/blog/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/org/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ))

(provide 'init-blog)
