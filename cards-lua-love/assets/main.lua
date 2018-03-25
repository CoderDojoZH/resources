bee = {x = 175, y = 200, img = nil}

function love.load(arg)
    love.graphics.setBackgroundColor({255,255,255,0})
    bee.img = love.graphics.newImage(
        'assets/bee.png'
    )
end

function love.draw()
    love.graphics.draw(
        bee.img,
        bee.x,
        bee.y
    )
end
