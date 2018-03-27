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

(setq org-html-htmlize-output-type 'css)

(org-publish-all)
