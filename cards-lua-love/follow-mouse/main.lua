star = {x = 175, y = 200, easing = 95/100, char = '*'}

function love.load(arg)
    love.graphics.setFont(love.graphics.newFont(36))
end

function love.update(dt)
    target = {x = 0, y = 0}
    target.x, target.y = love.mouse.getPosition()

    dx = math.floor(target.x - star.x)
    dy = math.floor(target.y - star.y)

    star.x = star.x + (dx * star.easing * dt)
    star.y = star.y + (dy * star.easing * dt)
end

function love.draw()
    love.graphics.print(star.char, star.x, star.y)
end
