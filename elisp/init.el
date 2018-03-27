(require 'package)
(package-initialize)

(add-to-list 'load-path "/home/emacs/org-9.1.9/lisp")
(add-to-list 'load-path "/home/emacs/org-9.1.9/contrib/lisp")

(require 'org)
(require 'htmlize)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (js . t)
   (emacs-lisp . t)
   (clojure . t)
   (python . t)
   (ruby . t)
   (dot . t)
   (css . t)
   (plantuml . t)))

(add-to-list 'org-src-lang-modes '("jsx" . js))

(setq org-src-fontify-natively t)
