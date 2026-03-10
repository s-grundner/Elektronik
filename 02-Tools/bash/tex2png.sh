mkdir tmp
wl-paste | pdflatex -output-directory=./tmp
magick -density 300 ./tmp/texput.pdf -quality 90 texput.png && rm -r tmp
