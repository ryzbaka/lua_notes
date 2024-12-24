local anim8 = require("anim8")

Player = {}
Player.__index = Player

function Player.new()
    local self = setmetatable({}, Player)
    self.x = 418
    self.y = 314
    self.speed = 2
    self.animationSpeed = 0.1
    self.spriteSheet = love.graphics.newImage("sprites/Player.png")
    self.grid = anim8.newGrid(32, 32, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
    --define animations
    self.idleAnimation = anim8.newAnimation(self.grid("1-10", 1), self.animationSpeed)
    self.rightAnimation = anim8.newAnimation(self.grid("1-10", 3), self.animationSpeed)
    self.leftAnimation = self.rightAnimation:clone():flipH()
    self.idleAnimationLeft = self.idleAnimation:clone():flipH()
    -- anim holder
    self.anim = self.idleAnimation
    -- movement state
    self.isMoving = false
    self.direction = "right"
    return self
end

function Player:draw()
    self.anim:draw(self.spriteSheet, self.x, self.y, nil, 4, 4, 16, 16) -- here scaling had to be set for both axes to prevent squishing
    if DEBUG then
        love.graphics.circle("line", self.x, self.y, 20)
    end
end

function Player:moveRight()
    self.isMoving = true            -- set state to moving
    self.direction = "right"        -- set movement direction
    self.x = self.x + self.speed    -- move player
    self.anim = self.rightAnimation -- set movement animation
end

function Player:moveLeft()
    self.isMoving = true
    self.direction = "left"
    self.x = self.x - self.speed
    self.anim = self.leftAnimation
end

function Player:moveUp()
    self.isMoving = true
    self.y = self.y - self.speed
    if self.direction == "right" then
        self.anim = self.rightAnimation
    else
        self.anim = self.leftAnimation
    end
end

function Player:moveDown()
    self.isMoving = true
    self.y = self.y + self.speed
    if self.direction == "right" then
        self.anim = self.rightAnimation
    else
        self.anim = self.leftAnimation
    end
end

function Player:handleMovement(dt)
    if love.keyboard.isDown("right") then
        player:moveRight()
    end
    if love.keyboard.isDown("left") then
        player:moveLeft()
    end
    if love.keyboard.isDown("up") then
        player:moveUp()
    end
    if love.keyboard.isDown("down") then
        player:moveDown()
    end
    self:updateAnimation(dt)
end

function Player:updateAnimation(dt)
    if not self.isMoving then -- check if player is not moving this frame to set idle animation
        if self.direction == "right" then
            self.anim = self.idleAnimation
        else -- player last moved left
            self.anim = self.idleAnimationLeft
        end
    end
    self.anim:update(dt)
    self.isMoving = false -- reset movement state tracker
end

return Player
