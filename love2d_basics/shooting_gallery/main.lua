local Target = require("Entities.target")

function distanceBetween(x1, x2, y1, y2)
    distance = math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
    return distance
end

function targetHit()
    if distanceBetween(love.mouse.getX(), target.x, love.mouse.getY(), target.y) < target.radius then
        return true
    else
        return false
    end
end

function love.load()
    target = Target.new(love.graphics.getWidth(), love.graphics.getHeight())
    beep = love.audio.newSource("sounds/beep.wav", "stream")
end

function love.update()
    if (targetHit()) then
        target:reposition()
        target:scoreUp()
        beep:play()
    end
end

function love.draw()
    love.graphics.setColor(0, 200, 0)
    target:draw()
    love.graphics.print(tostring(target.score), 100, 100, 0, 2)
end
