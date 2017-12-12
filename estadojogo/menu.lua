

function menu_load()
	jogarx,jogary=341.5,200
	jogarl,jogarh = 117,21

	instrucoesx,instrucoesy=282.5,250
	instrucoesl,instrucoesh = 235,21

	sairx,sairy = 354,300 
	sairl,sairh = 93,21
  
end
function menu_update(dt)
	if love.mouse.isDown(1) then
		x = love.mouse.getX( )
		y = love.mouse.getY( )
		if toqueretangulo(x, y, jogarx, jogary-5,jogarl,jogarh ) then
			estadojogo='fase1'
			fase1_load()
		elseif toqueretangulo(x, y, instrucoesx, instrucoesy-6,instrucoesl,instrucoesh ) then
			estadojogo = 'instrucoes'
			instrucoes_load()
		elseif toqueretangulo(x, y, sairx, sairy-5,sairl,sairh ) then
			love.event.quit( )
		end
	end
    
end
function menu_draw()
  
	for i=3,745,53 do
			for j = 27,117,18 do
				if j<=45 then
					r,g,b = 31,0,0
				elseif j<=81 then
					r,g,b = 64,31,0
				else
					r,g,b = 64,64,0
				end
				love.graphics.setColor(r,g,b)
				love.graphics.rectangle('fill',i,j,50,15)
			end
	end
	love.graphics.setColor(64,0,0)
	love.graphics.circle('fill',400,400,10)
	love.graphics.setColor(0,0,64)
	love.graphics.rectangle('fill',350,500,100,20)
	
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(fonte1)
	love.graphics.print('BRICK',313,100)
	love.graphics.setFont(fonte2)
	love.graphics.print('JOGAR',jogarx,jogary)
	love.graphics.print('INSTRUÇÕES',instrucoesx,instrucoesy)
	love.graphics.print('SAIR',sairx,sairy)
end
