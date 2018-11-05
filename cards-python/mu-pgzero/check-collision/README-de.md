# Auf Kollision prüfen

Mit der rechten Pfeiltaste machst du eine Schuh-Bewegung: Wenn es den Ball trifft, "springt" der Ball nach rechts.

```py
WIDTH = 640
HEIGHT = 480
shoe = Actor('shoe', (80, 200))
ball = Actor('ball', (230, 200))
def on_key_up(key, mod):
if key == keys.RIGHT:
shoe.x += 10
def update(dt):
if ball.colliderect(shoe):
ball.x += 50
def draw():
screen.fill((255, 255, 153))
shoe.draw()
ball.draw()
```

Wir brauchen zwei Akteure, `schoe` und `ball`, mit entsprechenden Bilder im `image` Verzeichnis. 
Beim Erstellen des Akteurs übergeben wir auch die Breite und Höhe jedes Bildes: In unserem Fall ist die Show 80 Pixel breit und 200 Pixel hoch.


Wir verwenden den `on_key_up`-Hook, um die rechte Pfeiltaste mit der Schuhbewegung zu verbinden.  
In der `update`Funktion prüfen wir, ob der Ball den Schuh berührt (kollidiert). Wenn dies der Fall ist, 
bewegt sich der Ball horizontal um 50 Pixel.

## Ressourcen

- https://openclipart.org/detail/173952/shoe
