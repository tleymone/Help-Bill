local objets = {}

-- On créer la clé
objets.key = {}
objets.key.col = nil
objets.key.lig = nil
objets.key.img = love.graphics.newImage("images/key.png")
objets.key.possesive = nil
objets.key.teleport = nil
objets.key.nbPossesive = 0

-- On créer la porte
objets.door = {}
objets.door.col = nil
objets.door.lig = nil
objets.door.img = love.graphics.newImage("images/door.png")
objets.door.imgO = love.graphics.newImage("images/doorO.png")
objets.door.isOpen = nil

-- On créer le transmetteur
objets.transmitter = {}
objets.transmitter.col = nil
objets.transmitter.lig = nil
objets.transmitter.img = love.graphics.newImage("images/transmitter.png")
objets.transmitter.imgO = love.graphics.newImage("images/transmitterO.png")
objets.transmitter.on = nil

-- On créer le recepteur
objets.receiver = {}
objets.receiver.col = nil
objets.receiver.lig = nil
objets.receiver.img = love.graphics.newImage("images/receiver.png")
objets.receiver.imgO = love.graphics.newImage("images/receiverO.png")
objets.receiver.on = nil

--On créer le timer
objets.timer = {}
objets.timer.col = 24
objets.timer.lig = 11
objets.timer.img = love.graphics.newImage("images/timer.png")

--On créer le pic descendant
objets.picfalls = {}
objets.picfalls.vit = nil
function objets.CreatePicfall(pCol, pLig, pNblig, pVit)
   objets.picfall = {}
  objets.picfall.col = pCol
  objets.picfall.ligbase = pLig
  objets.picfall.lig = objets.picfall.ligbase
  objets.picfall.nblig = pNblig
  objets.picfall.vit = pVit
  objets.picfall.img = love.graphics.newImage("images/picfall.png")
  table.insert(objets.picfalls, objets.picfall)
  return objets.picfall
end

  
return objets