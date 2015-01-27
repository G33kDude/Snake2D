function addPellet() -- Adds a pellet to the board
	pelletNum = pelletNum + 1
	local pelletName = "pellet"..pelletNum
	local x,y = randPos()
	print("Putting "..pelletName.." at x"..x.." y"..y)
	pellets[pelletName] = true
	tiles[pelletName] = {color=randomColor(), x=x, y=y, type=pelletShape}
	grid[tiles[pelletName].x][tiles[pelletName].y] = pelletName
	pelletTimer = math.random(pelletMin, pelletMax)
end

function randPos()
	local x,y
	repeat
		x = math.random(1, gameW)
		y = math.random(1, gameH)
		print("Random x"..x.." y"..y)
	until (grid[x][y] == "") -- find an empty spot on the grid
	return x,y
end