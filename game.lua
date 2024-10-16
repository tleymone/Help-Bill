local game = {}

-- Images loading
local imgTiles = {}
imgTiles["2"] = love.graphics.newImage("images/tile1.png")
imgTiles["3"] = love.graphics.newImage("images/tile2.png")

imgPlayer = {}
imgPlayer[1] = love.graphics.newQuad(0, 0, 16, 16, 48, 16)
imgPlayer[2] = love.graphics.newQuad(16, 0, 16, 16, 48, 16)
imgPlayer[3] = love.graphics.newQuad(32, 0, 16, 16, 48, 16)
imgPlayer_sheet = love.graphics.newImage("images/sprite_hero1.png")
imgPlayer_Cur = 1
imgPlayer_rot = 0
imgPlayer_S = 1

imgPlayer2 = {}
imgPlayer2[1] = love.graphics.newQuad(0, 0, 16, 16, 48, 16)
imgPlayer2[2] = love.graphics.newQuad(16, 0, 16, 16, 48, 16)
imgPlayer2[3] = love.graphics.newQuad(32, 0, 16, 16, 48, 16)
imgPlayer2_sheet = love.graphics.newImage("images/sprite_hero2.png")
imgPlayer2_Cur = 1
imgPlayer2_rot = 0
imgPlayer2_S = 1

-- Globals
local bJumpReady

-- Map and levels
local map = {}
local level = {}
local lstSprites = {}

-- Coeurs
local heart = {}

-- Menu
local menus = nil

local dtTime = nil

-- Sons
local sndAmbient = love.audio.newSource("sons/Ambient.wav", "stream")
local sndWin = love.audio.newSource("sons/win.wav", "stream")
local sndLose = love.audio.newSource("sons/lose.wav", "stream")
local sndSelect = love.audio.newSource("sons/select.wav", "static")
local sndJump = love.audio.newSource("sons/jump.wav", "static")
local sndHurt = love.audio.newSource("sons/hurt.wav", "static")
local sndKey = love.audio.newSource("sons/key.wav", "static")
local sndDoor = love.audio.newSource("sons/door.wav", "static")
local sndTeleporteur = love.audio.newSource("sons/teleporteur.wav", "static")
local sndReceiver = love.audio.newSource("sons/receiver.wav", "static")

local niveau = 1

-- Charger les objets
local myObjets = require("objets")

