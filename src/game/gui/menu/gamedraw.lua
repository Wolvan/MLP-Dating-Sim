Menus.Game = Menu:new({
	draw = function(self)
        image = loadImg(DrawVars.BackgroundImg)
		love.graphics.draw(image,0,0)
		image = loadImg(DrawVars.LeftCharImg)
		love.graphics.draw(image,0,0)
		image = loadImg(DrawVars.RightCharImg)
		love.graphics.draw(image,0,0)
    end
})