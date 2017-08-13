-- https://love2d.org/wiki/HUMP
Signal = require 'hump.signal'
Class = require "hump.class"

-- round to the closes integer
function roundInt(value)
    return math.floor(value + 0.5);
end

Frog = Class {
    lane = 0,
    x = -100,
    y = -100,
    step = 50,
    speed = 100,
    flowSpeed = 0,
    flowDirection = 0,
    direction = {x = 0, y = 0},
    movement = 0,
    char = '&',
    size = {x = 30, y = 35},
    running = false
}

function Frog:init(lane)
    self.lane = lane

    Signal.register('boatFlow', function(speed, direction) self:boatFlow(speed, direction) end)
    Signal.register('gameSafeLane', function() self:gameSafeLane() end)
    Signal.register('gameStart', function() self:gameStart() end)
    Signal.register('gameRestart', function() self:gameRestart() end)
    Signal.register('gameStop', function() self:gameStop() end)
end

function Frog:load()
end

function Frog:update(dt)
    if not self.running then return end

    if self.flowDirection ~= 0 then
        self.x = self.x + (self.flowDirection * self.flowSpeed * dt)
    end

    if self.movement > 0 then
        local distance = self.speed * dt
        self.movement = self.movement - distance
        if self.direction.x ~= 0 then
            self.x = self.x + (self.direction.x * distance)
        elseif self.direction.y ~= 0 then
            self.flowDirection = 0
            self.flowSpeed = 0
            self.y = self.y + (self.direction.y * distance)
        end
        if self.movement < 1 then
            self.movement = 0
            self.direction.x = 0
            self.direction.y = 0
            self.y = roundInt(self.y / 50) * 50 -- put it on the grid
        end
    else
        if love.keyboard.isDown('left', 'a') then
            self.movement = self.step
            self.direction.x = -1
        elseif love.keyboard.isDown('right', 'd') then
            self.movement = self.step
            self.direction.x = 1
        elseif love.keyboard.isDown('up', 'w') then
            self.movement = self.step
            self.direction.y = -1
            Signal.emit('frogUp')
        elseif love.keyboard.isDown('down', 's') then
            self.movement = self.step
            self.direction.y = 1
            Signal.emit('frogDown')
        end
    end

    self.x = math.min(math.max(self.x, 0), love.graphics.getWidth() - self.size.x)
    -- self.y = math.min(math.max(self.y, 0), love.graphics.getHeight())

    -- frogPosition
    Signal.emit('checkCollision', self.x, self.y, self.size.x, self.size.y)
end

function Frog:draw()
    -- love.graphics.rectangle('line', self.x, self.y, self.size.x, self.size.y)
    -- love.graphics.print(self.char, self.x, self.y)
    love.graphics.print({{0,255,0}, self.char}, self.x, self.y)
end

function Frog:start()
    self.x = roundInt(love.graphics.getWidth() / 50 / 2) * 50
    self.y = self.lane * 50
    self.flowSpeed = 0
    self.flowDirection = 0
    self.direction = {x = 0, y = 0}
    self.movement = 0
    self.running = true
end

function Frog:stop()
    self.running = false
end

function Frog:gameStart()
    self:start()
end

function Frog:gameRestart()
    self:start()
end

function Frog:gameSafeLane()
    self.flowSpeed = 0
    self.flowDirection = 0
end

function Frog:gameStop()
    self:stop()
end

function Frog:boatFlow(speed, direction)
    self.flowSpeed = speed
    self.flowDirection = direction
end

Car = Class {
    x = 0,
    y = 0,
    length = 0,
    direction = 0,
    size = {x = 0, y = 0},
    speed = 100,
    charStart = '˘Ô',
    charFill = '≈',
    charEnd = 'ô>',
    charStartReverse = '<ô',
    charEndReverse = 'Ô˘'
}

function Car:init(y, length, direction)
    self.x = direction == 1 and 0 or love.graphics.getWidth()
    self.y = y
    self.length = length
    self.direction = direction
    self.size = {x = self:getWidth(length), y = 45}

    Signal.register('checkCollision', function(x, y, w, h) self:checkCollision(x, y, w, h) end)
end

function Car:update(dt)
    self.x = self.x + (self.direction * self.speed * dt)
