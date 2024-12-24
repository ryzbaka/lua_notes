package.path = package.path .. ";../libraries/?.lua;../libraries/?/init.lua"


function love.load()
    anim8 = require("anim8") -- Access ../libraries/anim8.lua
    sti = require("sti")     -- Access ../libraries/sti/init.lua
    gameMap = sti("maps/test_forest.lua")
end

function love.draw()
    love.graphics.push()       -- Save the current coordinate system
    love.graphics.scale(20, 2) -- Scale the map by 2x (adjust as needed)
    gameMap:draw(0, 0, 3, 3)   -- Draw the map
    love.graphics.pop()
end
