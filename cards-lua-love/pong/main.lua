-- http://lua-users.org/wiki/LuaClassesWithMetatable
require 'Class'

Ball = {}
local Ball_mt = Class(Ball)

function Ball:new(x, y)
    return setmetatable({
        x = x,
        y = y,
        speed = {x = 0, y = 0},
        direction = {x = 1, y = 1},
        bouncing = false,
        char = '*',
        size = 10
    }, Ball_mt)
end

function Ball:load()
    math.randomseed(os.time()) -- make random non pseudo random
    self.leftOut = false
    self.rightOut = false
    self:init()
end

function Ball:init()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.speed.x = love.math.random(200, 300)
    self.speed.y = love.math.random(200, 300)
    self.direction.x = (love.math.random(0, 1) == 1) and 1 or -1
    self.direction.y = (love.math.random(0, 1) == 1) and 1 or -1
end

function Ball:start()
    self.bouncing = true
end

function Ball:stop()
    self.bouncing = false
    self:init()
end

function Ball:update(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end
    if love.keyboard.isDown(' ', 'space') then
        self:start()
    end

    if not self.bouncing then
        return
    end

    newX = self.x + (self.speed.x * dt * self.direction.x)
    newY = self.y + (self.speed.y * dt * self.direction.y)

    if (newX > (love.graphics.getWidth() - self.size)) then
        self.rightOut = true
        self:stop()
    elseif (newX < 0) then
        self.leftOut = true
        self:stop()
    else
        self.x = newX
    end

    if (newY > (love.graphics.getHeight() - self.size)) or (newY < 0) then
        self.direction.y = self.direction.y * -1
    else 
        self.y = newY
    end
end

function Ball:draw()
    love.graphics.print(self.char, self.x, self.y)
end

function Ball:isColliding(x, y, w, h)
    return
        self.x < x + w and
        x < self.x + self.size and
        self.y < y + h and
        y < self.y + self.size
end

function Ball:invertDirection()
    self.direction.x = self.direction.x * -1
end

Paddle = {}
local Paddle_mt = Class(Paddle)

function Paddle:new(x, y, keyUp, keyDown)
  return setmetatable({
      x = x,
      y = y,
      speed =  250,
      score = 0,
      char =  '|',
      size =  {width = 1, height = 50},
      keyUp = keyUp,
      keyDown = keyDown,
  }, Paddle_mt)
end

function Paddle:load()
end

function Paddle:update(dt)
    if self.y > 0 then
        if love.keyboard.isDown(unpack(self.keyUp)) then
            self.y = self.y - (self.speed * dt)
        end
    end
    if self.y < (love.graphics.getHeight() - self.size.height) then
        if love.keyboard.isDown(unpack(self.keyDown)) then
            self.y = self.y + (self.speed * dt)
        end
    end
end

function Paddle:draw()
    love.graphics.print(self.char, self.x, self.y)
end

function Paddle:scoreAdd()
    self.score = self.score + 1
end

Score = {}
local Score_mt = Class(Score)

function Score:new(x, y)
    return setmetatable({
        x = x,
        y = y,
        score = 0
    }, Score_mt)
end

function Score:draw()
    love.graphics.print(self.score, self.x, self.y)
end

function Score:add()
    self.score = self.score + 1
end


ball = Ball:new()
paddleA = Paddle:new(50, 200, {'q'}, {'a'})
paddleB = Paddle:new(750, 200, {'i'}, {'k'})
scoreA = Score:new(100, 10)
scoreB = Score:new(650, 10)

function love.load(arg)
    love.graphics.setFont(love.graphics.newFont(36))
    ball:load()
    paddleA:load()
    paddleB:load()
end

function love.update(dt)
	ball:update(dt)
    if (ball.leftOut) then
        scoreB:add()
        ball.leftOut = false
    end
    if (ball.rightOut) then
        scoreA:add()
        ball.rightOut = false
    end
    paddleA:update(dt)
    paddleB:update(dt)
    if ball:isColliding(paddleA.x, paddleA.y, paddleA.size.width, paddleA.size.height) then
        ball:invertDirection()
    end
    if ball:isColliding(paddleB.x, paddleB.y, paddleB.size.width, paddleB.size.height) then
        ball:invertDirection()
    end
end

function love.draw()
	ball:draw()
    paddleA:draw()
    paddleB:draw()
    scoreA:draw()
    scoreB:draw()
end
