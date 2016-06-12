# Playing Papcman

## Printing on A4

![preview first page](preview/pacman-a4-deCH-0.png)
![preview second page](preview/pacman-a4-deCH-1.png)  

Download this PDF and print it both sides witout any resizing on A4 paper:  

- [A4 pdf Deutsch](https://github.com/CoderDojoZH/resources/raw/master/cards-games/pacman/pacman-a4-deCH.pdf)

## Preparing the PDF and PNG files

### Producing the A4 PDF and its PNG preview

- producing the PDF from Scribus with the following custom range:  
  `8,1,6,3,2,7,4,5`
- use `pdfnup` (from the pdfjam package) to put 4 A6 pages on each A4 side:  
  `pdfnup --nup 2x2 --frame false --no-landscape pacman-a6-reordered-deCH.pdf --outfile pacman-a4-deCH.pdf`
- for the PNG preview of the A4 version:  
  `convert -background white -alpha remove -resize 300x pacman-a4-deCH.pdf pacman-a4-deCH.png`  
  to get `pacman-a4-deCH-1.png` to `pacman-a4-deCH-3.png`
