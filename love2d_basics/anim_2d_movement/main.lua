-- Add the libraries folder to the package path
package.path = package.path .. ";../libraries/?.lua"
-- adding player
Player = require("Entities.Player")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    player = Player.new()
end

function love.update(dt)
    -- move player and set animation
    player:handleMovement(dt)
    -- ---------------------------------
end

function love.draw()
    player:draw()
end
