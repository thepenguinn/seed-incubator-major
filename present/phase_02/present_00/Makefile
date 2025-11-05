fast:
	xelatex -halt-on-error -shell-escape present.tex
	viewpdf present.pdf

present:
	xelatex -halt-on-error -shell-escape present.tex
	biber present
	xelatex -halt-on-error -shell-escape present.tex
	viewpdf present.pdf

clean:
	rm present.aux present.bbl present.bcf present.blg present.log present.nav present.out present.pdf present.run.xml present.snm present.toc





.PHONY: present fast
