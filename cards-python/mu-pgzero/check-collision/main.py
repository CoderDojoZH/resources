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