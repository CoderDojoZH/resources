WIDTH = 640
HEIGHT = 480

bee = Actor('bee')

def update(dt):
    pass

def on_key_up(key, mod):
    print(key)
    if key == keys.LEFT:
        bee.x -= 10
    elif key == keys.RIGHT:
        bee.x += 10
    elif key == keys.UP:
        bee.y -= 10
    elif key == keys.DOWN:
        bee.y += 10

def draw():
    screen.fill((0, 210, 255))
    bee.draw()