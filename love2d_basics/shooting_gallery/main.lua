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
end

function love.update()
    if (targetHit()) then
        target:reposition()
        target:scoreUp()
    end
end

function love.draw()
    love.graphics.print(tostring(target.score), 100, 100)
    target:draw()
end
