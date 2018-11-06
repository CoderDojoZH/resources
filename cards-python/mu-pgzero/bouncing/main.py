WIDTH = 640
HEIGHT = 480

ball = Actor('ball', anchor=('left', 'top'))
velocity = {'x': 150, 'y': 150}

def update(dt):
    if ball.x + ball.width >= WIDTH:
        velocity['x'] = -velocity['x']
    if ball.x < 0:
        velocity['x'] = -velocity['x']
    if ball.y + ball.height >= HEIGHT:
        velocity['y'] = -velocity['y']
    if ball.y < 0:
        velocity['y'] = -velocity['y']
    ball.x += velocity['x'] * dt
    ball.y += velocity['y'] * dt

def draw():
    screen.fill((255, 255, 153))
    ball.draw()