# Pong

- read "your first program" for the basic program structure
- read "moving randomly" to create a ball that moves
- read "moving around" to create the paddles that move up and down
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
