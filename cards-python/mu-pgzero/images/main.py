WIDTH = 640
HEIGHT = 480

bee = Actor('bee')

def update(dt):
    pass

def draw():
    screen.fill((0, 210, 255))
    screen.blit('background', (0, 0))
    bee.draw()