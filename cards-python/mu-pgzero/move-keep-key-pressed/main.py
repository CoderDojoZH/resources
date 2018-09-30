WIDTH = 640
HEIGHT = 480

bee = Actor('bee')

def update(dt):
    if keyboard.left:
        bee.x -= 100 * dt
    elif keyboard.right:
        bee.x += 100 * dt
    elif keyboard.up:
        bee.y -= 100 * dt
    elif keyboard.down:
        bee.y += 100 * dt

def draw():
    screen.fill((0, 210, 255))
    bee.draw()