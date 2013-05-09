module(..., package.seeall)
class = require('lib/30log')

Base = class()
function Base:__init(x, y, radius)
    self.x, self.y, self.radius = x, y, radius
    self.tag = 'base'

    self.wedges = {}
	self.wedges[1] = {element = 'fire', color = {240, 56, 56}, angle = 30, amount = 100}
	self.wedges[2] = {element = 'lightning', color = {204, 204, 102}, angle = 90, amount = 100}
	self.wedges[3] = {element = 'earth', color = {15, 240, 128}, angle = 150, amount = 100}
	self.wedges[4] = {element = 'water', color = {15, 128, 240}, angle = 210, amount = 100}
	self.wedges[5] = {element = 'magic', color = {240, 102, 240}, angle = 270, amount = 100}
	self.wedges[6] = {element = 'air', color = {102, 204, 240}, angle = 330, amount = 100}

end

function Base:update(dt)
    
end

function Base:draw()
    g.setColor(240, 240, 240)
    g.circle('line', self.x, self.y, self.radius, 6)

    for i, wedge in ipairs(self.wedges) do
	    a1 = self:getPointAtAngle(wedge.angle + 25, -self.radius * 0.2)
	    a2 = self:getPointAtAngle(wedge.angle - 25, -self.radius * 0.2)
	    a3 = {
	    	x = math.cos(math.rad(60)) * (a1.x - a2.x) - math.sin(math.rad(60)) * (a1.y - a2.y) + a2.x, 
	    	y = math.sin(math.rad(60)) * (a1.x - a2.x) + math.cos(math.rad(60)) * (a1.y - a2.y) + a2.y
	    }
	    g.setColor(wedge.color)
	    g.triangle('fill', a1.x, a1.y, a2.x, a2.y, a3.x, a3.y)

	    g.setColor(240, 240, 240)
	    g.triangle('line', a1.x, a1.y, a2.x, a2.y, a3.x, a3.y)
	end

end

function Base:getPointAtAngle(deg, offset)
	local offset = offset or 0
    local x = self.x + (self.radius + offset) * math.cos(math.rad(deg));
    local y = self.y + (self.radius + offset) * math.sin(math.rad(deg));
    return {x = x, y = y}
end

return Base