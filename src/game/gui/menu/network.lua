local ip, port = "localhost", "31325"
local Con = Console:new({sizeOverride = 12})
local socket, tcpClient, msg, errMsg = require("socket"), nil, "", ""
Menus.Network = Menu:new({
    draw = function(self)
		love.graphics.setBackgroundColor(0,0,0)
		Con:draw()
    end,
	update = function(self, dt)
		if not tcpClient then
			Con:write("Starting TCP Socket")
			Con:write("Connecting to "..ip..":"..port)
			tcpClient, errMsg = socket.tcp()
			if tcpClient then
				ret, errMsg = tcpClient:connect(ip, port)
				tcpClient:settimeout(0)
				if ret then
					tcpClient:send("MLPDS_LOGIN")
				else
					Con.write("An Error occured while initializing connection to remote:\n"..errMsg)
				end
			else
				Con.write("An Error occured while creating tcpClient Object:\n"..errMsg)
			end
		else
			msg = tcpClient:receive()
			if not (msg == nil or msg == "") then Con:write(msg) end
		end
	end
})