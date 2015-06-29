SRC = assignment.cls example-assignment.tex

all: example-assignment.pdf example-solution.pdf

example-assignment.pdf: $(SRC)
	pdflatex --jobname=example-assignment "\PassOptionsToClass{nosolution}{assignment}\input{example-assignment}"
	pdflatex --jobname=example-assignment "\PassOptionsToClass{nosolution}{assignment}\input{example-assignment}"

example-solution.pdf: $(SRC)
	pdflatex --jobname=example-solution "\PassOptionsToClass{solution}{assignment}\input{example-assignment}"
	pdflatex --jobname=example-solution "\PassOptionsToClass{solution}{assignment}\input{example-assignment}"

clean:
	rm -f example-assignment.aux example-assignment.log example-assignment.out example-solution.aux example-solution.log example-solution.out
