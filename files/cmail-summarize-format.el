(setq
 cmail-summarize-format
 '(lambda ()
    (let* ((j (cmail-summary-fp-value ?j))
	   (s j)
	   (page (cmail-get-page-number-from-summary))
	   (unit "K")
	   (inbox? (string= cmail-inbox-folder cmail-current-folder))
	   (tag ""))
      (if (and (not inbox?)
	       (string-match "^\\[.*\\][ \t]*\\(.*\\)" j))
	  (setq s (match-string 1 j)))
      (save-excursion
	(cmail-get-folder)
	(if inbox?
	    (progn
	      (cmail-n-page page)
	      (setq tag (cmail-get-field-values-in-mail-buffer "X-ML-Name"))
	      (if (or (string= "ruby-talk" tag) (string= "modruby-ja" tag))
		  (setq tag
			(concat "[" tag ":"
				(cmail-get-field-values-in-mail-buffer
				 "X-Mail-Count") "] "))
		(setq tag ""))))
	(setq page (- (cmail-n-page (1+ page)) (cmail-n-page page)))
	(if (< (* 1024 1024) page)
	    (setq page (/ page (* 1024 1024.0)) unit "M")
	  (setq page (/ page 1024.0))))
      (format "%s %5.1f%s %s| %s%s%s\n"
	      (cmail-summary-fp-value ?d)
	      page
	      unit
	      (cmail-fill -10 (cmail-summary-fp-value ?n))
	      (cmail-summary-fp-value ?I)
	      tag
	      s))))
