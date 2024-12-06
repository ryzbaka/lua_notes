function map(value, a, b, x, y)
    return x + (((value - a) * (y - x)) / (b - a))
end

function love.load()
    -- set window size
    love.window.setMode(500, 500)
end

function love.draw()
    --set the color to red
    love.graphics.setColor(map(50, 0, 255, 0, 1), 0, 0)
    love.graphics.points(250, 250)
end
