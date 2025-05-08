#!/bin/bash
OUTPUT="resume-$(date -I)"

if [ ! -d "/app/artifacts" ]; then
	mkdir ./artifacts
fi

if [ -f "/app/artifacts/$OUTPUT.pdf" ]; then
	i=1
	while [[ -f "/app/artifacts/${OUTPUT}_${i}.pdf" ]]; do
		let i++
	done
	OUTPUT="resume-$(date -I)_$i"
fi

# Generate PDF
pandoc --pdf-engine=wkhtmltopdf -s -c github-markdown-light.css -f gfm resume.md -o /app/artifacts/$OUTPUT.pdf \
    -V margin-top=10 \
    -V margin-left=10 \
    -V margin-right=10 \
    -V margin-bottom=10

# Generate HTML
pandoc -s -c github-markdown-light.css -f gfm resume.md -o /app/artifacts/index.html

# Copy CSS file to artifacts
cp github-markdown-light.css /app/artifacts/

echo "Generated $OUTPUT.pdf and index.html"