function ChargeNiveau(pNum)
  map = {}
  if pNum == 1 then
    map[1]  = "2222222222222222222222222"
    map[2]  = "1111111111111111111111111"
    map[3]  = "1111111111111111111111111"
    map[4]  = "1111111111111111111111111"
    map[5]  = "1111111111112211111111111"
    map[6]  = "2211111112111112211111111"
    map[7]  = "1112211222111122221111221"
    map[8]  = "2222222222222222222222222"
    map[9]  = "2222222222222222222222222"
    map[10] = "1111111111111111111111111"
    map[11] = "1111111111111111111111111"
    map[12] = "2222222222222222222222222"
    map[13] = "1111111111111111111111111"
    map[14] = "1111111111111111111111111"
    map[15] = "1111111111111111111111111"
    map[16] = "2211111111111111111233322"
    map[17] = "1111111112211111112222222"
    map[18] = "1112111122221111222222222"
    map[19] = "2222222222222222222222222"
    map[20] = "2222222222222222222222222"
    level = {}
    level.playerStart = {}
    level.playerStart.col = 3
    level.playerStart.lig = 7
    level.player2Start = {}
    level.player2Start.col = 6
    level.player2Start.lig = 18
    
    --position objets
    myObjets.key.col = 24
    myObjets.key.lig = 15
    myObjets.door.col = 1
    myObjets.door.lig = 5
    myObjets.transmitter.col = 1
    myObjets.transmitter.lig = 18
    myObjets.receiver.col = 21
    myObjets.receiver.lig = 7
    local i
    for i=#myObjets.picfalls, 1, -1 do
      table.remove(myObjets.picfalls, i)
    end
    --myObjets.picfall.col = 12
    --myObjets.picfall.ligbase = 2
   -- myObjets.picfall.lig = myObjets.picfall.ligbase
   -- myObjets.picfall.nblig = 8
    myObjets.CreatePicfall(12, 2, 8, 1.5)
    
  elseif pNum == 2 then
    map[1]  = "2222222222222222222222222"
    map[2]  = "1111111111111111111111111"
    map[3]  = "1111111111111111111111111"
    map[4]  = "1111111111111111111111111"
    map[5]  = "1111122221111111111112211"
    map[6]  = "1111222221111221111122211"
    map[7]  = "1112222223333222221111111"
    map[8]  = "2222222222222222222222222"
    map[9]  = "2222222222222222222222222"
    map[10] = "1111111111111111111111111"
    map[11] = "1111111111111111111111111"
    map[12] = "2222222222222222222222222"
    map[13] = "1111111111111111111111111"
    map[14] = "1111111111111111111111111"
    map[15] = "2211111111311113111111111"
    map[16] = "1111222222222222221111122"
    map[17] = "1111111111111111111112222"
    map[18] = "2222222222222221111222222"
    map[19] = "2222222222222222332222222"
    map[20] = "2222222222222222222222222"
    level = {}
    level.playerStart = {}
    level.playerStart.col = 2
    level.playerStart.lig = 7
    level.player2Start = {}
    level.player2Start.col = 1
    level.player2Start.lig = 14
    
    --position objets
    myObjets.key.col = 24
    myObjets.key.lig = 15
    myObjets.door.col = 23
    myObjets.door.lig = 4
    myObjets.transmitter.col = 1
    myObjets.transmitter.lig = 17
    myObjets.receiver.col = 23
    myObjets.receiver.lig = 7
    local i
    for i=#myObjets.picfalls, 1, -1 do
      table.remove(myObjets.picfalls, i)
    end
    
  elseif pNum == 3 then
    map[1]  = "2222222222222222222222222"
    map[2]  = "1111111111111111111111112"
    map[3]  = "1111222222222222221132222"
    map[4]  = "1111111111111111113121111"
    map[5]  = "2221111111111111112111111"
    map[6]  = "1111111111111111111111111"
    map[7]  = "1111223333333333332223333"
    map[8]  = "2222222222222222222222222"
    map[9]  = "2222222222222222222222222"
    map[10] = "1111111111111111111111111"
    map[11] = "1111111111111111111111111"
    map[12] = "2222222222222222222222222"
    map[13] = "1111111111111111111111111"
    map[14] = "1111111111111111111111111"
    map[15] = "1111122222221111111111211"
    map[16] = "1111222222221111111112211"
    map[17] = "1112222222222333333322211"
    map[18] = "2222222222222222222222222"
    map[19] = "2222222222222222222222222"
    map[20] = "2222222222222222222222222"
    level = {}
    level.playerStart = {}
    level.playerStart.col = 2
    level.playerStart.lig = 7
    level.player2Start = {}
    level.player2Start.col = 2
    level.player2Start.lig = 17
    
    --position objets
    myObjets.key.col = 22
    myObjets.key.lig = 15
    myObjets.door.col = 20
    myObjets.door.lig = 6
    myObjets.transmitter.col = 24
    myObjets.transmitter.lig = 17
    myObjets.receiver.col = 11
    myObjets.receiver.lig = 2
    local i
    for i=#myObjets.picfalls, 1, -1 do
      table.remove(myObjets.picfalls, i)
    end
    
  elseif pNum == 4 then
    map[1]  = "2222222222222222222222222"
    map[2]  = "1111111111111111111111111"
    map[3]  = "1111222222111111111111111"
    map[4]  = "1112211112311111111111111"
    map[5]  = "1111211112231111111111111"
    map[6]  = "2111211111122211111111111"
    map[7]  = "1112211111111111331111111"
    map[8]  = "2222222222222222222222222"
    map[9]  = "2222222222222222222222222"
    map[10] = "1111111111111111111111111"
    map[11] = "1111111111111111111111111"
    map[12] = "2222222222222222222222222"
    map[13] = "1111111111111111111111111"
    map[14] = "1111111111111111111111111"
    map[15] = "1111111111112221121111111"
    map[16] = "2221322211122221222111111"
    map[17] = "1111222222222221122221113"
    map[18] = "2222222222222222222222222"
    map[19] = "2222222222222222222222222"
    map[20] = "2222222222222222222222222"
    level = {}
    level.playerStart = {}
    level.playerStart.col = 2
    level.playerStart.lig = 7
    level.player2Start = {}
    level.player2Start.col = 2
    level.player2Start.lig = 17
    
    --position objets
    myObjets.key.col = 24
    myObjets.key.lig = 17
    myObjets.door.col = 8
    myObjets.door.lig = 7
    myObjets.transmitter.col = 16
    myObjets.transmitter.lig = 17
    myObjets.receiver.col = 21
    myObjets.receiver.lig = 7
    local i
    for i=#myObjets.picfalls, 1, -1 do
      table.remove(myObjets.picfalls, i)
    end
   -- myObjets.picfall.col = 9
   -- myObjets.picfall.ligbase = 13
   -- myObjets.picfall.lig = myObjets.picfall.ligbase
   -- myObjets.picfall.nblig = 5
   myObjets.CreatePicfall(9, 13, 5, 1.5)
    
    elseif pNum == 5 then
    map[1]  = "2222222222222222222222222"
    map[2]  = "1111111111111111111111111"
    map[3]  = "1111111111111111111111111"
    map[4]  = "1111111111111111111111111"
    map[5]  = "1111111111111111111111111"
    map[6]  = "1112111111111111111111111"
    map[7]  = "1122111111111111111111111"
    map[8]  = "2222222222222222222222222"
    map[9]  = "2222222222222222222222222"
    map[10] = "1111111111111111111111111"
    map[11] = "1111111111111111111111111"
    map[12] = "2222222222222222222222222"
    map[13] = "1111111111111111111111111"
    map[14] = "1111111111111111111111111"
    map[15] = "1111111111111111111211111"
    map[16] = "2112111111111111112211111"
    map[17] = "1112331111133111122211111"
    map[18] = "2222222222222222222222222"
    map[19] = "2222222222222222222222222"
    map[20] = "2222222222222222222222222"
    level = {}
    level.playerStart = {}
    level.playerStart.col = 2
    level.playerStart.lig = 7
    level.player2Start = {}
    level.player2Start.col = 2
    level.player2Start.lig = 17
    
    --position objets
    myObjets.key.col = 9
    myObjets.key.lig = 17
    myObjets.door.col = 23
    myObjets.door.lig = 7
    myObjets.transmitter.col = 22
    myObjets.transmitter.lig = 17
    myObjets.receiver.col = 21
    myObjets.receiver.lig = 7
    local i
    for i=#myObjets.picfalls, 1, -1 do
      table.remove(myObjets.picfalls, i)
    end
    myObjets.CreatePicfall(6, 2, 6, 1.5)
    myObjets.CreatePicfall(9, 2, 6, 1.5)
    myObjets.CreatePicfall(12, 2, 6, 1.5)
    myObjets.CreatePicfall(15, 2, 6, 1.5)
    myObjets.CreatePicfall(18, 2, 6, 1.5)
    
  elseif pNum == 6 then
    menus = 4
  end
