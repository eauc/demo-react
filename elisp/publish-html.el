(require 'package)
;; (message "step-a")
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
;; (message "step-b")
(package-refresh-contents)
;; (message "step-c")

(unless (package-installed-p 'htmlize)
  (package-install 'htmlize))
;; (message "step1")

(add-to-list 'load-path "/home/emacs/org-9.1.9/lisp")
(add-to-list 'load-path "/home/emacs/org-9.1.9/contrib/lisp")

(require 'org)
(require 'htmlize)
;; (message "step3")

(message (format "Org version: %s" (org-version)))

(defun org-publish-org-sitemap (title list)
  "Sitemap generation function."
  (concat (format "#+TITLE: %s\n#+SETUPFILE: ./publish.setup\n\n" title)
          (org-list-to-subtree list)))

(defun org-publish-org-sitemap-format (entry style project)
  "Custom sitemap entry formatting: add date"
  (cond ((not (directory-name-p entry))
         (format "[[file:./%s][%s]]"
                 entry
                 (org-publish-find-title entry project)))
        ((eq style 'tree)
         ;; Return only last subdir.
         (file-name-nondirectory (directory-file-name entry)))
        (t entry)))

(setq org-publish-project-alist
      '(("demo-react--doc-html"
	 :base-directory "org"
	 :publishing-directory "docs"
	 :publishing-function org-html-publish-to-html
	 :section-numbers nil
         :recursive t
	 :with-toc t
	 :auto-sitemap t
	 :sitemap-filename "index.org"
	 :sitemap-title "Demo react documentation"
	 :sitemap-function org-publish-org-sitemap
	 :sitemap-format-entry org-publish-org-sitemap-format
	 )))

(setq org-publish-use-timestamps-flag nil)

(setq org-export-html-style-include-scripts nil
      org-export-html-style-include-default nil)
;; (message "step4")
(org-publish-all)

;; (message "step5")
