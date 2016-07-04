# FEDERAL UNIVERSITY OF UBERLANDA
# Biomedical Engineering Lab
# File: makefile
# Description: makefile for master's thesis
# Author: Fábio Henrique
# Modified by: Andrei Nakagawa


freedom: master_dissertation.tex
	 rm -f *.aux
	 pdflatex master_dissertation.tex
	 makeindex master_dissertation.nlo -s nomencl.ist -o master_dissertation.nls
	 bibtex master_dissertation.aux
	 pdflatex master_dissertation.tex
	 pdflatex master_dissertation.tex
	 rm -f *.aux *.log *.blg *.bbl *.dvi *.ps *.toc *.lot *.lof *.lop *.ilg *.nlo *.nls *.out *.*~
clean:
	rm -f *.aux *.log *.blg *.bbl *.dvi *.ps *.pdf *.toc *.lot *.lof *.lop *.ilg *.nlo *.nls *.out *.*~
