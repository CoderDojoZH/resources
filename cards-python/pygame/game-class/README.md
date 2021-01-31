# Creating a Game class

This program is exactly the same as the minimal example, but has four actions encapsulated in `Game` class:

- The _inititalisation_ step in the constructor initizes pygame and the game window.
- The _update_ is in charge of modifying the state of the game (since we only show a gray background there is not state to be change and this function is empty for now).
- _draw_ is in charge of drawing the current state of the game.
- in _events_ we check the events (key presses, mouse clicks, ...) and prepare them for their handling in the next `update()`.

The infinite loop is now replaced by a loop that runs as long as the Game is playing...

First, create the basic structure:

```py
class Game:
    def __init__(self):
        pass

    def update(self):
        pass

    def draw(self):
        pass

    def events(self):
        pass

def main():

    game = Game()
    while game.playing:
        game.update()
        game.draw()
        game.events()

if __name__ == '__main__':
    main()
```

After having parsed the whole file, we start a the `main()` function that creates a `Game` and then enters an _infinite_ loop and keeps on calling the `Game`'s `update()`, `draw()`, and `events()` functions.

It's now time to correctly initialize pygame, the game window and correctly quit the game on Esc by filling in the voids in the `Game` class:

```py
import pygame
from pygame.locals import *

WIDTH = 640
HEIGHT = 480
BGCOLOR = (100, 100, 100)

class Game:
    def __init__(self):
        self.playing = True
        pygame.init()

        self.screen = pygame.display.set_mode((WIDTH, HEIGHT))
        pygame.display.set_caption('My new game')

    def update(self):
        pass

    def draw(self):
        self.screen.fill(BGCOLOR)
        pygame.display.flip()

    def events(self):
        for event in pygame.event.get():
            if event.type == QUIT:
                self.playing = False
            elif event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    pygame.quit()
                    self.playing = False
```

We still don't have anything going on in the game, so the `update()` function is left empty.
