(require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'htmlize)
  (package-install 'htmlize))

(unless (package-installed-p 'json-mode)
  (package-install 'json-mode))
