# Instructions: You should pass the name of file and the compress quality
# Usage example: ./compress_pdf_script.sh filename.pdf printer

#From the Ghostscript manual it can be seen that there are several qualities to choose from:

#screen – selects low-resolution output similar to the Acrobat Distiller “Screen Optimized” setting.
#ebook – selects medium-resolution output similar to the Acrobat Distiller “eBook” setting.
#printer – selects output similar to the Acrobat Distiller “Print Optimized” setting.
#prepress – selects output similar to Acrobat Distiller “Prepress Optimized” setting.
#default – selects output intended to be useful across a wide variety of uses, possibly at the expense of a larger output file.

#References
#http://milan.kupcevic.net/ghostscript-ps-pdf/
#http://www.ghostscript.com/doc/9.05/Ps2pdf.htm

#!/bin/bash
file=$1
quality=$2
filebase=$(basename $file .pdf)
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/${quality} -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${filebase}_${quality}.pdf ${filebase}.pdf