end

function isSolid(pID)
  if pID == "1" then return false end
  if pID == "2" then return true end
  return false
end

function CreeSprite(pType, pX, pY)
  mySprite = {}
  
  mySprite.x = pX
  mySprite.y = pY
  mySprite.vx = 0
  mySprite.vy = 0
  mySprite.type = pType
  mySprite.frame = 0
  mySprite.standing = false
  
  table.insert(lstSprites, mySprite)
  
  return mySprite
end

function game.loadMenus()
  menus = 1
  menu1Load()
  menu2Load()
  menu3Load()
  menuWinload()
  InitGame(niveau)
  
end

function InitGame(pNiveau)
  lstSprites = {}
  ChargeNiveau(pNiveau)
  CreeSprite("player", (level.playerStart.col-1) * 32, (level.playerStart.lig-1) * 32)
  CreeSprite("player2", (level.player2Start.col-1) * 32, (level.player2Start.lig-1) * 32)
  bJumpReady = true
  bJumpReady2 = true
  
  --Init Objects
  myObjets.key.possesive = false
  myObjets.key.teleport = false
  myObjets.key.nbPossesive = 0
  myObjets.door.isOpen = false
  myObjets.transmitter.on = false
  myObjets.receiver.on = false
  
  --sons
  sndLose_playing = false
  sndWin_playing = false
  
end

function menu1Load()
  imgMenu1 = love.graphics.newImage("images/menu1bis.png")
  
  heart.max = 5
  heart.current = 5
  heart.col = 1
  heart.lig = 10
  heart.image = love.graphics.newImage("images/heart.png")
  
  sndSelect:setVolumeLimits(0,0.05)
end

