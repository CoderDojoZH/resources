# Sich bewegen

Du kannst die Pfeiltasten oder andere Tastaturtasten wie `a`, `d`, `w`, `s` verwenden, um ein Actor zu bewegen.


Bevor die `update` und die `draw` Funktion aufgerufen werden, ruft PyGame Zero auch einige “Ereignis-handhabungs-Optionen” auf.

Mit der Funktion `on_key_up` kann geprüft werden, welche Taste gedrückt wurde: 

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
```
Jeder "Actor" wird automatisch auf die Position in der oberen linken Ecke, also auf `(0, 0)`  initialisiert. Wir bewegen die Biene durch Erhöhen oder Verringern der X- und Y-Koordinaten.
