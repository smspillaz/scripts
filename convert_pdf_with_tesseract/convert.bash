#!/bin/sh
PAGES=$2 # set to the number of pages in the PDF
SOURCE=$1 # set to the file name of the PDF
OUTPUT=output.pdf # set to the final output file
RESOLUTION=300 # set to the resolution the scanner used (the higher, the better)

#xpdf-pdfinfo pamphlet-low.pdf | grep Pages: | awk '{print $2}' | tail -n 1

#touch $OUTPUT
for i in `seq 1 $PAGES`; do
    convert -density $RESOLUTION -depth 8 $SOURCE\[$(($i - 1 ))\] page$i.png
#    tesseract page$i.tif >> $OUTPUT
    tesseract page$i.png $OUTPUT$i
    cat $OUTPUT$i.txt >> output.txt
done