function menu2Load()
  
  sndAmbient:setLooping(true)
  sndAmbient:setVolume(0)
  sndAmbient:setVolumeLimits(0, 0.05)
  sndJump:setVolumeLimits(0, 0.1)
  sndHurt:setVolumeLimits(0, 0.1)
  sndKey:setVolumeLimits(0,0.1)
  sndDoor:setVolumeLimits(0,0.1)
  sndTeleporteur:setVolumeLimits(0,0.05)
  sndTeleporteur:setLooping(true)
  sndReceiver:setVolumeLimits(0,0.05)
  sndReceiver:setLooping(true)

end

function menu3Load()
  imgMenu3 = love.graphics.newImage("images/menu3.png")
  sndLose:setVolumeLimits(0,0.05)
  
end

function menuWinload()
  imgMenuWin = love.graphics.newImage("images/menuWin.png")
  sndWin:setVolumeLimits(0,0.05)
  
end

function updatePlayer(pPlayer, dt)
  -- Locals for Physics
  local accel = 350
  local friction = 100
  local maxSpeed = 150
  local jumpVelocity = -250
  
  --gestion image
  

  -- Friction
  if pPlayer.vx > 0 then
    pPlayer.vx = pPlayer.vx - friction * dt
    if pPlayer.vx < 0 then pPlayer.vx = 0 end
  end
  if pPlayer.vx < 0 then
    pPlayer.vx = pPlayer.vx + friction * dt
    if pPlayer.vx > 0 then pPlayer.vx = 0 end
  end
  -- Keyboard
  if love.keyboard.isDown("right") then
    pPlayer.vx = pPlayer.vx + accel*dt
    if pPlayer.vx > maxSpeed then pPlayer.vx = maxSpeed end
    
    imgPlayer_Cur = imgPlayer_Cur + (10*dt)
    if math.floor(imgPlayer_Cur) >= #imgPlayer then
      imgPlayer_Cur = 1
      imgPlayer_rot = 0
      imgPlayer_S = 1
    end
  end
  
  if love.keyboard.isDown("left") then
    pPlayer.vx = pPlayer.vx - accel*dt
    if pPlayer.vx < -maxSpeed then pPlayer.vx = -maxSpeed end
    
    imgPlayer_Cur = imgPlayer_Cur + (10*dt)
    if math.floor(imgPlayer_Cur) >= #imgPlayer then
      imgPlayer_Cur = 1
      imgPlayer_rot = 1
      imgPlayer_S = -1
    end
  end
  
  if love.keyboard.isDown("left") == false and love.keyboard.isDown("right") == false then
    imgPlayer_Cur = 1
  end
  
  if love.keyboard.isDown("up") and pPlayer.standing and bJumpReady then
    pPlayer.vy = jumpVelocity
    pPlayer.standing = false
    bJumpReady = false
    sndJump:play()
  end
  if love.keyboard.isDown("up") == false and bJumpReady == false then
    bJumpReady = true
  end
  -- Move
  pPlayer.x = pPlayer.x + pPlayer.vx * dt
  pPlayer.y = pPlayer.y + pPlayer.vy * dt
end

function updatePlayer2(pPlayer, dt)
  -- Locals for Physics
  local accel = 350
  local friction = 100
  local maxSpeed = 150
  local jumpVelocity = -250
  -- Friction
  if pPlayer.vx > 0 then
    pPlayer.vx = pPlayer.vx - friction * dt
    if pPlayer.vx < 0 then pPlayer.vx = 0 end
  end
  if pPlayer.vx < 0 then
    pPlayer.vx = pPlayer.vx + friction * dt
    if pPlayer.vx > 0 then pPlayer.vx = 0 end
  end
  -- Keyboard
  if love.keyboard.isDown("right") then
    pPlayer.vx = pPlayer.vx - accel*dt
    if pPlayer.vx > maxSpeed then pPlayer.vx = maxSpeed end
    
    imgPlayer2_Cur = imgPlayer2_Cur + (10*dt)
    if math.floor(imgPlayer2_Cur) >= #imgPlayer2 then
      imgPlayer2_Cur = 1
      imgPlayer2_rot = 1
      imgPlayer2_S = -1
    end
  end
  if love.keyboard.isDown("left") then
    pPlayer.vx = pPlayer.vx + accel*dt
    if pPlayer.vx < -maxSpeed then pPlayer.vx = -maxSpeed end
    
    imgPlayer2_Cur = imgPlayer2_Cur + (10*dt)
    if math.floor(imgPlayer2_Cur) >= #imgPlayer2 then
      imgPlayer2_Cur = 1
      imgPlayer2_rot = 0
      imgPlayer2_S = 1
    end
  end
  
  if love.keyboard.isDown("left") == false and love.keyboard.isDown("right") == false then
    imgPlayer2_Cur = 1
  end
  
  if love.keyboard.isDown("up") and pPlayer.standing and bJumpReady2 then
    pPlayer.vy = jumpVelocity
    pPlayer.standing = false
    bJumpReady2 = false
    sndJump:play()
  end
  if love.keyboard.isDown("up") == false and bJumpReady2 == false then
    bJumpReady2 = true
  end
  -- Move
  pPlayer.x = pPlayer.x + pPlayer.vx * dt
  pPlayer.y = pPlayer.y + pPlayer.vy * dt
