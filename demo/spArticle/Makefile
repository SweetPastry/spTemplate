EN_ONE = enOnecol
EN_TWO = enTwocol
CN_ONE = cnOnecol
CN_TWO = cnTwocol
TEX_FILE = enOnecol, enTwocol, cnOnecol, cnTwocol

XE_COMPILE = xelatex -interaction=nonstopmode -shell-escape

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
