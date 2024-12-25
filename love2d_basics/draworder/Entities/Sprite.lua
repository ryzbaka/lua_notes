local Class = require("middleclass")

local Sprite = Class("Sprite")

Sprite.instances = {} -- Still keeping this to hold all sprite instances globally

function Sprite:initialize(x, y, color)
    self.x = x
    self.y = y
    self.color = color
    table.insert(Sprite.instances, self) -- Add the sprite to the global list
end

-- Sorting function
function sortingFunction(el1, el2)
    return el1.y < el2.y -- Sort so lower y values (higher on screen) come first
end

-- Sort instances by Y-coordinate
function Sprite:sortByY()
    table.sort(Sprite.instances, sortingFunction)
end

function Sprite:draw()
    love.graphics.setColor(self.color)
    love.graphics.circle("fill", self.x, self.y, 100)
end

function Sprite:drawAll()
    -- Note: Don't sort here! Sort in the update loop to avoid unnecessary sorting each frame
    for _, instance in ipairs(Sprite.instances) do
        instance:draw()
    end
end

return Sprite
