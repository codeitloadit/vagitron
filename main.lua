Gamestate = require('lib.hump.gamestate')
menu = require('gamestates.menu')
game = require('gamestates.game')

function love.load()
    g = love.graphics
    keyDown = love.keyboard.isDown

    Gamestate.registerEvents()
    Gamestate.switch(game)
end
