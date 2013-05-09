module(..., package.seeall)
Base = require('actors/base')

Player = Base:extends()
function Player:__init(x, y, radius)
    self.super.__init(self, x, y, radius)
    self.tag = 'player'
end

function Player:update(dt)

end

-- function Player:draw()

-- end


return Player
