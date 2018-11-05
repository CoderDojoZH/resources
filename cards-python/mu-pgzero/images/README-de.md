# Bilder einfügen

Fast alle Spiele brauchen Bilder. Du kannst Bilder für deine Akteure (ein “Actor”) oder als Hintergrund nutzen.

## Ein Actor bilden

Für deine Spiele, stellt PyGame Zero die Klasse names Actor zur Verfügung. Die kannst du mit ein PNG Bild initialisieren: 

```py
bee = Actor('bee')
```

PyGame Zero wird nach `bee.png` (pass auf die Gross- und Kleinbuchstaben auf!) im `images` Verzeichnis (neben deinem Python Programm) suchen.


- flying­bee
  - main.py
  - images
    - bee.png

Damit PyGame Zero die Biene anzeigen kann, rufst du ihre Funktion `draw()` aus der PyGame  `draw()` Funktion auf:

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

Wenn du auf "Play" klickst, sollte in der oberen linken Ecke eine Biene auf einem hellblauen Fenster angezeigt werden.
Wenn das Bild zu groß oder zu klein ist, kannst du es mit einem Bildeditor (z. B. Gimp) ändern.


## Hintergrundbilder einfügen

Auch wenn actors viele nützliche Funktionen / Merkmale, wie zum Beispiel animieren, bewegen und prüfen auf Kollisionen enthalten, 
möchtest du manchmal nur ein "einfaches" Bild zu deinem Spiel hinzufügen. Das kannst du machen, indem du die `blit` ("bit block transfer") 
Funktion verwendest:

```
WIDTH = 640
HEIGHT = 480

bee = Actor('bee')

def update(dt):
    pass

def draw():
    screen.fill((0, 210, 255))
    screen.blit('background', (0, 0))
    bee.draw()
```
Du brauchst eine Datei mit dem Namen `background.png` in deinem `images` Verzeichnis. Wenn du möchtest, dass der Hintergrund das ganze Fenster ausfüllt, 
musst du die Grösse des Hintergrundbildes zu dem des Fensters anpassen. Im obigen Beispiel die Grösse des Fensters ist 640 x 480 Pixel.

## Ressourcen:

- https://openclipart.org/detail/221086/green-hills-and-blue-sky-landscape
