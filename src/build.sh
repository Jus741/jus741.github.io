#!/bin/bash
if [ ! -d "/app/artifacts" ]; then
	mkdir ./artifacts
fi

# Generate PDF with a consistent name
pandoc --pdf-engine=wkhtmltopdf -s -c github-markdown-light.css -f gfm resume.md -o /app/artifacts/resume.pdf \
    -V margin-top=10 \
    -V margin-left=10 \
    -V margin-right=10 \
    -V margin-bottom=10

# Generate HTML
pandoc -s -c github-markdown-light.css -f gfm resume.md -o /app/artifacts/index.html

# Copy CSS file to artifacts
cp github-markdown-light.css /app/artifacts/

echo "Generated resume.pdf and index.html"