end

function getTileAt(pX, pY)
  local col = math.floor(pX / 32) + 1
  local lig = math.floor(pY / 32) + 1
  if col>0 and col<=#map[1] and lig>0 and lig<=#map then
    local id = string.sub(map[lig],col,col)
    return id
  end
  return 0
end

function CollideRight(pSprite)
  local id1 = getTileAt(pSprite.x + 26, pSprite.y + 14)
  local id2 = getTileAt(pSprite.x + 26, pSprite.y + 24)
  return isSolid(id1) or isSolid(id2)
end

function CollideLeft(pSprite)
  local id1 = getTileAt(pSprite.x+6, pSprite.y + 14)
  local id2 = getTileAt(pSprite.x+6, pSprite.y + 24)
  return isSolid(id1) or isSolid(id2)
end

function CollideBellow(pSprite)
  local id1 = getTileAt(pSprite.x + 8, pSprite.y + 32)
  local id2 = getTileAt(pSprite.x + 24, pSprite.y + 32)
  return isSolid(id1) or isSolid(id2)
end

function CollideAbove(pSprite)
  local id1 = getTileAt(pSprite.x + 16, pSprite.y-1)
  local id2 = getTileAt(pSprite.x + 24, pSprite.y-1)
  return isSolid(id1) or isSolid(id2) 
end

