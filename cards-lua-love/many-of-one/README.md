# Many of one

- create an asterisk
- create a list `asterisks`
- get them to snow down

```lua
asterisk = { x = 0, y = 0, speed = 250, character = '*' }
asterisks = {} -- Table of asterisks to be drawn and updated
```


```
function love.update(dt)
    for i, a in ipairs(asterisks) do
        a.y = a.y - (a.speed * dt)

        if a.y < 0 then -- Remove the asterisks when they pass off the screen
            table.remove(asterisks, i)
        end
    end
end
```

```lua
function love.draw()
    for i, drop in ipairs(drops) do
        love.graphics.draw(drop.img, drop.x, drop.y)
    end
    love.graphics.draw(player.img, player.x, player.y)
end
```
