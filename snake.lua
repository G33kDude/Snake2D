function moveSnake(dir)
	if gameIsLost then return end
	y = tiles.snake1.y
	x = tiles.snake1.x
	
	if dir == nil then return end
	
	if dir == controls.up then y = y - 1
	elseif dir == controls.down then y = y + 1
	elseif dir == controls.left then x = x - 1
	elseif dir == controls.right then x = x +1
	else
		print("Invalid dir: "..dir)
		return
	end
	
	if y > gameH or y < 1 then 
		if wrap == true then
			y = y>0 and y - gameH or gameH + y
		else
			loseGame()
			return
		end
	end
	
	if x > gameW or x < 1 then 
		if wrap == true then
			x = x>0 and x - gameW or gameW + x
		else
			loseGame()
			return
		end
	end
	
	oldX = tiles.snake1.x
	oldY = tiles.snake1.y
	
	if moveTile("snake1",x,y) == true then return end -- If we've run into something then return
	
	for i=2, snakeLen, 1 do
		--print("Looping")
		oldX,oldY = moveTile("snake"..i, oldX, oldY)
	end
end

function eatPellet(pellet)
	print("Snake ate "..pellet)
	grid[tiles[pellet].x][tiles[pellet].y] = ""
	pellets[pellet] = nil
	print("Putting snake"..snakeLen + 1 .." at position x"..tiles["snake"..snakeLen].x.." y"..tiles["snake"..snakeLen].y)
	tiles["snake"..snakeLen+1] = {color="green",x=tiles["snake"..snakeLen].x,y=tiles["snake"..snakeLen].y}
	snakeLen = snakeLen+1
	score = score + 1
end