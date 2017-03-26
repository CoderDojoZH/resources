# Processing cards

## Producing the PDFs


For the 4 pages cards we must output each page twice:

- producing the PDF from Scribus with the following custom range:  
  `4,1,4,1,2,3,2,3`
- use `pdfnup` (from the pdfjam package) to put 4 A6 pages on each A4 side:  
  `pdfnup --nup 2x2 --frame false --no-landscape cards-a6-reordered.pdf --outfile cards-a4.pdf`


## Notes

- Create a booklet for the Gui > button example (A5 or A6?)
- geometry > RGBCube?
