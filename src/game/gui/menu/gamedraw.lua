local t = 0
Menus.Game = Menu:new({
	draw = function(self)
        image = loadImg(DrawVars.BackgroundImg)
		love.graphics.draw(image,0,0)
		image = loadImg(DrawVars.LeftCharImg)
		love.graphics.draw(image,50,100)
		image = loadImg(DrawVars.RightCharImg)
		love.graphics.draw(image,720,100)
		image = loadImg("round_rectangle.png")
		love.graphics.draw(image,0,520)
		image = loadImg(DrawVars.GameFakeMoney)
		love.graphics.draw(image,1050,0)
		love.graphics.print("Daisy: Wow that's a lot of cash!", 30, 550)
		love.graphics.print("Anon: It's all from pre-orders on this game.", 30, 580)
    end,
	update = function(self, dt)
		-- Do Game Logic here
	end
})