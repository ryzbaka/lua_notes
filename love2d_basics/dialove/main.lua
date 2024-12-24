--dialog test using dialove; kinda clunky might try using https://github.com/tanema/talkies next.
local Dialove = require("libraries/Dialove")
function love.load()
    dialogManager = Dialove.init({})
    dialogManager:show({
        text = "Do you accept?",
        title = "Mordekai",
        options = {
            { 'Option 1', function()
                dialogManager:show("Splendid")
                dialogManager:push("This will be fun.")
            end },
            { 'Option 2', function()
                dialogManager:show("oh...")
                dialogManager:push("How unfortunate.")
            end },
        }
    })
end

function love.keypressed(k)
    if k == 'return' then
        dialogManager:pop()
    elseif k == 'down' then
        dialogManager:changeOption(1)  -- next one
    elseif k == 'up' then
        dialogManager:changeOption(-1) -- previous one
    end
end

function love.update(dt)
    dialogManager:update(dt)
end

function love.draw()
    dialogManager:draw()
end
