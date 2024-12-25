local Class = require("middleclass")

local Sprite = Class("Sprite")

Sprite.instances = {}

function Sprite:initialize(x, y, color)
    self.x = x
    self.y = y
    self.color = color
    table.insert(Sprite.instances, self)
end

-- maybe add a destructor here to keep the instances table synced

function sortingFunction(el1, el2)
    return el1.y < el2.y -- flickering when - instead of < used
end

function Sprite:sortByY()
    --local instances_copy = { unpack(self.instances) }
    --table.sort(instances_copy, sortingFunction)
    --self.instances = instances_copy
    table.sort(self.instances, sortingFunction)
end

function Sprite:draw()
    love.graphics.setColor(self.color)
    love.graphics.circle("fill", self.x, self.y, 100)
end

function Sprite:drawAll()
    Sprite:sortByY()
    for i, instance in ipairs(Sprite.instances) do
        instance:draw()
    end
end

return Sprite
