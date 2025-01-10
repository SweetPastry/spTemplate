XE_COMPILE = xelatex -interaction=nonstopmode -shell-escape 

default:
	$(XE_COMPILE) doc
	biber doc
	$(XE_COMPILE) doc
	$(XE_COMPILE) doc
	latexmk -c doc
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.dvi
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

coverpage:
	$(XE_COMPILE) coverpage
	$(XE_COMPILE) coverpage
	$(XE_COMPILE) coverpage