end

function Car:draw(dt)
    -- love.graphics.rectangle('line', self.x, self.y, self.size.x, self.size.y)
    local car = ''
    if self.direction == 1 then
        car = self.charStart..string.rep(self.charFill, self.length)..self.charEnd
    else
        car = self.charStartReverse..string.rep(self.charFill, self.length)..self.charEndReverse
    end
    love.graphics.print(car, self.x, self.y)
end

function Car:checkCollision(x, y, w, h)
    if self.y == y and self:isColliding(x, y, w, h) then
        Signal.emit('gameRestart')
    end
end

function Car:isColliding(x, y, w, h)
    return
        self.x < x + w and
        x < self.x + self.size.x and
        self.y < y + h and
        y < self.y + self.size.y
end

function Car:isOutOfScreen()
    if (self.direction == 1) then
        return self.x > love.graphics.getWidth()
    else
        return self.x < 0
    end
    return false
end

function Car:getWidth(length)
	return 100 + (30 * length)
end

function Car:gameStart()
    self.active = true
end

function Car:gameStop()
    self.active = false
end

CarList = Class {
    lane = 0,
    length = 0,
    direction = 0,
    nextDelay = 0,
    list = nil,
    running = false
}

function CarList:init(lane, length, direction)
    self.lane = lane
    self.length = length
    self.direction = direction
    self.list = {} -- set the list for each instance

    Signal.register('gameStart', function() self:gameStart() end)
    Signal.register('gameStop', function() self:gameStop() end)
end

function CarList:load()
end

function CarList:update(dt)
    if #self.list < 4 then
        if self.nextDelay > 0 then
            self.nextDelay = self.nextDelay - dt
        else
            local car = Car(50 * self.lane, self.length, self.direction)
            table.insert(self.list, car)
            self.nextDelay = math.random(car:getWidth(self.length) / car.speed * 100 , 4 * 100) / 100 -- wait .5 to 1.5 seconds
        end
    end
    for i, car in ipairs(self.list) do
        car:update(dt)
        if car:isOutOfScreen() then
            table.remove(self.list, i)
        end
    end
end

function CarList:draw(dt)
    if self.running then
        for i, car in ipairs(self.list) do
            car:draw()
        end
    end
end

function CarList:gameStart()
    self.running = true
end

function CarList:gameStop()
    self.running = false
end

