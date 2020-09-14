import pygame
from pygame.locals import *

WIDTH = 640
HEIGHT = 480
BGCOLOR = (100, 100, 100)

class Flower:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.image = pygame.image.load('flower-150.png')

    def update(self):
        pass

    def draw(self, screen):
        screen.blit(self.image, (self.x, self.y))

class Game:
    def __init__(self):
        self.playing = True
        pygame.init()

        self.screen = pygame.display.set_mode((WIDTH, HEIGHT))
        pygame.display.set_caption('My new game')

        self.flower = Flower(200, 330)
        
    def update(self):
        pass
    
    def draw(self):
        self.screen.fill(BGCOLOR)
        self.flower.draw(self.screen)
        pygame.display.flip()
    
    def events(self):
        for event in pygame.event.get():
            if event.type == QUIT:
                self.playing = False
            elif event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    pygame.quit()
                    self.playing = False

def main():

    game = Game()
    while game.playing:
        game.update()
        game.draw()
        game.events()
    
if __name__ == '__main__':
    main()

