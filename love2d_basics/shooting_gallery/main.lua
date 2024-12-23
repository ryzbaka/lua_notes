local Target = require("Entities.target")

function distanceBetween(x1, x2, y1, y2)
    distance = math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
    return distance
end

function targetHit()
    if distanceBetween(love.mouse.getX(), target.x, love.mouse.getY(), target.y) < target.radius then
        return true
    else
        return false
    end
end

function love.load()
    target = Target.new(love.graphics.getWidth(), love.graphics.getHeight())
    beep = love.audio.newSource("sounds/beep.wav", "stream")
    -- Define the shader code
    shaderCode = [[
        extern number time;
        extern number scanlineIntensity;

        vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
        {
            // Fetch the pixel color from the texture
            vec4 pixel = Texel(texture, texture_coords);

            // Create a moving effect by offsetting the texture coordinates based on time
            float move = sin(time * 0.5 + screen_coords.y * 0.05) * 0.02;
            vec2 moved_coords = texture_coords + vec2(move, 0);

            // Apply the scanline effect (simulating horizontal scanlines)
            float scanline = mod(screen_coords.y, 2.0) < 1.0 ? 1.0 : 1.0 - scanlineIntensity;

            // Fetch the pixel color at the moved coordinates and apply the scanline
            pixel = Texel(texture, moved_coords);
            pixel.rgb *= scanline;  // Apply scanline only to RGB channels

            return pixel;
        }
    ]]

    -- Create the shader
    shader = love.graphics.newShader(shaderCode)
    -- Set shader parameters
    shader:send("scanlineIntensity", 0.5)
end

function love.update()
    if (targetHit()) then
        target:reposition()
        target:scoreUp()
        beep:play()
    end
    shader:send("time", love.timer.getTime())
end

function love.draw()
    love.graphics.setShader(shader)
    love.graphics.setColor(0, 200, 0)
    target:draw()
    love.graphics.setShader()
    love.graphics.print(tostring(target.score), 100, 100, 0, 2)
end
