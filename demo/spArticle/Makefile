EN_ONE = enOnecol
EN_TWO = enTwocol
CN_ONE = cnOnecol
CN_TWO = cnTwocol
TEX_FILE = enOnecol, enTwocol, cnOnecol, cnTwocol

XE_COMPILE = xelatex -interaction=nonstopmode -shell-escape
PDF_COMPILE = pdflatex -interaction=nonstopmode -shell-escape

default:
	make e1
	make e2
	make c1
	make c2

pdf:
	make e1pdf
	make e2pdf
	make c1pdf
	make c2pdf

e1:
	$(XE_COMPILE) $(EN_ONE)
	biber $(EN_ONE)
	$(XE_COMPILE) $(EN_ONE)
	$(XE_COMPILE) $(EN_ONE)
	latexmk -c $(EN_ONE)
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*
e2:
	$(XE_COMPILE) $(EN_TWO)
	biber $(EN_TWO)
	$(XE_COMPILE) $(EN_TWO)
	$(XE_COMPILE) $(EN_TWO)
	latexmk -c $(EN_TWO)
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*
c1:
	$(XE_COMPILE) $(CN_ONE)
	biber $(CN_ONE)
	$(XE_COMPILE) $(CN_ONE)
	$(XE_COMPILE) $(CN_ONE)
	latexmk -c $(CN_ONE)
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*
c2:
	$(XE_COMPILE) $(CN_TWO)
	biber $(CN_TWO)
	$(XE_COMPILE) $(CN_TWO)
	$(XE_COMPILE) $(CN_TWO)
	latexmk -c $(CN_TWO)
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

e1pdf:
	$(PDF_COMPILE) $(EN_ONE)
	biber $(EN_ONE)
	$(PDF_COMPILE) $(EN_ONE)
	$(PDF_COMPILE) $(EN_ONE)
	latexmk -c $(EN_ONE)
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*
e2pdf:
	$(PDF_COMPILE) $(EN_TWO)
	biber $(EN_TWO)
	$(PDF_COMPILE) $(EN_TWO)
	$(PDF_COMPILE) $(EN_TWO)
	latexmk -c $(EN_TWO)
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*
c1pdf:
	$(PDF_COMPILE) $(CN_ONE)
	biber $(CN_ONE)
	$(PDF_COMPILE) $(CN_ONE)
	$(PDF_COMPILE) $(CN_ONE)
	latexmk -c $(CN_ONE)
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*
c2pdf:
	$(PDF_COMPILE) $(CN_TWO)
	biber $(CN_TWO)
	$(PDF_COMPILE) $(CN_TWO)
	$(PDF_COMPILE) $(CN_TWO)
	latexmk -c $(CN_TWO)
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*
