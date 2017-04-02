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
         :html-head-extra
         "<link rel=\"icon\" href=\"favicon.ico\">"   ;; 设置网帐logo \TODO
         :html-preamble
         "<div class=\"header\">
              <a href=\"https://aprilwith.me\">自在随心</a> | <a href=\"http://github.com/qiaoin\">Github</a>
          </div>"
         :html-postamble
         (lambda (info)
           "Do not show disqus for Archive and Recent Posts"
           (cond ((string= (car (plist-get info :title)) "Sitemap") "")
                 ((string= (car (plist-get info :title)) "Recent Posts")
                  "<div id=\"sitemap\"><a href=\"https://aprilwith.me\">Other posts</a></div>")
                 (t
                  "<div id=\"disqus_thread\"></div>
                  <script>
                  /**
                   *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
                   *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
                   */
                  /*
                  var disqus_config = function () {
                    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
                    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                  };
                  */
                  (function() { // DON'T EDIT BELOW THIS LINE
                    var d = document, s = d.createElement('script');
                    s.src = 'https://aprilwith.disqus.com/embed.js';
                    s.setAttribute('data-timestamp', +new Date());
                    (d.head || d.body).appendChild(s);
                  })();
                  </script>
                  <noscript>
                    Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a>
                  </noscript>")))
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
