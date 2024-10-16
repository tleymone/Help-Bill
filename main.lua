io.stdout:setvbuf('no')
--if arg[#arg] == "-debug" then require("mobdebug").start() end

love.graphics.setDefaultFilter("nearest")

myGame = require("game")

function love.load()
  love.window.setTitle("Help Bill !")
  myGame.loadMenus()
end

function love.update(dt)
  myGame.updateMenus(dt)
end

function love.draw()
  myGame.drawMenus()
end