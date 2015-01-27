function love.update(dt)
	key = latestKey
	if screen == "playing" then
		if kbd.isDown(key) == true and key == controls.pause then
			screen = "paused"
			print("Player hit the pause key: "..controls.pause)
			return
		else
			if next_time > difficulty[difficulty.current] then
				next_time = 0
				tick()
			end
			next_time = next_time + dt
		end
	else
		if #keyBuffer ~= 0 then key = table.remove(keyBuffer, 1) end
	end
	if screen == "menu" then
		if menuStage == 1 then
			if keyWait(key) == false then return end
			controls.up = key
			menuStage = 2
		end
		if menuStage == 2 then
			if keyWait(key) == false then return end
			controls.down = key
			menuStage = 3
		end
		if menuStage == 3 then
			if keyWait(key) == false then return end
			print("key: "..key)
			controls.left = key
			menuStage = 4
		end
		if menuStage == 4 then
			if keyWait(key) == false then return end
			print("key: "..key)
			controls.right = key
			menuStage = 5
		end
		if menuStage == 5 then
			print(key)
			if keyWait(key) == false then return end
			print("key: "..key)
			if key == "y" then wrap = true
			elseif key == "n" then wrap = false
			else print("wat") return end
			print("blub")
			menuStage = 0
		end
		if menuStage == 0 then
			print("Durl")
			tiles.snake1.direction = controls.up
			screen = "start"
		end
	elseif screen == "paused" then
		if keyWait(controls.pause) == false then return end
		screen = "playing"
	elseif screen == "lost" then return end
end

function tick()
	if #keyBuffer ~= 0 then key = table.remove(keyBuffer, 1) end
	
	if screen == "playing" then
		pelletTimer = pelletTimer - 1
		if pelletTimer == 0 then addPellet() end
		
		if (key == controls.up and tiles.snake1.direction ~= controls.down)
		or (key == controls.down and tiles.snake1.direction ~= controls.up)
		or (key == controls.left and tiles.snake1.direction ~= controls.right)
		or (key == controls.right and tiles.snake1.direction ~= controls.left)
		then tiles.snake1.direction = key end
		
		moveSnake(tiles.snake1.direction)
	end
end

function loseGame()
	screen = "lost"
	gameIsLost = true
	return gameIsLost
end