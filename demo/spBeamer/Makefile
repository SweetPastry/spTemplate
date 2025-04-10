default:
	xelatex -interaction=nonstopmode -shell-escape dark
	biber dark
	xelatex -interaction=nonstopmode -shell-escape dark
	xelatex -interaction=nonstopmode -shell-escape dark
	latexmk -c dark
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

	xelatex -interaction=nonstopmode -shell-escape light
	biber light
	xelatex -interaction=nonstopmode -shell-escape light
	xelatex -interaction=nonstopmode -shell-escape light
	latexmk -c light
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

pdf:
	pdflatex -interaction=nonstopmode -shell-escape dark
	biber dark
	pdflatex -interaction=nonstopmode -shell-escape dark
	pdflatex -interaction=nonstopmode -shell-escape dark
	latexmk -c dark
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*

	pdflatex -interaction=nonstopmode -shell-escape light
	biber light
	pdflatex -interaction=nonstopmode -shell-escape light
	pdflatex -interaction=nonstopmode -shell-escape light
	latexmk -c light
	@rm -f *.aux *.log *.idx *.ind *.ilg *.thm *.toc *.blg *.bbl *.bcf *.out *.nav *.snm
	@rm -f *.fls *.fdb_latexmk *.run.xml *.synctex.gz *.xdv *~ *.lof *.lot
	@rm -f .metadonnees*