function updateSprite(pSprite, dt)
  

  
  -- Locals for Collisions
  local oldX = pSprite.x
  local oldY = pSprite.y

  -- Specific behavior for the player
  if pSprite.type == "player" then
    updatePlayer(pSprite, dt)
  end
  
  if pSprite.type == "player2" then
    updatePlayer2(pSprite, dt)
  end
  
  -- Collision detection
  local collide = false
  local collideR = false
  local collideL = false
  -- On the right
  if pSprite.vx > 0 then
    collideR = CollideRight(pSprite)
  end
  -- On the left
  if pSprite.vx < 0 then
    collideL = CollideLeft(pSprite)
  end
  -- Stop!
  if collideR then
    pSprite.vx = 0
    local col = math.floor((pSprite.x + 16) / 32) + 1
    pSprite.x = (col-1)*32 + 6
  end
  
  if collideL then
    pSprite.vx = 0
    local col = math.floor((pSprite.x + 16) / 32) + 1
    pSprite.x = (col-1)*32 - 6
  end
  
  if pSprite.x<-6 then
    pSprite.vx = 0
    pSprite.x = -5.98
  end
  
  if pSprite.x > love.graphics.getWidth() - 32 +6  then
    pSprite.vx = 0
    pSprite.x = love.graphics.getWidth() - 32 +5.98
  end
  
  -- Above
  if pSprite.vy < 0 then
    collide = CollideAbove(pSprite)
    if collide then
      pSprite.vy = 0
      local lig = math.floor((pSprite.y + 16) / 32) + 1
      pSprite.y = (lig-1)*32
    end
  end
  -- Below
  if pSprite.standing or pSprite.vy > 0 then
    collide = CollideBellow(pSprite)
    if collide then
      pSprite.standing = true
      pSprite.vy = 0
      local lig = math.floor((pSprite.y + 16) / 32) + 1
      pSprite.y = (lig-1)*32
    else
      pSprite.standing = false
    end
  end
  -- Sprite falling
  if pSprite.standing == false then
    pSprite.vy = pSprite.vy + 500 * dt
  end
  
  --collision avec les pics
  local getPic = getTileAt(pSprite.x + 6, pSprite.y + 7)
  if getPic == "3" or getTileAt(pSprite.x+24, pSprite.y + 16) == "3" or getTileAt(pSprite.x+6, pSprite.y + 16) == "3" then
    heart.current = heart.current - 1
    if pSprite.type == "player" or pSprite.type == "player2" then
      sndHurt:play()
      InitGame(niveau)
    end
  end
  
  -- Ramassage de clé
  local colK, ligK = math.floor((pSprite.x + 16) / 32) + 1, math.floor((pSprite.y + 16) / 32) + 1
  if myObjets.key.possesive == false then
    if colK == myObjets.key.col and ligK == myObjets.key.lig and pSprite.type == "player2" then
      myObjets.key.possesive = true
      sndKey:play()
      myObjets.key.nbPossesive = myObjets.key.nbPossesive + 1
    end
  end
  
  -- Ouverture de la porte
  local colD, ligD = math.floor((pSprite.x + 16) / 32) + 1, math.floor((pSprite.y + 16) / 32) + 1
  if myObjets.key.nbPossesive > 0 and myObjets.key.teleport then
    if colD == myObjets.door.col and ligD == myObjets.door.lig then
      myObjets.key.nbPossesive = myObjets.key.nbPossesive - 1
      sndDoor:play()
      myObjets.door.isOpen = true
      --menus = 4
      niveau = niveau + 1
      InitGame(niveau)
    end
  end
  
  --Détection du transmetteur
  local colT, ligT = math.floor((pSprite.x + 16) / 32) + 1, math.floor((pSprite.y + 10) / 32) + 1
  if colT == myObjets.transmitter.col and ligT == myObjets.transmitter.lig or colT == myObjets.transmitter.col +1 and ligT == myObjets.transmitter.lig then
    if myObjets.transmitter.on == false then
      myObjets.transmitter.on = true
      if sndReceiver:isPlaying() == false then
        sndTeleporteur:play()
        end
    end
  elseif colT ~= myObjets.transmitter.col and ligT >= myObjets.transmitter.lig-1 and myObjets.transmitter.on == true then
    myObjets.transmitter.on = false
  end
  
  --Détection du receveur
  local colR, ligR = math.floor((pSprite.x + 16) / 32) + 1, math.floor((pSprite.y + 10) / 32) + 1
  if colR == myObjets.receiver.col and ligR == myObjets.receiver.lig or colR == myObjets.receiver.col +1 and ligR == myObjets.receiver.lig then
    if myObjets.receiver.on == false then
      myObjets.receiver.on = true
      if sndTeleporteur:isPlaying() == false then
        sndReceiver:play()
      end
    end
  elseif colR ~= myObjets.receiver.col and ligR >= myObjets.receiver.lig-1 and myObjets.receiver.on == true then
    myObjets.receiver.on = false
  end
  
  if myObjets.transmitter.on == false and myObjets.receiver.on == false then
    sndTeleporteur:stop()
    sndReceiver:stop()
  end
  
  --Téléportation de la clé
  if myObjets.transmitter.on and myObjets.receiver.on and myObjets.key.nbPossesive > 0 then
    myObjets.key.teleport = true
  end
  
  --Pic falling
  local i
  for i=1, #myObjets.picfalls do
    if myObjets.picfalls[i].col ~= nil or myObjets.picfalls[i].lig ~= nil then
      if myObjets.picfalls[i].lig < myObjets.picfalls[i].ligbase + myObjets.picfalls[i].nblig then
        myObjets.picfalls[i].lig = myObjets.picfalls[i].lig + (myObjets.picfalls[i].vit * dt)
      else
        myObjets.picfalls[i].lig = myObjets.picfalls[i].ligbase
      end
      if pSprite.type == "player" or pSprite.type == "player2" then
        if pSprite.x > (myObjets.picfalls[i].col - 1) * 32 - 24  and pSprite.y > (myObjets.picfalls[i].lig - 1) * 32 and pSprite.x < ((myObjets.picfalls[i].col - 1) * 32) + 22 and pSprite.y < (myObjets.picfalls[i].lig - 1) * 32 +7 then
          sndHurt:play()
          heart.current = heart.current - 1
          InitGame(niveau)
          end
        if pSprite.x > (myObjets.picfalls[i].col - 1) * 32 - 24  and pSprite.y > (myObjets.picfalls[i].lig - 1) * 32 -32 and pSprite.x < ((myObjets.picfalls[i].col - 1) * 32) + 22 and pSprite.y < (myObjets.picfalls[i].lig - 1) * 32  then
          sndHurt:play()
          heart.current = heart.current - 1
          InitGame(niveau)
        end
      end
    end
  
  end
  
