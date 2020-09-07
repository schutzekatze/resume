resume.pdf: resume.html
	wkhtmltopdf -s A4 -B 0 -T 0 -L 0 -R 0 $< $@

clean:
	rm -f resume.pdf

.PHONY: clean
