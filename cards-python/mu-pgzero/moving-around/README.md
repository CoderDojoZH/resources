# Moving around

You can use the arrow keys – or other keys like `a`, `d`, `w`, `s` – to move around a character.

Before calling the `update` and `draw` functions, PyGame Zero also calls a few "event handling hooks". The `on_key_up` function can be used to check which key has been pressed:

```
WIDTH = 640
HEIGHT = 480

bee = Actor('bee')

def update(dt):
    pass

def on_key_up(key, mod):
    if key == keys.LEFT:
        bee.x ­= 10
    elif key == keys.RIGHT:
        bee.x += 10
    elif key == keys.UP:
        bee.y ­= 10
    elif key == keys.DOWN:
        bee.y += 10

def draw():
    screen.fill((0, 210, 255))
    bee.draw()

Every "Actor" automatically has a position that is initialized to `(0,0)`, the top left corner. We move the bee around, by increasing or decreasing its x and y coordinates.