end

function game.updateMenus(dt)
  
  if menus == 1 then
    --if love.keyboard.isDown("space") then menus = 2 end
    -- Coeurs
    heart.max = 5
    heart.current = 5
    heart.col = 1
    heart.lig = 10
    heart.image = love.graphics.newImage("images/heart.png")
    
    --bouton jouer
    local down = love.mouse.isDown(1)
    if love.mouse.getX() > 206 and love.mouse.getY() > 252 and love.mouse.getX() < 587 and love.mouse.getY() < 282 then
      if down then
        menus = 2
        dtTime = 0
        InitGame(1)
        sndSelect:play()  
      end
    end
    
    --bouton commande
    if love.mouse.getX() > 206 and love.mouse.getY() > 348 and love.mouse.getX() < 587 and love.mouse.getY() < 378 then
      if down then
        --sndSelect:play()
      end
    end
    
    --bouton quitter
    if love.mouse.getX() > 206 and love.mouse.getY() > 443 and love.mouse.getX() < 587 and love.mouse.getY() < 473 then
      if down then
        sndSelect:play()
        love.event.quit()
      end
    end
    
  end
  
  
  if menus == 2 then
    sndAmbient:setVolume(dtTime/15)
    sndAmbient:play()
    
    if myObjets.door.isOpen == false then
      dtTime = dtTime + dt
      if dtTime > 150 then
        menus = 3
      end
    end
    
    for nSprite=#lstSprites,1,-1 do
      local sprite = lstSprites[nSprite]
      updateSprite(sprite, dt)
    end
    
    if heart.current < 1 then menus = 3 end
  end

  if menus == 3 then
    if love.keyboard.isDown("r") then menus = 1 end
    if sndAmbient:isPlaying() then
      sndAmbient:stop()
    end
    if sndLose_playing == false then
      sndLose:play()
      sndLose_playing = true
    end
  end
  
  if menus == 4 then
    if love.keyboard.isDown("r") then menus = 1 end
    if sndAmbient:isPlaying() then
      sndAmbient:stop()
    end
    if sndWin_playing == false then
      sndWin:play()
      sndWin_playing = true
    end
    --sndWin:setLooping(false)
  end
  
end

function drawSprite(pSprite)
  if pSprite.type == "player" then
    for i=1, #imgPlayer do
      love.graphics.draw(imgPlayer_sheet, imgPlayer[math.floor(imgPlayer_Cur)],pSprite.x, pSprite.y, (math.pi/2) * (imgPlayer_rot * 2), 2, imgPlayer_S*2, 16 * imgPlayer_rot, 0)
    end
    if myObjets.key.teleport == true and myObjets.key.possesive == true and myObjets.key.nbPossesive > 0 then
      love.graphics.draw(myObjets.key.img, pSprite.x + 8, pSprite.y - 16)
    end
  elseif pSprite.type == "player2" then
    love.graphics.draw(imgPlayer2_sheet, imgPlayer2[math.floor(imgPlayer2_Cur)], pSprite.x, pSprite.y, (math.pi/2) * (imgPlayer2_rot*2), 2, imgPlayer2_S*2 , 16 * imgPlayer2_rot )--,16 * imgPlayer2_rot)
    if myObjets.key.teleport == false and myObjets.key.possesive == true then
      love.graphics.draw(myObjets.key.img, pSprite.x + 8, pSprite.y - 16)
    end
  else
    love.graphics.rectangle("fill", pSprite.x, pSprite.y, 32, 32)
  end
  
end

