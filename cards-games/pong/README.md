# Playing Pong

## Preparing the PDF and PNG files

### Producing the A4 PDF and its PNG preview

- producing the PDF from Scribus with the following custom range:  
  `8,1,6,3,2,7,4,5`
- use `pdfnup` (from the pdfjam package) to put 4 A6 pages on each A4 side:  
  `pdfnup --nup 2x2 --frame false --no-landscape pong-a6-reordered.pdf --outfile pong-a4.pdf`
- for the PNG preview of the A4 version:  
  `convert -background white -alpha remove -resize 300x pong-a4.pdf pong-a4.png`  
  to get `pong-a4-1.png` to `pong-a4-3.png`
