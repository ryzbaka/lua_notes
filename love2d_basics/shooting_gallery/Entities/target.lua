local Target = {}

Target.__index = Target

function Target.new(width, height)
    local self = setmetatable({}, Target)
    self.x = math.random(0, width)
    self.y = math.random(0, height)
    self.radius = 70
    self.score = 0
    return self
end

function Target.draw(self)
    love.graphics.circle("fill", self.x, self.y, self.radius)
end

function Target.reposition(self)
    self.x = math.random(0, love.graphics.getWidth())
    self.y = math.random(0, love.graphics.getHeight())
end

function Target.scoreUp(self)
    self.score = self.score + 1
end

return Target
