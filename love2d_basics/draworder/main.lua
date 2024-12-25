package.path = package.path .. ";../libraries/?.lua;../libraries/?/init.lua"

-- modebug = require("mobdebug").start() for zerobrane debugging
Sprite = require("Entities.Sprite")
Player = require("Entities.Player")
lovedebug = require("lovedebug")

function love.load()
    static = Sprite(200, 200, { 1, 0, 1 })
    static2 = Sprite(500, 250, { 1, 0, 1 })
    player = Player(400, 400, { 1, 0, 0 })
end

function love.update()
    -- Call the sort function here to keep the draw order correct
    player:handleMovement()
    Sprite:sortByY() -- Sort all sprites by Y-coordinate after the player moves
end

function love.draw()
    Sprite:drawAll() -- Draw all sprites in the correct order
    love.graphics.print(tostring(love.timer.getFPS()), 0, 100)
end
