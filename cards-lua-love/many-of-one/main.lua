local dot = { x = 0, y = 0, speed = 250, size = '5', character = 'o' }
local dots = {}

function love.load(arg)
  love.graphics.setFont(love.graphics.newFont(36))
  math.randomseed(os.time())
end

function love.update(dt)
  if love.keyboard.isDown('space', ' ') then
    local new = {
      x = math.random(0, love.graphics.getWidth() - dot.size),
      y = 0,
      speed = dot.speed,
      character = dot.character
    }
    table.insert(dots, new)
  end

  for i, d in ipairs(dots) do
    d.y = d.y + (d.speed * dt)

    if dot.y > love.graphics.getHeight() then
      table.remove(dots, i)
    end
  end
end

function love.draw()
  for i, d in ipairs(dots) do
    love.graphics.print(d.character, d.x, d.y)
  end
end
