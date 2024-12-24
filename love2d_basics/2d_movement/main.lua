Player = {}
Player.__index = Player

function Player.new()
    local self = setmetatable({}, Player)
    self.x = 0
    self.y = 0
    self.radius = 20
    self.speed = 5
    self.sprite = love.graphics.newImage("sprites/p.png")
    return self
end

function Player:draw()
    love.graphics.draw(self.sprite, self.x, self.y, 0, 2, 2)
end

function Player:moveRight()
    self.x = self.x + self.speed
end

function Player:moveLeft()
    self.x = self.x - self.speed
end

function Player:moveUp()
    self.y = self.y - self.speed
end

function Player:moveDown()
    self.y = self.y + self.speed
end

function love.load()
    player = Player.new()

    background_sprite = love.graphics.newImage("sprites/background.png")
end

function love.update(dt)
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
end

function love.draw()
    love.graphics.draw(background_sprite, 0, 0)
    player:draw()
end
