local anim8 = require("anim8")

Player = {}
Player.__index = Player

function Player.new()
    local self = setmetatable({}, Player)
    self.x = 100
    self.y = 100
    self.speed = 2
    self.animationSpeed = 0.1
    self.spriteSheet = love.graphics.newImage("sprites/Player.png")
    self.grid = anim8.newGrid(32, 32, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
    --define animations
    self.idleAnimation = anim8.newAnimation(self.grid("1-10", 1), self.animationSpeed)
    self.rightAnimation = anim8.newAnimation(self.grid("1-10", 3), self.animationSpeed)
    self.leftAnimation = anim8.newAnimation(self.grid("1-10", 3), self.animationSpeed):flipH()
    -- anim holder
    self.anim = self.idleAnimation
    return self
end

function Player:draw()
    self.anim:draw(self.spriteSheet, self.x, self.y, nil, 5, 5)
end

function Player:moveRight()
    self.x = self.x + self.speed
    self.anim = self.rightAnimation
end

function Player:moveLeft()
    self.x = self.x - self.speed
    self.anim = self.leftAnimation
end

function Player:updateAnimation(dt)
    self.anim:update(dt)
end

return Player
