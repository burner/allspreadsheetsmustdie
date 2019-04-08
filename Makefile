all: presentation.pdf

epss := $(patsubst %.plantuml,%.eps,$(wildcard *.plantuml))

%.eps: %.plantuml
	java -jar plantuml.jar -v -teps $<

presentation.pdf: presentation.tex $(epss)
	pdflatex presentation.tex
