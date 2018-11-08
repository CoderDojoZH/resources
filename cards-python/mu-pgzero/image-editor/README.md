# Image editor

Document how to:

- crop
- scale
- make the background transparent
- cut out part of the image

On Mac OS X Preview is good enough

Testing:

- [Slate](https://github.com/mitchcurtis/slate/):
  - I need to get Qt 5.12 to compile it
  - Uses the qts compiling tool
  - More geared towards creating tiles and bitmaps for games which is not that bad either
  - qml + cpp
  - i should try the latest windows release
- Photoflare
  - modern c++ and Qt
  - can crop
  - can resize (but a bit clumsy?)
  - color to transparency is there but does not seem to work
    - ok, it works if the color is uniform enough
  - cannot draw a rectangle
- [Pinta](https://github.com/PintaProject/Pinta)
  - not really maintained anymore
  - i need to test it on windows
- [LazPaint](https://github.com/bgrabitmap/lazpaint)
  - the 90s want their look and feel back...
  - to be tested on windows
  - looks very simple, but should / might have the needed features
- [mtPaint](http://mtpaint.sourceforge.net/)
  - can crop and scale
  - transparency: http://mtpaint.sourceforge.net/handbook/en_GB/chap_07.html#SEC51
  - very old look and feel
  - has all the features needed
- [dibuja](https://www.opendesktop.org/p/1129305/)
  - very simple ok looking app
  - no transparency
  - linux only?
- [kolourpaint](https://www.kde.org/applications/graphics/kolourpaint):
  - not sure that there are current windows packages
  - it's not in https://community.kde.org/Windows
- [PhotoQt](https://photoqt.org)
  - more of a photo editor
  - no crop or transparency
- [Qt Image Viewer Example](http://doc.qt.io/qt-5/qtwidgets-widgets-imageviewer-example.html)
  - can be used as an example for adding crop, scale and transparency

Other software:

- MyPaint: for painting your own sprites
- https://imgur.com can do crop and resize
