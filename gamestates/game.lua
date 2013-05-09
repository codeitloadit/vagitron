module(..., package.seeall)

local game = Gamestate.new()
menu = require('gamestates.menu')

Player = require('actors/player')
player = Player:new(SW/2, SH/2, 30)
    
function game:update(dt)
	player:update(dt)
end

function game:draw()
	player:draw()
end

function game:keypressed(key)
    if key == 'escape' then love.event.push('quit') end
    if key == ' ' then Gamestate.switch(menu) end

   --Debug
   if key == 'x' then
      -- debug.debug()
   end
end

return game