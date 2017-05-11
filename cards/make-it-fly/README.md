# Scratch Cards: Make it Fly

[Scratch cards to make a character fly](scratch.mit.edu/fly) are provided by the Lifelong Kindergarten Group at the MIT Media Lab at <https://scratch.mit.edu/info/cards/>.

This remix gives you cards in A6 format that can be easily and cheaply be printed in Europe and most parts of the World.

## Printing on A4

Download this PDF and print it both sides witout any resizing on A4 paper:  

- [A4 pdf English](https://github.com/CoderDojoZH/resources/raw/master/cards/cards-make-it-fly-a4.pdf)

## The layout file

The cards have been created with Scribus 1.5svn (currently the development version):

- [cards-make-it-fly-a6-enUS.sla](cards-make-it-fly-a6-enUS.sla)

## Preparing the PDF and PNG files

### Producing the A4 PDF and its PNG preview

- producing the PDF from Scribus with the following custom range:  
  `1,3,5,7,4,2,8,6,9,11,13,15,12,10,16,14`
- use `pdfnup` (from the pdfjam package) to put 4 A6 pages on each A4 side:  
  `pdfnup --nup 2x2 --frame false --no-landscape cards-make-it-fly-a6-enUS-reordered.pdf --outfile cards-make-it-fly-a4.pdf`
- for the PNG preview of the A4 version:  
  `convert -background white -alpha remove -resize 300x cards-a4.pdf cards-a4.png`  
  to get `cards-a4-1.png` to `cards-a4-3.png`
