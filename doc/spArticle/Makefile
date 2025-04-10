XE_COMPILE = xelatex -interaction=nonstopmode -shell-escape
PDF_COMPILE = pdflatex -interaction=nonstopmode -shell-escape

EN = en

default:
	make xe

xe:
	$(XE_COMPILE) $(EN)
	biber $(EN)
	$(XE_COMPILE) $(EN)
	$(XE_COMPILE) $(EN)
	latexmk -c $(EN).tex
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

pdf:
	$(PDF_COMPILE) $(EN)
	biber $(EN)
	$(PDF_COMPILE) $(EN)
	$(PDF_COMPILE) $(EN)
	latexmk -c $(EN).tex
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*