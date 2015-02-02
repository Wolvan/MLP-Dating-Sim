Menu = {
    new = function (self, o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end,
	
	draw = function (self)
        love.graphics.print("This is default menu text. Please change", 10, 10)
    end
}

Menus = {}