# Starting with pygame

This is a minimal pygame program:

```
import pygame
from pygame.locals import *

WIDTH = 640
HEIGHT = 480
BGCOLOR = (100, 100, 100)

def main():
    pygame.init()

    screen = pygame.display.set_mode((WIDTH, HEIGHT))
    pygame.display.set_caption('My new game')

    while True:
        for event in pygame.event.get():
            if event.type == QUIT:
                return
            elif event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    pygame.quit()
                    return

        screen.fill(BGCOLOR)
        pygame.display.flip()
    
    
if __name__ == '__main__':
    main()
```

First, we import pygame.  
In the second line, `pygame.locals` contains useful constants like `QUIT`, `KEYDOWN`, `K_ESCAPE`. `from ... import *` allows us to use them directly in our programs, without using the `pygame` prefix (`pygame.QUIT`).

After that we define a few constants: the width and height of the pygame window and its background color.  
You can take not that constants are mostly written in all caps.

We're got at the _main_ part of our program: the `main` function, called at the end of the program, initializes pygame, the game's window and then gets into an infinite loop (`while True:`).  
In the infinite look we keep on checking if the user wants to quit and, otherwise, draw a gray background.
