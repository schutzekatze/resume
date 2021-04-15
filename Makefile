all: resume.pdf cv.pdf

resume.pdf: content.html
	cp $< $<.resume.html
	sed -i 's~display:[[:space:]]*resume;\?~~g' $<.resume.html
	sed -i 's~display:[[:space:]]*cv;\?~display: none;~g' $<.resume.html
	wkhtmltopdf -s A4 -B 0 -T 0 -L 0 -R 0 $<.resume.html $@
	rm -f $<.resume.html

cv.pdf: content.html
	cp $< $<.cv.html
	sed -i 's~display:[[:space:]]*cv;\?~~g' $<.cv.html
	sed -i 's~display:[[:space:]]*resume;\?~display: none;~g' $<.cv.html
	wkhtmltopdf -s A4 -B 0 -T 0 -L 0 -R 0 $<.cv.html $@
	rm -f $<.cv.html

clean:
	rm -f cv.pdf
	rm -f resume.pdf

.PHONY: clean
