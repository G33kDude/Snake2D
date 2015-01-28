
require "game"
require "keyboard"
require "snake"
require "render"
require "pellet"
require "tile"

score = 0
-- -15
offset = 0
screenX = 1
screenY = 1
key = ""           -- Latest pressed key
latestKey = ""
gameIsLost = false -- Whether the game has been lost or not
screen = "start"    -- Game screen
pelletTimer = 0    -- How long until the next pellet
snakeLen = 3       -- Default snake length
keyBuffer = {}     -- Key buffer
pellets = {}       -- List of on-screen pellets
pelletNum = 0      -- Unique pellet number
menuStage = 0
--keyWait = 0
score = 0
next_time = 0

min_dt = 1/60

love_timer_sleep = love.timer.sleep -- in s (like >=0.8.0)
if love._version:find("^0%.[0-7]%.") then -- if version < 0.8.0
	love_timer_sleep = function(s) love.timer.sleep(s*1000) end
end

function love.load()
	-- if love.graphics.setMode(screenW, screenH) == false then love.event.quit() end
	renderInit()
	randomInit()
	pelletTimer = math.random(pelletMin, pelletMax)
	loveInit()
	tiles = {}
	gridInit()

	for i=1, snakeLen, 1 do
		print("Putting snake" .. i .. " at position x" .. snakeX .. " y" .. snakeY)
		tiles["snake"..i] = {color="green",x=snakeX,y=snakeY}
		grid[snakeX][snakeY] = "snake"..i
		snakeY = snakeY + 1
	end

	tiles.snake1.direction = controls.up
	tiles.snake1.color = {r=100,g=255,b=100}
end

function renderInit()
	screenW2 = screenW / 2
	screenH2 = screenH / 2
	circleSize = math.floor(tileSize / 2)
	squareOffset = math.ceil((gridSize - tileSize) / 2) + 3 - gridSize
	circleOffset = math.ceil(gridSize / 2) + 3 - gridSize
end

function loveInit()
	gfx = love.graphics
	kbd = love.keyboard
	gfx.setLineWidth(1)
	gfx.setLineStyle("rough")
end

function gridInit()
	grid = {}
	for x = 1, gameW, 1 do
		grid[x] = {}
		for y=1, gameH, 1 do
			grid[x][y] = ""
		end
	end
end

function randomInit()
	math.randomseed(os.time())
	math.random()
	math.random()
	math.random()
end
