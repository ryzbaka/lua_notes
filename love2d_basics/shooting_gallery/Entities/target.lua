local Target = {}

Target.__index = Target

function Target.new()
    local self = setmetatable({}, Target)
    self.radius = 70
    self.x = math.random(0, love.graphics.getWidth() - self.radius)
    self.y = math.random(0, love.graphics.getHeight() - self.radius)
    self.score = 0
    return self
end

function Target.draw(self)
    love.graphics.circle("line", self.x, self.y, self.radius)
end

function Target.reposition(self)
    self.x = math.random(0, love.graphics.getWidth() - self.radius)
    self.y = math.random(0, love.graphics.getHeight() - self.radius)
end

function Target.scoreUp(self)
    self.score = self.score + 1
end

return Target
