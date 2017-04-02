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
         :html-preamble
         "<div class=\"header\">
              <a href=\"https://aprilwith.me\">自在随心</a> | <a href=\"http://github.com/qiaoin\">Github</a>
          </div>"
         :html-postamble
         (lambda (info)
           "Do not show disqus for Archive and Recent Posts"
           (cond ((string= (car (plist-get info :title)) "Sitemap") "")
                 ((string= (car (plist-get info :title)) "Recent Posts")
                  "<div id=\"sitmap\"><a href=\"https://aprilwith.me/index.html\">Other posts</a></div>")
                 (t
             "<div id=\"sitemap\"><a href=\"https://aprilwith.me/index.html\">Other posts</a></div>
              <div id=\"disqus_thread\"></div>
              <script type=\"text/javascript\">
              /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
              var disqus_shortname = 'bastibe';
              /* * * DON'T EDIT BELOW THIS LINE * * */
              (function() {
                var dsq = document.createElement('script');
                dsq.type = 'text/javascript';
                dsq.async = true;
                dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                  })();
              </script>
              <noscript>Please enable JavaScript to view the
                  <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>
              <a href=\"http://disqus.com\" class=\"dsq-brlink\">comments powered by <span class=\"logo-disqus\">Disqus</span></a>")))
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
