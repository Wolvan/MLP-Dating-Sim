local oldFont
Console = {
	consoleLines = {}, offset = 0, sizeOverride = nil, fontOverride = nil,
    new = function (self, o) --Create Child function. Override this in your custom menu class only if necessary.
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end,
	
	write = function(self, text)
		print(text)
		table.insert(self.consoleLines, text)
	end,
	
	draw = function (self) --Default draw function. Override this in your custom menu class.
		if self.sizeOverride and self.fontOverride then
			oldFont = love.graphics.getFont()
			love.graphics.setFont(love.graphics.newFont(self.fontOverride, self.sizeOverride))
		elseif self.sizeOverride and not self.fontOverride then
			oldFont = love.graphics.getFont()
			love.graphics.setFont(love.graphics.newFont(self.sizeOverride))
		elseif self.fontOverride and not self.sizeOverride then
			oldFont = love.graphics.getFont()
			love.graphics.setFont(love.graphics.newFont(self.fontOverride, 12))
		end
		local s = ""
		for _,v in pairs(self.consoleLines) do
			s = s..v.."\n"
		end
		love.graphics.printf(s,0,0,love.window.getWidth())
		if oldFont then
			love.graphics.setFont(oldFont)
			oldFont = nil
		end
    end,
	
	update = function (self, dt) --Default update function. Override this in your custom menu class.
		if love.keyboard.isDown("return", "enter") then
			print("This update function is a stub. You should override this in your current menu class.")
		end
	end
}