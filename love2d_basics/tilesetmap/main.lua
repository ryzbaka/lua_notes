package.path = package.path .. ";../libraries/?.lua;../libraries/?/init.lua"

DEBUG = false
SCALE = 4

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

function getDistance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function map(x, a, b, c, d)
    return c + (((x - a) * (d - c)) / (b - a))
end

function love.update(dt)
    player:handleMovement(dt)
    local maxDistFromPlayer = 100
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()

    local camOffX = map(love.mouse.getX(), 0, love.graphics.getWidth(), -1 * maxDistFromPlayer, maxDistFromPlayer)
    local camOffY = map(love.mouse.getY(), 0, love.graphics.getHeight(), -1 * maxDistFromPlayer, maxDistFromPlayer)

    -- if getDistance(player.x,player.y,camPosX,camPosY) > then
    --     -- distance from mouse position X to mouse is more than max dist

    -- end

    cam:lookAt(player.x + camOffX, player.y + camOffY)
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

    local map_width = gameMap.width * gameMap.tilewidth * SCALE -- have to account for scaling
    local map_height = gameMap.height * gameMap.tileheight * SCALE

    --right bound
    if cam.x > (map_width - vp_width / 2) then
        cam.x = (map_width - vp_width / 2)
    end

    -- bottom bound
    if cam.y > (map_height - vp_height / 2) then
        cam.y = (map_height - vp_height / 2)
    end
end

function love.keypressed(key)
    if key == "p" then
        DEBUG = not DEBUG
    end
end

function love.draw()
    -- this is code for drawing stuff without the camera
    -- gameMap:draw(0, 0, 5, 5) -- Draw the map
    -- player:draw()



    cam:attach()

    love.graphics.push()
    love.graphics.scale(SCALE, SCALE)
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
        love.graphics.print("mouse X: " .. love.mouse.getX() .. " mouse Y: " .. love.mouse.getY(), 0, 150)
        love.graphics.print("cam X: " .. cam.x .. " cam Y: " .. cam.y, 0, 200)
    end
end
