Menus.MainMenu = Menu:new({
    draw = function(self)
		image = loadImg("Ponyville_Main_Menu.png")
		love.graphics.draw(image,0,0)
		image = loadImg("mlp_logo_Editted.png")
		love.graphics.draw(image,400,50)
        love.graphics.print("Welcome to the Main Menu", 10, 10)
    end,
	update = function(self, dt)
		if love.keyboard.isDown("return", "enter") then
			Variables.Main.CurrentMenu = "Game"
		end
	end
})