local Buttons = {}

Button = {
	
	x1 = 0, y1 = 0, x2 = 1, y2 = 2, visible = true, text = "",
	tablepos = -1,
	
	callback = function(self)
		--stub
	end,
	
	draw = function (self)
		if self.visible then
			love.graphics.setColor( 84, 84, 84, 150 )
			love.graphics.rectangle("fill", self.x1, self.y1, self.x2-self.x1, self.y2-self.y1 )
			love.graphics.setColor( 0,0,0 )
			love.graphics.rectangle("line", self.x1, self.y1, self.x2-self.x1, self.y2-self.y1 )
			love.graphics.setColor(255,255,255)
			love.graphics.printf(self.text, self.x1 + 30, self.y1 + 30, self.x2 - self.x1 - 60, "center")
		end
	end,
	
    new = function (self, o, y_1, x_2, y_2, cb)
        if type(o) == "table" then
			o = o
		elseif type(o) == "number" and type(y_1) == "number" and type(x_2) == "number" and type(y_2) == "number" and type(cb) == "function" then
			o = {
				x1 = o,
				y1 = y_1,
				x2 = x_2,
				y2 = y_2,
				callback = cb
			}
		else
			o = {}
		end
        setmetatable(o, self)
		self.__type = "Button"
        self.__index = self
		o.tablepos = #Buttons
		table.insert(Buttons, o)
        return o
    end,
	destroy = function(self)
		table.remove(Buttons, self.tablepos + 1)
	end
}

function drawButtons()
	table.foreach(Buttons, function(index)
		Buttons[index]:draw()
	end)
end