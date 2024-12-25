package.path = package.path .. ";../libraries/?.lua;../libraries/?/init.lua"

local Talkies = require('talkies')

function love.load()
    death_sound = love.audio.newSource("sounds/death.wav", "stream")
    Talkies.say("Final Decision", "A man walks up to you.")
    Talkies.say("Final Decision", "The man hands you a gun.", {
        options = {
            { "Shoot yourself", function()
                death_sound:play()
                Talkies.say("Suicide", "You die a lonely death...")
            end },
            { "Shoot the man", function()
                Talkies.say("Action", "Nothing happens.")
            end }
        }
    })
end

function love.update(dt)
    Talkies.update(dt)
end

function love.draw()
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    Talkies.draw()
end

function love.keypressed(key)
    if key == "return" then
        Talkies.onAction()
    elseif key == "up" then
        Talkies.prevOption()
    elseif key == "down" then
        Talkies.nextOption()
    end
end
