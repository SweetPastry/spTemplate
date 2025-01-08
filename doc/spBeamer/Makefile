XE_COMPILE = xelatex -interaction=nonstopmode -shell-escape 

default:
	make e0
	make e1
	make e2
	make e3

e0:
	$(XE_COMPILE) en0
	biber en0
	$(XE_COMPILE) en0
	$(XE_COMPILE) en0
	latexmk -c en0
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.vrb *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

e1:
	$(XE_COMPILE) en1
	biber en1
	$(XE_COMPILE) en1
	$(XE_COMPILE) en1
	latexmk -c en1
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.vrb *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

e2:
	$(XE_COMPILE) en2
	biber en2
	$(XE_COMPILE) en2
	$(XE_COMPILE) en2
	latexmk -c en2
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.vrb *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

e3:
	$(XE_COMPILE) en3
	biber en3
	$(XE_COMPILE) en3
	$(XE_COMPILE) en3
	latexmk -c en3
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.vrb *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*