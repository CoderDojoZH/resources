import pygame
from pygame.locals import *

WIDTH = 640
HEIGHT = 480
BGCOLOR = (240, 248, 255)

class Flower:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.image = pygame.image.load('flower-150.png')
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

    def draw(self, screen):
        screen.blit(self.image, (self.x, self.y))

class Game:
    def __init__(self):
        self.playing = True
        pygame.init()

        self.screen = pygame.display.set_mode((WIDTH, HEIGHT))
        pygame.display.set_caption('Flowers')

        self.flower = Flower(200, 330)
        
    def update(self):
        self.flower.update()
    
    def draw(self):
        self.screen.fill(BGCOLOR)
        self.flower.draw(self.screen)
        pygame.display.flip()
    
    def events(self):
        for event in pygame.event.get():
            if event.type == QUIT:
                self.playing = False
            elif event.type == KEYDOWN and event.key == K_ESCAPE:
                pygame.quit()
                self.playing = False
            else:
                self.flower.events(event)

def main():

    game = Game()
    while game.playing:
        game.update()
        game.draw()
        game.events()
    
if __name__ == '__main__':
    main()

