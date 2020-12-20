# Jump and run

Inspiration:

- [Paper Minecraft](https://scratch.mit.edu/projects/10128407/)

## Assets

- [Jump and Run Tileset 24x24](https://opengameart.org/content/jump-and-run-tileset-24x24)

... at the end you might want to replace the downloaded assets but ones that you have drawn yourself...

## Draw a flat ground

- Download an image for the ground
- Show it as an Actor  

  ```py
  grass = Actor('grass', (50, 50))

  def draw():
      grass.draw()
  ```

- If the image is too big, scale it down to a muliple of 8 (8x8, 16x16, 32x32, 64x64, ...) until it's the right size for you.
  Do that by creating version of the image with a `-size` in the name: `grass-64.png`; do not overwrite the original image.
- We probably don't want an actor for every piece of ground : try to `blit` the image.

  ```py
  def draw():
      screen.blit('grass-64', (50, 50))
      grass.draw()
  ```

- Use a loop to draw a as many ground tiles as needed. At the bottom of the screen.

  ```py
	  WIDTH = 1280
	  HEIGHT = 480
	  COLOR_BLUE_SKY = (135, 206, 235)

	  def draw():
	  	screen.fill(COLOR_BLUE_SKY)
	  	for i in range(WIDTH // 64):
	  		screen.blit('grass-64', (i * 64, HEIGHT - 64))
  ```

  It helps if the width and height are a multiple of the tiles.

## Add a player

- Create an actor
- Add left and right movements
- Jump
  - Checking the ground as an actor or by coordinates (depending on how you implemented the ground)
  - <https://www.techwithtim.net/tutorials/game-development-with-python/pygame-tutorial/jumping/>
  - <https://www.geeksforgeeks.org/python-making-an-object-jump-in-pygame/>

## Use a text map to draw the ground

- Use it also for the jump
