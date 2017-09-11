star = {x = 10, y = 200, speed = 150, char = '*', width = 10, height = 5}
box = {x = 100, y = 200 , char = '[ ]', width = 10, height = 5}

function isColliding(a, b)
    return
        a.x < b.x + b.width and
        b.x < a.x + a.width and
        a.y < b.y + b.height and
        b.y < a.y + a.height
end

function love.load(arg)
    love.graphics.setFont(love.graphics.newFont(36))
end

function love.update(dt)
    if isColliding(star, box) then
        box.x = box.x + 100
    end

    if love.keyboard.isDown('right', 'd') then
        star.x = star.x + (star.speed * dt)
    end
end

function love.draw()
    love.graphics.print(star.char, star.x, star.y)
    love.graphics.print(box.char, box.x, box.y)
end
