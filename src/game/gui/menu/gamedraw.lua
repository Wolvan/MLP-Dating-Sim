local t = 0
local cb1, cb2, cb3 = Button:new({x1 = 30, y1 = 30, x2 = 500, y2 = 130, borderOverride = 30, visible = false}), Button:new({x1 = 30, y1 = 160, x2 = 500, y2 = 260, borderOverride = 30, visible = false}), Button:new({x1 = 30, y1 = 290, x2 = 500, y2 = 390, borderOverride = 30, visible = false})

local loaded, errMsg, errTxt = false, "", ""

local currentDialogue = 1
local dialogues = {}
local showChoiceButtons = false
local choiceButtons = {}

function parseDialogue(dFile)
	local path = "resources/dialogues/"..dFile..".mlpdsDialogue"
	if love.filesystem.isFile(path) then
		local line = nil
		local tempTable = {}
		dialogues = {}
		for line in love.filesystem.lines(path) do
			if line:starts("CHOICE;") then
				tempTable = line:split(";")
				choiceButtons[tonumber(tempTable[2])] = {tempTable[3]:gsub("\\n", "\n"), tempTable[4]}
			elseif line:starts("SAY;") then
				tempTable = line:split(";")
				local tmp = tempTable[2] or ""
				tmp = tmp:gsub("\\n", "\n")
				table.insert(dialogues, tmp)
			elseif line:starts("LUA;") then
				table.insert(dialogues, line)
			elseif line:starts("CHANGEIMG;") then
				table.insert(dialogues, line)
			elseif line:starts("PARSE;") then
				table.insert(dialogues, line)
			end
		end
		currentDialogue = 1
		if dialogues[#dialogues]:starts("CHANGEIMG;") or dialogues[#dialogues]:starts("LUA;") then table.insert(dialogues, "") end
	else
		print("Cannot load Dialogue File "..dFile..".mlpdsDialogue")
		errTxt = "ERROR: Cannot load Dialogue File "..dFile..".mlpdsDialogue"
		return false
	end
	return true
end

Menus.Game = Menu:new({
	draw = function(self)
		--if not dialogues[currentDialogue] then print(currentDialogue) return end
        if dialogues[currentDialogue]:starts("LUA;") then
			loadstring(dialogues[currentDialogue]:sub(5))()
			currentDialogue = currentDialogue + 1
			if currentDialogue == #dialogues then
				showChoiceButtons = true
			end
		elseif dialogues[currentDialogue]:starts("PARSE;") then
			local tempTable = dialogues[currentDialogue]:split(";")
			parseDialogue(tempTable[2] or "unspecified")
		elseif dialogues[currentDialogue]:starts("CHANGEIMG;") then
			local tempTable = dialogues[currentDialogue]:split(";")
			if tempTable[2] == "LEFT" then
				DrawVars.LeftCharImg = tempTable[3] or ""
			elseif tempTable[2] == "RIGHT" then
				DrawVars.RightCharImg = tempTable[3] or ""
			elseif tempTable[2] == "BACKGROUND" then
				DrawVars.BackgroundImg = tempTable[3] or ""
			end
			currentDialogue = currentDialogue + 1
			if currentDialogue == #dialogues then
				showChoiceButtons = true
			end
		else
			if DrawVars.BackgroundImg ~= "" then
				image = loadImg(DrawVars.BackgroundImg)
				love.graphics.draw(image,0,0)
			end
			love.graphics.setColor(255,255,255)
			if DrawVars.LeftCharImg ~= "" then
				image = loadImg(DrawVars.LeftCharImg)
				love.graphics.draw(image,50,100)
			end
			if DrawVars.RightCharImg ~= "" then
				image = loadImg(DrawVars.RightCharImg)
				love.graphics.draw(image,720,100)
			end
			image = loadImg("round_rectangle.png")
			love.graphics.draw(image,0,520)
			if errTxt ~= "" then text(errTxt) else text(dialogues[currentDialogue]) end
			if showChoiceButtons then
				cb1.text = choiceButtons[1][1]
				cb1.visible = true
				cb1.callback = function(self)
					showChoiceButtons = false
					parseDialogue(choiceButtons[1][2])
				end
				cb2.text = choiceButtons[2][1]
				cb2.visible = true
				cb2.callback = function(self)
					showChoiceButtons = false
					parseDialogue(choiceButtons[2][2])
				end
				cb3.text = choiceButtons[3][1]
				cb3.visible = true
				cb3.callback = function(self)
					showChoiceButtons = false
					parseDialogue(choiceButtons[3][2])
				end
			else
				cb1.visible = false
				cb2.visible = false
				cb3.visible = false
			end
		end
    end,
	update = function(self, dt)
		if love.keyboard.isDown("return", "enter") then
			if t >= 0.1 then
				if showChoiceButtons then return end
				currentDialogue = currentDialogue + 1
				if currentDialogue == #dialogues then
					showChoiceButtons = true
				end
			end
			t = 0
		end
		t = t + dt
	end
})