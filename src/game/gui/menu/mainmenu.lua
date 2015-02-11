newGame = Button:new({
	x1 = (love.window.getWidth() / 2) - (loadImg("menu_button.png"):getWidth() / 2), y1 = 300, borderOverride = 30, text = "New Game", imgOverride = loadImg("menu_button.png"),
	callback = function(self)
		self.visible = false
		loadGame.visible = false
		credits.visible = false
		exitGame.visible = false
		parseDialogue(Variables.Main.InitialDialogueFile)
		Variables.Main.CurrentMenu = "Game"
	end
})
loadGame = Button:new({
	x1 = (love.window.getWidth() / 2) - (loadImg("menu_button.png"):getWidth() / 2), y1 = 400, borderOverride = 30, text = "Load Game", imgOverride = loadImg("menu_button.png"),
	callback = function(self)
		--Stub
	end
})
credits = Button:new({
	x1 = (love.window.getWidth() / 2) - (loadImg("menu_button.png"):getWidth() / 2), y1 = 500, borderOverride = 30, text = "Credits", imgOverride = loadImg("menu_button.png"),
	callback = function(self)
		--Stub
	end
})
exitGame = Button:new({
	x1 = (love.window.getWidth() / 2) - (loadImg("menu_button.png"):getWidth() / 2), y1 = 600, borderOverride = 30, text = "Exit", imgOverride = loadImg("menu_button.png"),
	callback = function(self)
		newGame.visible = false
		loadGame.visible = false
		credits.visible = false
		self.visible = false
		love.event.quit()
	end
})

Menus.MainMenu = Menu:new({
    draw = function(self)
		image = loadImg("Ponyville_Main_Menu.png")
		love.graphics.draw(image,0,0)
		image = loadImg("logo.png")
		love.graphics.draw(image,(love.window.getWidth() / 2) - (loadImg("logo.png"):getWidth() / 2),30)
        --love.graphics.print("Welcome to the Main Menu", 10, 10)
		
    end,
	update = function(self, dt)
		--Stub
	end
})