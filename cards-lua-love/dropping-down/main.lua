stars = {}
star = {speed = {min = 200, max = 400}, nextDelay = 0, delay = {min = 0.5, max = 1.5}, height = 5, char = '*'}

function love.load(arg)
    love.graphics.setFont(love.graphics.newFont(36))
    math.randomseed(os.time())
end

function love.update(dt)
    if #stars < 4 then
        if star.nextDelay > 0 then
            star.nextDelay = star.nextDelay - dt
        else
            newStar = {
                x = math.random(0, love.graphics.getWidth() - star.height),
                y = 0 - star.height,
                speed = math.random(star.speed.min, star.speed.max),
                char = star.char
            }
            table.insert(stars, newStar)
            star.nextDelay = math.random(star.delay.min, star.delay.max)
        end
    end
    for i, star in ipairs(stars) do
        star.y = star.y + (star.speed * dt)
        if star.y > love.graphics.getHeight() then
            table.remove(stars, i)
        end
    end
end

function love.draw()
    for i, star in ipairs(stars) do
        love.graphics.print(star.char, star.x, star.y)
    end
end

