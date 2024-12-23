function init()
	value = 1
end
function love.load()
	init()
end
function love.draw()
	love.graphics.print("Hello:" .. value,200,200)
end
