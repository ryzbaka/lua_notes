-- Add the libraries folder to the package path
package.path = package.path .. ";../libraries/?.lua"
-- adding player
Player = require("Entities.Player")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    player = Player.new()
end

function love.update(dt)
    local isMoving = false
    if love.keyboard.isDown("right") then
        player:moveRight()
        isMoving = true
    end
    if love.keyboard.isDown("left") then
        player:moveLeft()
        isMoving = true
    end

    if not isMoving then
        player.anim = player.idleAnimation
    end
    player:updateAnimation(dt)
end

function love.draw()
    player:draw()
end