Boat = Class {
    x = 0,
    y = 0,
    length = 0,
    direction = 0,
    size = {x = 0, y = 0},
    speed = 100,
    charStart = '\\',
    charFill = '_',
    charEnd = '/'
	-- ><(((º>
}

function Boat:init(y, length, direction)
    self.x = direction == 1 and 0 or love.graphics.getWidth()
    self.y = y
    self.length = length
    self.direction = direction
    self.size = {x = self:getWidth(length), y = 45}
end

function Boat:load()
end

function Boat:update(dt)
    self.x = self.x + (self.direction * self.speed * dt)
end

function Boat:draw(dt)
    -- love.graphics.rectangle('line', self.x, self.y, self.size.x, self.size.y)
    love.graphics.print(self.charStart..string.rep(self.charFill, self.length)..self.charEnd, self.x, self.y)
end

function Boat:isColliding(x, y, w, h)
    local collision = 
        self.x < x + w and
        x < self.x + self.size.x and
        self.y < y + h and
        y < self.y + self.size.y

    if collision then
        Signal.emit('boatFlow', self.speed, self.direction)
    end

    return collision
end

function Boat:isOutOfScreen()
    if (self.direction == 1) then
        return self.x > love.graphics.getWidth()
    else
        return self.x < 0
    end
    return false
end

function Boat:getWidth(length)
	return 25 + (20 * length)
    -- self.size.x = 35 + (30 * length)
end

BoatList = Class {
    lane = 0,
    length = 0,
    direction = 0,
    nextDelay = 0,
    list = nil,
    running = false
}

function BoatList:init(lane, length, direction)
    self.lane = lane
    self.length = length
    self.direction = direction
    self.list = {} -- set the list for each instance

    Signal.register('gameStart', function() self:gameStart() end)
    Signal.register('gameStop', function() self:gameStop() end)
    Signal.register('checkCollision', function(x, y, w, h) self:checkCollision(x, y, w, h) end)
end

function BoatList:load()
end

function BoatList:update(dt)
    if #self.list < 4 then
        if self.nextDelay > 0 then
            self.nextDelay = self.nextDelay - dt
        else
            local boat = Boat(50 * self.lane, self.length, self.direction)
            table.insert(self.list, boat)
            self.nextDelay = math.random(.5, 4) -- wait .5 to 1.5 seconds
            self.nextDelay = math.random(boat:getWidth(self.length) / boat.speed * 100 , 4 * 100) / 100 -- wait 0 to 4 seconds
        end
    end
    for i, boat in ipairs(self.list) do
        boat:update(dt)
        if boat:isOutOfScreen() then
            table.remove(self.list, i)
        end
    end
end

function BoatList:draw(dt)
    if self.running then
        for i, boat in ipairs(self.list) do
            boat:draw()
        end
    end
end

function BoatList:gameStart()
    self.running = true
end

function BoatList:gameStop()
    self.running = false
end

function BoatList:checkCollision(x, y, w, h)
    local collision = false
    -- ignore the lane if the boat is not on that lane
    -- print('lane y '..50*self.lane..' y '..y)
    if (50 * self.lane ~= y) then
        return
    end

    for i, boat in ipairs(self.list) do
        if boat:isColliding(x, y, w, h) then
            collision = true
        end
    end

    if not collision then
        Signal.emit('gameRestart')
    end
end

Game = Class {
    running = false,
    score = 0,
    lifes = 3,
    lane = 0,
    text = ''
}

function Game:init()
    -- frogDrawning
    -- frogUberfahren
    -- eher aus der position from frog und keine tasten lesen?
    Signal.register('frogUp', function() self:frogUp() end)
    Signal.register('frogDown', function() self:frogDown() end)
    Signal.register('gameRestart', function() self:gameRestart() end)
end

function Game:update(dt)
    if not self.running then
        self.text = 'press space to start'
        if love.keyboard.isDown('space') then
            self:start()
            Signal.emit('gameStart')
        end
    else
        if self.lane == 0 then
            self.text = 'won! press space for the next level'
            self.running = false
            Signal.emit('gameStop')
        elseif self.lane == 5 then
            Signal.emit('gameSafeLane')
        end
    end
end

function Game:draw()
    love.graphics.print(self.score, 0, 0)
    love.graphics.print(self.lifes, love.graphics.getWidth() - 50, 0)
    if not self.running then
        -- love.graphics.print(self.text, (love.graphics.getWidth() - string.len(self.text)) / 2, love.graphics.getHeight())
        love.graphics.print(self.text, 200, love.graphics.getHeight() / 2)
    end
end

function Game:start()
    self.running = true
    self.lane = 11
end

function Game:stop()
    self.running = false
end

function Game:frogUp()
    self.lane = self.lane - 1
    print('lane '..self.lane)
end

function Game:frogDown()
    self.lane = self.lane + 1
    print('lane '..self.lane)
end

function Game:gameRestart()
    self:start()
end


game = Game()
frog = Frog(11)
lanes = {}
table.insert(lanes, CarList(10, 0, 1))
table.insert(lanes, CarList( 9, 1, -1))
table.insert(lanes, CarList( 8, 0, 1))
table.insert(lanes, CarList( 7, 1, -1))
table.insert(lanes, CarList( 6, 2, 1))

table.insert(lanes, BoatList( 4, 2, 1))
table.insert(lanes, BoatList( 3, 1, -1))
table.insert(lanes, BoatList( 2, 2, 1))
table.insert(lanes, BoatList( 1, 1, -1))

-- should frog and lanes register in game and only game is calle from the main program for update and draw?
-- game:addSprite()

function love.load(arg)
    love.graphics.setFont(love.graphics.newFont(36))
    frog:load()
    for i, carList in ipairs(lanes) do
        carList:load()
    end
end

function love.update(dt)
    game:update(dt)
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

	frog:update(dt)
    for i, lane in ipairs(lanes) do
        lane:update(dt)
    end
end

function love.draw()
    game:draw()
	frog:draw()
    for i, lane in ipairs(lanes) do
        lane:draw()
    end
end
