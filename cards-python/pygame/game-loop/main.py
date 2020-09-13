import pygame
import sys

pygame.init()
screen = pygame.display.set_mode((800, 600))
clock = pygame.time.Clock()

class Player:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.speed = 100
        self.x_velocity = 0

    def process_keys(self):
        key = pygame.key.get_pressed()
        if key[pygame.K_LEFT]: self.x_velocity = -self.speed
        elif key[pygame.K_RIGHT]: self.x_velocity = self.speed

    def move(self, dt):
        self.x += self.x_velocity * dt

    def draw(self):
        screen.fill((255,0,0),(self.x,self.y,10,10))

player = Player(200, 100)

while True:
    if pygame.event.poll().type == pygame.QUIT:
        pygame.quit();
        sys.exit()

    dt = clock.tick(60)/1000 # limit to 60 FPS.
    screen.fill((255, 255, 255))

    player.process_keys()
    player.move(dt)
    player.draw()

    pygame.display.flip()
