package.path = package.path .. ";../libraries/?.lua;../libraries/?/init.lua"

DEBUG = false

Player = require("Entities.Player")

function love.load()
    -- anim8 = require("anim8") -- Access ../libraries/anim8.lua
    camera = require("camera")
    cam = camera()

    sti = require("sti") -- Access ../libraries/sti/init.lua
    gameMap = sti("maps/test_forest.lua")
    love.graphics.setDefaultFilter("nearest", "nearest")
    player = Player.new()
end

function love.update(dt)
    player:handleMovement(dt)
    cam:lookAt(player.x, player.y)
    -- cam:lookAt(love.mouse:getX(), love.mouse:getY())

    --adjust camera bounds
    local vp_width = love.graphics.getWidth()
    local vp_height = love.graphics.getHeight()

    --left bound
    if cam.x < vp_width / 2 then
        cam.x = vp_width / 2
    end

    --top bound
    if cam.y < vp_height / 2 then
        cam.y = vp_height / 2
    end

    local map_width = gameMap.width * gameMap.tilewidth * 4 -- have to account for scaling
    local map_height = gameMap.height * gameMap.tileheight * 4

    --right bound
    if cam.x > (map_width - vp_width / 2) then
        cam.x = (map_width - vp_width / 2)
    end

    -- bottom bound
    if cam.y > (map_height - vp_height / 2) then
        cam.y = (map_height - vp_height / 2)
    end
end

function love.draw()
    -- this is code for drawing stuff without the camera
    -- gameMap:draw(0, 0, 5, 5) -- Draw the map
    -- player:draw()



    cam:attach()

    love.graphics.push()
    love.graphics.scale(4, 4)
    gameMap:drawLayer(gameMap.layers["grass"])
    gameMap:drawLayer(gameMap.layers["Tile Layer 2"])
    gameMap:drawLayer(gameMap.layers["Tile Layer 3"])
    love.graphics.pop()
    player:draw()

    cam:detach()

    --DEBUG
    if DEBUG then
        love.graphics.print("X: " .. player.x, 0, 0)
        love.graphics.print("Y: " .. player.y, 0, 100)
    end
end
