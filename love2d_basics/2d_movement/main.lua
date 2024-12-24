Player = {
    count = 0
}
Player.__index = Player

function Player.new()
    if (Player.count == 1) then
        --singleton
        error("Cannot create more than 1 instance of player")
    end
    local self = setmetatable({}, Player)
    self.x = 0 + math.random(1, 20)
    self.y = 0 + math.random(1, 20)
    self.radius = 20
    self.speed = 5
    self.sprite = love.graphics.newImage("sprites/p.png")
    Player.count = Player.count + 1
    return self
end

function Player:draw()
    love.graphics.draw(self.sprite, self.x - self.radius, self.y - self.radius, 0, 2, 2)
    -- love.graphics.setColor(1, 0, 0)
    -- love.graphics.circle("fill", self.x, self.y, 10)
    -- love.graphics.setColor(1, 1, 1)
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
    -- player2 = Player.new() -- throws singleton error

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
