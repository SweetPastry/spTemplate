XE_COMPILE = xelatex -interaction=nonstopmode -shell-escape 

default:
	$(XE_COMPILE) en0 en1
	biber en0 en1
	$(XE_COMPILE) en0 en1
	$(XE_COMPILE) en0 en1
	latexmk -c en0 en1
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.vrb *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

	$(XE_COMPILE) en2 en3
	biber en2 en3
	$(XE_COMPILE) en2 en3
	$(XE_COMPILE) en2 en3
	latexmk -c en2 en3
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.vrb *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*