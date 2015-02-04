Menus.MainMenu = Menu:new({
    draw = function(self)
		Variables.Main.CurrentMenu = "MainMenu"

		function love.update(dt)
		  if Variables.Main.CurrentMenu == "MainMenu" then
		    if love.keyboard.isDown("return", "enter") then
		      Variables.Main.CurrentMenu = "Game"
		    end
		  else
		    -- do your game logic here
		  end
		end

		function love.draw()
		  if Variables.Main.CurrentMenu == "MainMenu" then
	        image = loadImg(DrawVars.MainMenuBGImg)
			love.graphics.draw(image,0,0)
			image = loadImg(DrawVars.MainMenuLogoImg)
			love.graphics.draw(image,400,50)
		  else
		    -- draw your game here
		    Menus[Variables.Main.CurrentMenu].draw();
		  end
		end
        love.graphics.print("Welcome to the Main Menu", 10, 10)
    end
})