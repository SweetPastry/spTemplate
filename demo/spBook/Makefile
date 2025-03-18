XE_COMPILE = xelatex -interaction=nonstopmode -shell-escape

default:
	$(XE_COMPILE) demo
	biber demo
	$(XE_COMPILE) demo
	$(XE_COMPILE) demo
	latexmk -c demo
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.dvi
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

coverpage:
	$(XE_COMPILE) coverpage
	$(XE_COMPILE) coverpage
	$(XE_COMPILE) coverpage