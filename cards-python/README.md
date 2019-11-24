# Python for kids


- [mu-editor](https://codewith.mu): education oriented editor / IDE that includes python3 and Pygame Zero
- [Thonny](https://thonny.org): Python IDE for beginners; includes Python3, has a Pygame Zero mode and plays well with venv and pip.
  - venv: tools > preferences > interpreter > alternative python 3 interpreter or virtual environment.
  - pgzero: run > Pygame zero mode.
  - has a debugger

## Pygame Zero

Running Pygame Zero programs without mu-editor and without `pgzrun`:

```py
import pgzrun

WIDTH = 640
HEIGHT = 480

def update(dt):
    pass

def draw():
    pass


pgzrun.go()
```
