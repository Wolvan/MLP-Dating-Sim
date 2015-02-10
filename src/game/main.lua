--[[
	
	L�VE Main File
	Basic game initiation and file loading
	
]]--

function initWindow()
	love.graphics.setFont(loadFont("Equestria.otf", 24));
    love.graphics.setBackgroundColor(255,255,255)
end

function requireFiles()
    require "objects.gamevars.mainvarlist"
    require "objects.misc.functions"
    require "objects.classes.menu"
    require "objects.classes.camera"
    require "objects.classes.button"
    require "objects.classes.console"
    require "gui.menu.mainmenu"
    require "gui.menu.gamedraw"
	require "gui.menu.network"
    require "callbacks.draw"
	require "callbacks.update"
	require "callbacks.mouse"
    --require "callbacks.quit"
    --require "callbacks.focus"
end

function love.load()
    requireFiles()
    initWindow()
end