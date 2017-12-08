function instrucoes_load()
  jogarx,jogary = 660,500
  jogarl,jogarh = 117,21
  
  menux,menuy = 20,500
  menul,menuh = 93,21
  
  mouse = love.graphics.newImage('imagens/cursor.png')
  direita = love.graphics.newImage('imagens/right.png')
  esquerda = love.graphics.newImage('imagens/left.png')
  vida1 = love.graphics.newImage('imagens/002.png')
  vida2 = love.graphics.newImage('imagens/001.png')
end
function instrucoes_update(dt)
  if love.mouse.isDown(1) then
    x = love.mouse.getX( )
    y = love.mouse.getY( )
    if toqueretangulo(x, y, jogarx, jogary-5,jogarl,jogarh ) then
      estadojogo='fase1'
       return fase1_load()
    elseif toqueretangulo(x, y, menux, menuy-5,menul,menuh ) then
      estadojogo = 'menu'
      menu_load()
		end
  end
  
end
function instrucoes_draw()
  
  love.graphics.setColor(255,255,255)
  love.graphics.setFont(fonte1)
  love.graphics.print('PONG',328,50)
  love.graphics.setFont(fonte2)
  love.graphics.print('JOGAR',jogarx,jogary)
  love.graphics.print('MENU',menux,menuy)
  love.graphics.print ('USE O   OU    PARA MOVER A ',20,120)
  love.graphics.print ('REBATENDO A   PARA DESTRUIR OS',35,160)
  love.graphics.print ('GANHA UMA VIDA',230,280)
  love.graphics.print ('PERDE UMA VIDA',230,325)
  
  love.graphics.draw(mouse,160,110)
  love.graphics.draw(esquerda,277,110)
  love.graphics.draw(direita,312,110)
  love.graphics.draw(vida1,190,270)
  love.graphics.draw(vida2,190,315)
  
  love.graphics.setColor(0,0,255)
  love.graphics.rectangle('fill',670,115,100,20)
  love.graphics.setColor(255,0,0)
	love.graphics.circle('fill',335,165,10)
  love.graphics.setColor(125,0,0)
  love.graphics.rectangle('fill',310,195,50,18)
  love.graphics.setColor(255,125,0)
  love.graphics.rectangle('fill',370,195,50,18)
  love.graphics.setColor(255,255,0)
  love.graphics.rectangle('fill',430,195,50,18)
  
end
