-- http://lua-users.org/wiki/LuaClassesWithMetatable
require 'Class'

Ball = {}
Ball_mt = Class(Ball)

function Ball:new(scoreChannel)
    return setmetatable({
        x = 0,
        y = 0,
        speed = {x = 0, y = 0},
        direction = {x = 1, y = 1},
        bouncing = false,
        scoreChannel = scoreChannel,
        collisionChannel = nil,
        char = '*',
        size = 10
    }, Ball_mt)
end

function Ball:load()
    if (self.collisionChannel == nil) then
        self.collisionChannel = love.thread.newChannel()
    end
    math.randomseed(os.time()) -- make random non pseudo random
    self:init()
end

function Ball:update(dt)
    if love.keyboard.isDown(' ', 'space') then
        ball:start()
    end

    if not self.bouncing then
        return
    end

    while self.collisionChannel:getCount() > 0 do
        local message = self.collisionChannel:pop()
        if self:isColliding(message.x, message.y, message.width, message.height) then
            self:invertDirection()
        end
    end

    local newX = self.x + (self.speed.x * dt * self.direction.x)
    local newY = self.y + (self.speed.y * dt * self.direction.y)

    if (newX > (love.graphics.getWidth() - self.size)) then
        self.scoreChannel.left:push("+1")
        self:stop()
        return
    elseif (newX < 0) then
        self.scoreChannel.right:push("+1")
        self:stop()
        return
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

function Ball:init()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.speed.x = love.math.random(200, 300)
    self.speed.y = love.math.random(200, 300)
    self.direction.x = (love.math.random(0, 1) == 1) and 1 or -1
    self.direction.y = (love.math.random(0, 1) == 1) and 1 or -1
end

function Ball:getCollisionChannel()
    if (self.collisionChannel == nil) then
        self.collisionChannel = love.thread.newChannel()
    end
    return self.collisionChannel
end

function Ball:start()
    self.bouncing = true
end

function Ball:stop()
    self.bouncing = false
    self:init()
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
Paddle_mt = Class(Paddle)

function Paddle:new(position, keyUp, keyDown, collisionChannel)
  return setmetatable({
      x = position.x,
      y = position.y,
      keyUp = keyUp,
      keyDown = keyDown,
      collisionChannel = collisionChannel,
      speed =  250,
      score = 0,
      char =  '|',
      size =  {width = 1, height = 50}
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

    self.collisionChannel:push({x = self.x, y = self.y, width = self.size.width, height = self.size.height})
end

function Paddle:draw()
    love.graphics.print(self.char, self.x, self.y)
end

function Paddle:scoreAdd()
    self.score = self.score + 1
end

Score = {}
Score_mt = Class(Score)

function Score:new(position)
    return setmetatable({
        x = position.x,
        y = position.y,
        channel = love.thread.newChannel(),
        score = 0
    }, Score_mt)
end

function Score:update(dt)
    if self.channel:pop() ~= nil then
        self.score = self.score + 1
    end
end

function Score:getChannel()
    return self.channel
end

function Score:draw()
    love.graphics.print(self.score, self.x, self.y)
end

scoreA = Score:new({x = 100, y = 10})
scoreB = Score:new({x = 650, y = 10})
ball = Ball:new({left = scoreA:getChannel(), right = scoreB:getChannel()})
ball = Ball:new({left = scoreA:getChannel(), right = scoreB:getChannel()})
paddleA = Paddle:new({x = 50, y = 200}, {'q'}, {'a'}, ball:getCollisionChannel())
paddleB = Paddle:new({x = 750, y = 200}, {'i'}, {'k'}, ball:getCollisionChannel())

function love.load(arg)
    love.graphics.setFont(love.graphics.newFont(36))
    ball:load()
    paddleA:load()
    paddleB:load()
end

function love.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

	ball:update(dt)
    scoreA:update(dt)
    scoreB:update(dt)
    paddleA:update(dt)
    paddleB:update(dt)
end

function love.draw()
	ball:draw()
    paddleA:draw()
    paddleB:draw()
    scoreA:draw()
    scoreB:draw()
end
