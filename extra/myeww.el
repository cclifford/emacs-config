(require 'link-hint)
(require 'eww)
(define-key eww-mode-map "o" 'link-hint-open-link)
(setq browse-url-browser-function 'eww-browse-url)

(provide 'myeww)
