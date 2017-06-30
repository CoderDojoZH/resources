# usage: scribus -g -py scribus-pdf.py -- love-check-collision-a6-enUS.sla

import os

if scribus.haveDoc():
    filename = os.path.splitext(scribus.getDocName())[0]
    pdf = scribus.PDFfile()
    pdf.file = filename + "-reordered.pdf"
    pdf.pages = [4,1,4,1,2,3,2,3]
    pdf.save()

    os.system("pdfnup --nup 2x2 --frame false --no-landscape " + filename + "-reordered.pdf --outfile " + filename.replace("a6", "a4") + ".pdf")
    os.remove(pdf.file)
else:
    print("No file open");
