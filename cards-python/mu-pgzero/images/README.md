# Adding images

Almost every game needs images. You can use images for your character (an "actor") or add them as background items.

## Creating an Actor

For your games, PyGame Zero provides the Actor class that can be initialized with a PNG image:

```py
bee = Actor('bee')
```

PyGame Zero will look for the `bee.png` (beware of the upper and lower cases!) in the `images` directory next to your Python program.

- flying­bee
  - main.py
  - images
    - bee.png

To get PyGame Zero to show the bee, you call the `bee` `draw()` function in the PyGame's `draw()` function:

```py
WIDTH = 640
HEIGHT = 480

bee = Actor('bee')

def update(dt):
    pass

def draw():
    screen.fill((0, 210, 255))
    bee.draw()
```

If you click on the "Play" button, you should see a bee in the top left corner of a light blue window.  
If the image is too big or too small, you can resize it an image editor (like Gimp).

## Adding background images

While actors contain some handy features for animating, moving and checking for collisions, sometimes you might simply want to add a "simple" image to your game: you can use the `blit` ("bit block transfer") function for it:

WIDTH = 640
HEIGHT = 480

bee = Actor('bee')

def update(dt):
    pass

def draw():
    screen.fill((0, 210, 255))
    screen.blit('background', (0, 0))
    bee.draw()

You need a file called `background.png` in your `images` directory. If you want the background to the fill the window you will need to resize it to the window size: in the example above it's 640 x 480 pixels.

## Resources:

- https://openclipart.org/detail/221086/green-hills-and-blue-sky-landscape
