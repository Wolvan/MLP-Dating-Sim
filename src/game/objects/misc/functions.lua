function loadImg(Img)
    if Variables.Main.LoadedImg[Img] == nil then
        Variables.Main.LoadedImg[Img] = love.graphics.newImage("resources/textures/"..Img)
    end
    return Variables.Main.LoadedImg[Img]
end

function loadFont(Font)
    if Variables.Main.LoadedFonts[Font] == nil then
        Variables.Main.LoadedFonts[Font] = love.graphics.newImage("resources/fonts/"..Font)
    end
    return Variables.Main.LoadedFonts[Font]
end

function loadSound(Sound, static)
    local stream = static or "stream"
    if Variables.Main.LoadedSounds[Sound] == nil then
        Variables.Main.LoadedSounds[Sound] = love.audio.newSource("resources/sounds/"..Sound, stream)
    end
    return Variables.Main.LoadedSounds[Sound]
end

function getCamIdByName(name)
    for k,v in pairs(Cameras) do
        if v.Name == name then
            return k
        end
    end
    return -1
end

table.contains = function(tab, elem)
    for _,v in pairs(tab) do
        if v == elem then
            return true
        end
    end
    return false
end