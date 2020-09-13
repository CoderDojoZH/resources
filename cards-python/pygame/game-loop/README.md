# Create a game loop for Pygame

Mininal game that:

- creates a player,
- drawn as a red square,
- moving right and left…
- … when the arrow keys are pressed. 

## The player

The `player` object is initialized with an initial postion.

It has a `speed` of 100 pixels per seconds but, at the beginning of the game it will stay still, since the `x_velocity` is zero.

It processes the left and right keys and sets then sets the current velocity to the positive or negative speed.

By moving `x_velocity * dt`, the player moves by the given velocity per second, `dt` being the number of seconds elapsed since the last time `move()` has been called (as we see below, it will be a very small number, well below 1).

Finally, it can draw itself by painting a red square at the current position.

## The loop

By entering the `while True` loop, the game starts an infinite loop that will only be interrupted when pygame receives a `QUIT` signal (which will happen when you press the close button at the right top corner of the window with the game).

By calling `clock.tick(60)` we make sure that the loop does not run more than 60 times per second (a maximum of 60 frames per second). We also get the time in milliseconds since the last frame.  
The `dt` variable contains the number of seconds that have elapsed since the last frame: at 60 FPS it will typically be a value close to 0.016.

We will then call the player's functions to get it updated and drawn and, finally, update the display.
