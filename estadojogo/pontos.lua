

function pontos_load()
  jogarx,jogary = 221,300
  jogarl,jogarh = 358,21
  
  menux,menuy = 353.5,350
  menul,menuh = 93,21
  
  
end
function pontos_update(dt)
  
  if love.mouse.isDown(1) then
    x = love.mouse.getX( )
    y = love.mouse.getY( )
    if toqueretangulo(x, y, jogarx, jogary-5,jogarl,jogarh ) then
      estadojogo='fase1'
      fase1_load()
    elseif toqueretangulo(x, y, menux, menuy-5,menul,menuh ) then
      estadojogo = 'menu'
      menu_load()
		end
  end
end
function pontos_draw()
  for i=3,780,53 do
		for j = 27,117,18 do
			if j<=45 then
				r,g,b = 31,0,0
			elseif j<=81 then
				r,g,b = 64,31,0
			else
				r,g,b = 64,64,0
			end
      if tijolo[i][j]==true then
        love.graphics.setColor(r,g,b)
        love.graphics.rectangle('fill',i,j,50,15)
      end
		end
  end
  love.graphics.setColor(64,0,0)
  love.graphics.circle('fill',bolax,bolay,bolar)
  love.graphics.setColor(0,0,64)
	love.graphics.rectangle('fill',jogadorx,jogadory,jogadorl,jogadorh)
	
  love.graphics.setColor(255,255,255)
  love.graphics.setFont(fonte1)
  love.graphics.print('BRICK',313,100)
  love.graphics.setFont(fonte2)
  love.graphics.print('TOTAL DE PONTOS:',186,200)
  love.graphics.print(pontos,595,200)
  love.graphics.print('JOGAR NOVAMENTE',jogarx,jogary)
  love.graphics.print('MENU',menux,menuy)
end
