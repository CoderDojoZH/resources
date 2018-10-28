# Check collisions

With the right arrow key, you make a shoe move: when it hits the ball, the ball "jumps" to the right.

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

We need two actors, `shoe` and `ball`, with a matching image in the `images` directory. When creating the actor, we also pass the width and height of each image: in our case, the show is 80 pixels wide and 200 pixels high.

We use the `on_key_up` hook to bind the right arrow key with the shoe movement.  
In the `update` function, we check if the ball touches (collides) shoe.  If it's the case, the ball moves horizontally by 50 pixels.

## Resources

- https://openclipart.org/detail/173952/shoe
