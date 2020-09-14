# Events: move your sprite

In order to make a sprite move you need to:

- process the event when the user press an arrow key;
- move the sprite during the update phase.

First you need to add to the `Flower` class an `update()` and an `events()` function.

~~~py
class Flower:
    def __init__(self, x, y):
        # ...
        self.next_movement = (0, 0)

    def update(self):
        if self.next_movement != (0, 0):
            self.x += 10 * self.next_movement[0]
            self.y += 10 * self.next_movement[1]
            self.next_movement = (0, 0)

    def events(self, event):
        if event.type == KEYDOWN:
            if event.key == K_LEFT:
                self.next_movement = (-1, 0)
            elif event.key == K_RIGHT:
                self.next_movement = (1, 0)
~~~

Then you need to call the `Flower`'s `update()` from the `update()` in `Game`.  
And modify the `Game`'s `events()` function to only capture the events it processes and, pass the other ones to the each sprite (in our case, the `Flower`).

~~~py
class Game:
    # ...
    def update(self):
        # ...
        self.flower.update()

    def events(self):
        for event in pygame.event.get():
            # ...
            elif event.type == KEYDOWN and event.key == K_ESCAPE:
                pygame.quit()
                self.playing = False
            else:
                self.flower.events(event)
~~~
