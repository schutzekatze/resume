all: resume.pdf cv.pdf

resume.pdf: content.html
	wkhtmltopdf -s A4 -B 0 -T 0 -L 0 -R 0 $< $@

cv.pdf: content.html
	cp $< $<.tmp.html
	sed -i 's~display:[[:space:]]*none;\?~~g' $<.tmp.html
	wkhtmltopdf -s A4 -B 0 -T 0 -L 0 -R 0 $<.tmp.html $@
	rm -f $<.tmp.html

clean:
	rm -f cv.pdf
	rm -f resume.pdf

.PHONY: clean
