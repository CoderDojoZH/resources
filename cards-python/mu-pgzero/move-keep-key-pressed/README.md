# Moving while key down

You can use the arrow keys – or other keys like `a`, `d`, `w`, `s` – to move a character.  
The character keeps moving, as long as the key is down.

```py
WIDTH = 640
HEIGHT = 480

bee = Actor('bee')

def update(dt):
    if keyboard.left:
        bee.x ­= 100 * dt
    elif keyboard.right:
        bee.x += 100 * dt
    elif keyboard.up:
        bee.y ­= 100 * dt
    elif keyboard.down:
        bee.y += 100 * dt

def draw():
    screen.fill((0, 210, 255))
    bee.draw()
```

Every "Actor" automatically has a position that is initialized to (0,0), the top left corner. We move the bee around, by increasing or decreasing its x and y coordinates.

---

You can easily specify the initial position of an actor:
`bee = Actor('bee', (100, 100))`
Or change it later by setting its `x` and `y`.

---

If you use four if conditions, instead of one if ... elif ...  elif ... elif ..., then you can press the right and down keys at the same time to move the bee diagonally.

