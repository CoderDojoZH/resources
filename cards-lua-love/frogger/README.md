# Frogger

- read "your first program" for the basic program structure
- read "moving around" to create the frog that moves around
- read "dropping down" to create the cars moving from left to right
- extend the CarList to have multiple lanes
- add the trees
- add the signals and slots to check if the frog is colliding with a car or a tree
- make the frog travel on the tree
- only check for collision if the frog is on the same lane (do not check while it's travelling between lanes)
- the frog should not go out of the screen (max / min the movement)
- in game, keep track of the current lane: set win on top and remove speed on the middle security lane

classes:

- every sprite/asset is a class
  - every sprite has an `init(...)`, `update(dt)`, and `draw()` function that are called from the body of the program (when creeating the new object) and the main `update(dt)` and `draw()` functions
  - in the `{}` class definition define all class variables withan "empty" value. (technically, you don't have to, but just feels so much better)
  - class variables that are tables, must be redefined in the instances, otherwise the table is shared amonst all class instances.
  - if the class variable has a calculated default value, set it in the `init()` function
  - if the flass has values that have to be reset when the game is restarted, set them in `restart()`. you can eventually call `restart()` from the `init()` function.

signals:

- when a sprite/asset does something that might be interesting for somebody else, it emits a signal
- name the signal after the item sending it

todo:
- replace gameOver by gameStop and something  like frogCollide when a car is hit / a boat missed
- find a way to get the signals to go around as little as possible
- find a way not to get he cars and tree to overlap
- find a way to correctly define the grid (from the bottom?)


- the code is getting messy and the paddles have almost the same code: "classes" (to be created), to organize the code
  - Ball for ball
  - Paddle for paddleA and paddleB
  - add the new(), load(), update() and draw() function to each class and call them from the main loop's command
- read "check collision" to make the ball bump back on the paddle
- removing the "bumping" on the left and right borders and stop (ball in the middle) the game instead
- add the init(), start() and stop() functions that puts the ball in the middle and start / top the bouncing
- detect the space and esc key for starting and quitting the game
- show and count the points (as paddle characteristics) with a leftOut and rightOut variable 
- create a separate class for keeping track and showing the score
- show and count the points by using a channel (channels)

## Notes

- classes from http://lua-users.org/wiki/LuaClassesWithMetatable
- other classes and ideas:
  - http://lua-users.org/wiki/ObjectOrientedProgramming
  - https://github.com/andrewmcwatters/lclass (probably the most interesting one)
  - https://github.com/rxi/classic and http://sheepolution.com/learn/book/11
  - https://github.com/torch/class
  - http://lua-users.org/wiki/ObjectOrientationTutorial
  - http://lua-users.org/wiki/ObjectProperties
  - http://lua-users.org/wiki/ClassesAndMethodsExample

- possibly use a non uniform random generation:
  - http://osa1.net/posts/2012-12-19-different-distributions-from-uniform.html
  - https://github.com/deepmind/torch-randomkit

## Inspiration

- animation: https://www.youtube.com/watch?v=P6IpGcHVhe4
