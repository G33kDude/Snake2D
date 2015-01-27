gameW = 15     -- Game width
gameH = 15     -- Game height
snakeX = 8     -- Starting snake X position
snakeY = 8     -- Starting snake Y position
gridSize = 30  -- Size of the grid squares
tileSize = gridSize-2  -- Size of the tiles (snake bits and pellets)
pelletShape = "circle" -- 'square' or 'circle'
pelletMin = 20 -- Min ticks between pellets
pelletMax = 40 -- Max ticks between pellets
wrap = false   -- Snake wraps around screen
difficulty = {current="medium",lazy=1/5,easy=1/10, medium=1/15, hard=1/20}
controls = {up = "up", down="down", left="left", right="right", menu="f1", pause="return"}

function love.conf(t)
	screenW = gameW * gridSize + 8
	screenH = gameH * gridSize + 8
	t.title = "Snake"         -- The title of the window the game is in (string)
	t.author = "GeekDude"     -- The author of the game (string)
	t.screen.width = screenW  -- The window width (number)
	t.screen.height = screenH -- The window height (number)
end