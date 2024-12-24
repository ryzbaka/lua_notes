function DebugConsole()
    if DEBUG then
        love.graphics.print("X: " .. player.x, 0, 0)
        love.graphics.print("Y: " .. player.y, 0, 100)
        love.graphics.print("mouse X: " .. love.mouse.getX() .. " mouse Y: " .. love.mouse.getY(), 0, 150)
        love.graphics.print("cam X: " .. cam.x .. " cam Y: " .. cam.y, 0, 200)
    end
end

return DebugConsole
