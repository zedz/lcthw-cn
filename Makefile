JUNK_FILES=$(FINAL).* *.aux *.log styles/*.aux
SOURCE=book
WEBSITE=$(USER)@mongrel2.org:/var/www/mongrel2.org/static/
FINAL=book-final

book:
	dexy
	cp Makefile output/
	cp pastie.sty output/
	${MAKE} -C output clean book-final.pdf
	rm -rf output/*.dvi output/*.pdf
	${MAKE} -C output $(FINAL).pdf

draft: $(FINAL).dvi

$(FINAL).dvi:
	cp $(SOURCE).tex $(FINAL).tex
	latex -halt-on-error $(FINAL).tex

html:
	htlatex $(FINAL).tex
	tidy -quiet -ashtml -omit -ic -m $(FINAL).html || true
	
$(FINAL).pdf: $(FINAL).dvi
	dvipdf $(FINAL).dvi

view: $(FINAL).pdf
	evince $(FINAL).pdf

clean:
	rm -rf $(JUNK_FILES)
	find . -name "*.aux" -exec rm {} \;
	rm -rf output

release: clean $(FINAL).pdf draft $(FINAL).pdf sync

sync:
	rsync -vz $(FINAL).pdf $(WEBSITE)/book/LearnCTheHardWay-preview.pdf
	rsync -vz $(FINAL).html $(WEBSITE)/book/LearnCTheHardWay.html
	rsync -vz $(FINAL).css $(FINAL)[0-9]*.html $(WEBSITE)/book/