function game.drawMenus()
  if menus == 1 then
    love.graphics.print("Appuyer sur espace pour jouer", 0, 0)
    love.graphics.draw(imgMenu1, 0, 0)
    -- bouton jouer
    if love.mouse.getX() > 206 and love.mouse.getY() > 252 and love.mouse.getX() < 587 and love.mouse.getY() < 282 then
      love.graphics.setColor(255,255,255,100)
      love.graphics.rectangle("fill", 206, 252, 381, 30)
      love.graphics.setColor(255,255,255,255)
    end
    
   -- if love.mouse.getX() > 206 and love.mouse.getY() > 348 and love.mouse.getX() < 587 and love.mouse.getY() < 378 then
    --  love.graphics.setColor(255,255,255,100)
    --  love.graphics.rectangle("fill", 206, 348, 381, 30)
     -- love.graphics.setColor(255,255,255,255)
    --end
    
    if love.mouse.getX() > 206 and love.mouse.getY() > 443 and love.mouse.getX() < 587 and love.mouse.getY() < 473 then
      love.graphics.setColor(255,255,255,100)
      love.graphics.rectangle("fill", 206, 443, 381, 30)
      love.graphics.setColor(255,255,255,255)
    end
    
  end
  
  if menus == 2 then
    for l=1,#map do
      for c=1,#map[1] do
        local char = string.sub(map[l],c,c)
        if tonumber(char) > 1 then
          love.graphics.draw(imgTiles[char],(c-1)*32,(l-1)*32, 0, 2, 2)
        end
      end
    end
    for nSprite=#lstSprites,1,-1 do
      local sprite = lstSprites[nSprite]
      drawSprite(sprite)
    end
    --love.graphics.print(tostring(lstSprites[1].standing))
    
    -- Affichage donnée du jeu
    local h
    for h=1, heart.current do
      love.graphics.draw(heart.image, (heart.col - 1 + (h-1)) * 32, (heart.lig - 1) * 32, 0, 2, 2)
    end
    
    love.graphics.print(myObjets.key.nbPossesive.." X", ((22 - 1) * 32) - 10, (10 - 1) * 32, 0, 2, 2)
    love.graphics.draw(myObjets.key.img, ((23 - 1) * 32) + 16, ((10 - 1) * 32) + 12, 0, 1.5, 1.5, myObjets.key.img:getWidth()/2, myObjets.key.img:getHeight()/2)
    
    --affichage de la clé
    if myObjets.key.possesive == false then
      love.graphics.draw(myObjets.key.img, (myObjets.key.col - 1) * 32, (myObjets.key.lig - 1) * 32, 0, 2, 2)
    end
    
    --affichage de la porte
    if myObjets.door.isOpen == false then
      love.graphics.draw(myObjets.door.img, (myObjets.door.col - 1) * 32, (myObjets.door.lig - 1) * 32, 0, 2, 2)
    else
      love.graphics.draw(myObjets.door.imgO, (myObjets.door.col - 1) * 32, (myObjets.door.lig - 1) * 32, 0, 2, 2)
    end
    
    --affichage du transmetteur
    if myObjets.transmitter.on == false then
      love.graphics.draw(myObjets.transmitter.img, (myObjets.transmitter.col - 1) * 32, (myObjets.transmitter.lig - 1) * 32, 0, 2, 2)
    else
      love.graphics.draw(myObjets.transmitter.imgO, (myObjets.transmitter.col - 1) * 32, (myObjets.transmitter.lig - 1) * 32, 0, 2, 2)
    end
    
    --affichage du recepteur
    if myObjets.receiver.on == false then
      love.graphics.draw(myObjets.receiver.img, (myObjets.receiver.col - 1) * 32, (myObjets.receiver.lig - 1) * 32, 0, 2, 2)
    else
      love.graphics.draw(myObjets.receiver.imgO, (myObjets.receiver.col - 1) * 32, (myObjets.receiver.lig - 1) * 32, 0, 2, 2)
    end
    
    --affichage du timer
    love.graphics.print(math.floor(150-dtTime), (22 - 1) * 32, (11 - 1) * 32, 0, 2, 2)
    love.graphics.draw(myObjets.timer.img, (myObjets.timer.col - 1) * 32, (myObjets.timer.lig - 1) * 32)
    
    --affichage du picfall
    local i
    for i=1, #myObjets.picfalls do
      if myObjets.picfalls[i].col ~= nil or myObjets.picfalls[i].lig ~= nil then
        love.graphics.draw(myObjets.picfall.img, (myObjets.picfalls[i].col - 1) * 32, (myObjets.picfalls[i].lig - 1) * 32, 0, 2, 2)
      end
    end
  end
  

  if menus == 3 then
    love.graphics.draw(imgMenu3, 0, 0)
  end
  
  if menus == 4 then
    love.graphics.draw(imgMenuWin, 0, 0)
  end
end

return game