(require 'ycmd)

(set-variable 'ycmd-server-command '("python" "/Users/bing/Documents/github-qiaoin/ycmd/ycmd/"))
(set-variable 'ycmd-global-config "/Users/bing/Documents/github-qiaoin/ycmd/cpp/ycm/.ycm_extra_conf.py")

;; only for c++-mode by default, now add c and python into
(add-hook 'c-mode-hook 'ycmd-mode)
(add-hook 'python-mode-hook 'ycmd-mode)

(setq company-backends-c-mode-common '((company-c-headers
                                        company-ycmd
                                        company-dabbrev :with company-yasnippet)))

(require 'company-ycmd)
(company-ycmd-setup)

(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

(provide 'init-ycmd)
