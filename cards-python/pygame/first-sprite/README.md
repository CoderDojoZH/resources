# Your first sprite

A sprite is an _object_ in your game, most of the time based on a 2D image.

Most sprites have code for:

- drawing themeselves;
- updating their position (or look);
- check for interaction with other game items;

## Creating a class to draw the sprite

We create a simple class that loads an image from a Png file:

- The constructor of the class receives the top left coordinates for the sprite.
- The constructor loads the PNG file into a Python object.
- The `draw()` function receives a screen surface and draws onto it the image at the coordinate `x` and `y`.

```py
class Flower:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.image = pygame.image.load('flower-150.png')

    def draw(self, screen):
        screen.blit(self.image, (self.x, self.y))
```

We can use this sprite in our `Game` by

- modifying the constructor to create the flower and
- getting the `draw()` function to get the draw itself:

```py
class Game:
    def __init__(self):
        # ...
        self.flower = Flower(200, 330)

    # ...

    def draw(self):
        # ...
        self.flower.draw(self.screen)
        # ...
        pygame.display.flip()
```

Three remarks:

- You need to use the existing constructor and `draw()` function in `Game`, and avoid creating a new one.
- The sprites are normally drawn after the background and, of course, must happen before the `flip()` command. And the order of drawing matters: the last drawn sprite will be on top of the others.
- You can add as many sprites as you need by creating multiple classes and you can also create multiple sprites of the same class.

## Resources

- [A flower](https://openclipart.org/detail/66439/flower) from [OpenClipart](https://openclipart.org)
