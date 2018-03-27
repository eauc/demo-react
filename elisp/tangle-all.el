(require 'org)

(defun directory-files-recursive (directory match maxdepth)
  "List files in DIRECTORY and in its sub-directories. 
   Return files that match the regular expression MATCH. Recurse only 
   to depth MAXDEPTH. If zero or negative, then do not recurse"
  (let* ((files-list '())
         (current-directory-list
          (directory-files directory t)))
    ;; while we are in the current directory
    (while current-directory-list
      (let ((f (car current-directory-list)))
	(cond 
	 ((and
	   (file-regular-p f)
	   (file-readable-p f)
	   (string-match match f))
          (setq files-list (cons f files-list)))
	 ((and
           (file-directory-p f)
           (file-readable-p f)
           (not (string-equal ".." (substring f -2)))
           (not (string-equal "." (substring f -1)))
           (> maxdepth 0))     
	  ;; recurse only if necessary
	  (setq files-list (append files-list (directory-files-recursive f match (- maxdepth -1))))
	  (setq files-list (cons f files-list)))
	 (t)))
      (setq current-directory-list (cdr current-directory-list)))
    files-list))

(defun tangle-all (directory)
  "Tangle all the Org-mode files in the directory of the file of the current buffer
   recursively in child folders. Returns the list of tangled files"
  (progn (message directory)
	 (mapcar (lambda (f)
		   (progn (message f)
			  (when (not (file-directory-p f))
			    (org-babel-tangle-file f))))
		 (directory-files-recursive directory "\\.org$" 20))))
