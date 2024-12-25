Sprite = require("Entities.Sprite")


Player = Sprite:subclass("Player")

function Player:initialize(x, y, color)
    Sprite.initialize(self, x, y, color)
end

function Player:moveUp()
    self.y = self.y - 5
end

function Player:moveLeft()
    self.x = self.x - 5
end

function Player:moveDown()
    self.y = self.y + 5
end

function Player:moveRight()
    self.x = self.x + 5
end

function Player:handleMovement()
    if love.keyboard.isDown("w") then
        self:moveUp()
    end
    if love.keyboard.isDown("a") then
        self:moveLeft()
    end
    if love.keyboard.isDown("s") then
        self:moveDown()
    end
    if love.keyboard.isDown("d") then
        self:moveRight()
    end
end

return Player
