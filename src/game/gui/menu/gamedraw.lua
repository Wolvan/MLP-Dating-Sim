Menus.Game = Menu:new({
    draw = function(self)
        for k,v in pairs(Maps.TestMap.tiles) do
            for g,h in pairs(v) do
                image = loadImg(h.Texture)
                love.graphics.draw(image,(k-1)* 64,(g-1)*64)
            end
        end
    end
})