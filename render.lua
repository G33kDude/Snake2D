function love.draw()
	if screen == "playing" then renderBoard()
	elseif screen == "lost" then renderScore()
	elseif screen == "start" then
		setColor("white")
		gfx.printf("Press 1 for lazy,\n2 for easy,\n3 for medium,\n4 for hard, and\n"..controls.menu.." for the keyconfig", 0, screenH2-28, screenW, "center")
	elseif screen == "menu" then renderMenu()
	elseif screen == "paused" then renderPaused()
	else renderError() end
end

function renderPaused()
	renderBoard()
	setColor("black")
	gfx.rectangle("fill", screenW2-75, screenH2-23, 150, 46)
	setColor("white")
	gfx.rectangle("line", screenW2-75, screenH2-23, 150, 46)
	gfx.printf("Game is paused", 0, screenH2-14, screenW, "center")
end

function renderError()
	print("screen error: "..screen)
	setColor("black")
	gfx.rectangle("fill", screenW2-75, screenH2-23, 150, 46)
	setColor("white")
	gfx.rectangle("line", screenW2-75, screenH2-23, 150, 46)
	gfx.printf("There was an error\nof some kind", 0, screenH2-14, screenW, "center")
end

function renderBoard()
	setColor("white")
	gfx.rectangle("line", screenX+2, screenY+2, screenW-5, screenH-5)
	for x,v in pairs(grid) do
		for y,v in pairs(v) do
			if v ~= "" then
				--print("Displaying "..v..x..y)
				setColor(tiles[v].color)
				if tiles[v].type == "circle" then
					gfx.circle("fill", screenX+circleOffset+x*gridSize, screenX+circleOffset+y*gridSize, circleSize, tileSize)
				else
					gfx.rectangle("fill", screenX+squareOffset+x*gridSize, screenX+squareOffset+y*gridSize, tileSize, tileSize)
				end
			end
		end
	end
end

function renderScore()
	renderBoard()
	setColor("black")
	gfx.rectangle("fill", screenW2-75, screenH2-23, 150, 46)
	setColor("white")
	gfx.rectangle("line", screenW2-75, screenH2-23, 150, 46)
	gfx.printf("You lost on "..difficulty.current.."\nwith "..score.." point"..(score == 1 and "" or "s"), 0, screenH2-14, screenW, "center")
end

function renderMenu()
	if menuStage == 1 then
		setColor("white")
		centerText("Press the new key for UP\nCurrent key: "..controls.up)
	elseif menuStage == 2 then
		setColor("white")
		centerText("New UP key: "..controls.up.."\nPress the new key for DOWN\nCurrent key: "..controls.down)
	elseif menuStage == 3 then
		setColor("white")
		centerText("New DOWN key: "..controls.down.."\nPress the new key for LEFT\nCurrent key: "..controls.left)
	elseif menuStage == 4 then
		setColor("white")
		centerText("New LEFT key: "..controls.left.."\nPress the new key for RIGHT\nCurrent key: "..controls.right)
	elseif menuStage == 5 then
		setColor("white")
		centerText("New RIGHT key: "..controls.right.."\nDo you want snake wrapping?\nCurrent: "..(wrap and "Y" or "N"))
	end
end

function centerText(text, color)
	if color == nil then setColor("white")
	else setColor(color) end
	gfx.printf(text, 0, screenH2, screenW, "center")
end

function randomColor()
	local color = math.random(1, 6)
	if color == 1 then color = "red"
	elseif color == 2 then color = "yellow"
	elseif color == 3 then color = "cyan"
	elseif color == 4 then color = "blue"
	elseif color == 5 then color = "purple"
	elseif color == 6 then color = "white"
	--elseif color == 4 then color = "green"
	--elseif color == 5 then color = "black"
	end
	return color
end

function setColor(color)
	if type(color) == "string" then
		if color == "red"        then gfx.setColor(255,0  ,0  ,255)
		elseif color == "yellow" then gfx.setColor(255,255,0  ,255)
		elseif color == "green"  then gfx.setColor(0  ,255,0  ,255)
		elseif color == "cyan"   then gfx.setColor(0  ,255,255,255)
		elseif color == "blue"   then gfx.setColor(0  ,0  ,255,255)
		elseif color == "purple" then gfx.setColor(255,0  ,255,255)
		elseif color == "white"  then gfx.setColor(255,255,255,255)
		elseif color == "black"  then gfx.setColor(0  ,0  ,0  ,255)
		end
	elseif type(color) == "table" then
		gfx.setColor(color.r, color.g, color.b, 255)
	end
end