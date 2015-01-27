function love.keypressed(newKey)
	if newKey ~= keyBuffer[#keyBuffer] and #keyBuffer < 4 then
		table.insert(keyBuffer, newKey)
	else return end
	
	latestKey = newKey
	if newKey == "escape" then
		love.event.quit()
		return
	end
	
	if screen == "start" then
		if newKey == "1" then difficulty.current = "lazy"
		elseif newKey == "2" then difficulty.current = "easy"
		elseif newKey == "3" then difficulty.current = "medium"
		elseif newKey == "4" then difficulty.current = "hard"
		elseif newKey == controls.menu then
			menuStage = 1
			screen = "menu"
			print("Player hit the menu key: "..controls.menu)
			return
		else return end
		print("Player chose difficulty "..difficulty.current)
		screen = "playing"
		return
	end
end

local keyWaitState = 0
function keyWait(key)
	if keyWaitState == 0 then if kbd.isDown(key) == false then keyWaitState = 1 else return false end end -- if we are waiting for empty, and is empty, then continue
	if keyWaitState == 1 then if kbd.isDown(key) == true  then keyWaitState = 2 else return false end end -- if we are waiting for pressed, and key is pressed, then continue
	if keyWaitState == 2 then if kbd.isDown(key) == false then keyWaitState = 0 else return false end end -- if we are waiting for empty, and key is pressed, then continue
	return true
end