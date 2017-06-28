star = {x = 175, y = 200, speed = 150, char = '*'}

function love.load(arg)
    -- love.graphics.setColor({0, 0, 0})
    -- love.graphics.setBackgroundColor({255,255,255})
    love.graphics.setFont(love.graphics.newFont(36))
end

function love.update(dt)
    if love.keyboard.isDown('left', 'a') then
        star.x = star.x - (star.speed * dt)
    end
    if love.keyboard.isDown('right', 'd') then
        star.x = star.x + (star.speed * dt)
    end
    if love.keyboard.isDown('up', 'w') then
        star.y = star.y - (star.speed * dt)
    end
    if love.keyboard.isDown('down', 's') then
        star.y = star.y + (star.speed * dt)
    end
end

function love.draw()
    love.graphics.print(star.char, star.x, star.y)
end
