all: presentation.pdf

epss := $(patsubst %.plantuml,%.eps,$(wildcard *.plantuml))

%.eps: %.plantuml
	java -jar plantuml.jar -v -teps $<

presentation.pdf: presentation.tex $(epss) Makefile
	pdflatex presentation.tex
	biber presentation
	pdflatex presentation.tex
	pdflatex presentation.tex
