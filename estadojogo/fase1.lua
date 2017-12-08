function fase1_load()
	--tijolos
	lt = 50
	ht = 15
	tijolo = {}
	for i=3,780,53 do
		tijolo[i] = {}
		for j = 27,117,18 do
			tijolo[i] [j] = true
		end
	end
  
	--bola
	velocidade = 210
	bolax,bolay,bolar = 400,200,10
	bolavelocidade = velocidade
	bolavelocidadex = 0
	pontos = 0
  
	--jogador
	jogadorx,jogadory = 350,500
	jogadorh,jogadorl=20,100
	jogadorvelocidade = 300

	--vidas
	vida = love.graphics.newImage('imagens/coracao.png')
  menosvida = love.graphics.newImage('imagens/menosvida.png')
	v=3
  
  MaisVida = true
  MaisVidax = 109
  MaisViday = 81
  
  MenosVida = true
  MenosVidax = 745
  MenosViday = 45
end

function fase1_update(dt)

  jogadorx = mover(dt)
  bolavelocidade,bolavelocidadex = BolaJogador()
	bolavelocidadex =  BolaParede()
  bolavelocidade = BolaTeto()
	if v>=0  and pontos<90 then
    --tijolo
		for i=3,780,53 do
			for j = 27,117,18 do
        if tijolo[i][j]==true then
          tijolo[i][j],bolavelocidade,bolavelocidadex,pontos =  BolaTijolo(i,j)
        end
			end
		end
    --bola
    bolay,bolax = BolaVelocidade(dt)
    --vida
    if MaisVida == true and tijolo[MaisVidax][MaisViday]==false and pontos>30 then
      if BolaPoder(bolax,bolay,MaisVidax,MaisViday) then
        if v==3 then 
          v = 3
        else 
          v = v+1
        end
        MaisVida = false
      end
    end
    
    if MenosVida == true and tijolo[MenosVidax][MenosViday]==false and pontos>50 then
      if BolaPoder(bolax,bolay,MenosVidax,MenosViday) then
        v = v-1
        MenosVida = false
      end
    end
    
		if bolay>=600 then
			v = v-1
			bolax,bolay = 400,200
			bolavelocidade = 0
			bolavelocidadex = 0
		end
	else
    estadojogo='pontos'
    pontos_load()
	end
  --jogador
	if (love.keyboard.isDown("left") or love.keyboard.isDown("a") or love.keyboard.isDown("d") or love.keyboard.isDown("right") or love.mouse.isDown(1)) and bolavelocidade==0 and bolavelocidadex == 0  then
		bolavelocidade = velocidade
	end

end

function fase1_draw()
  love.graphics.setFont(fonte3)
	love.graphics.setColor(255,255,255)

  --pontos
	love.graphics.print('Pontos:',610,9,0,1,1)
	love.graphics.print(pontos,750,9,0,1,1)
  --vidas
  love.graphics.print('Vidas:',3,9,0,1,1)
	if v == 3 then
		love.graphics.draw(vida,110,5)
		love.graphics.draw(vida,135,5)
		love.graphics.draw(vida,160,5)
	elseif v==2 then
		love.graphics.draw(vida,110,5)
		love.graphics.draw(vida,135,5)
	elseif v==1 then
		love.graphics.draw(vida,110,5)
	end
  if MaisVida == true and tijolo[MaisVidax][MaisViday]==false and pontos>30 then
    love.graphics.draw(vida,127.5,81)
  end
  if MenosVida == true and tijolo[MenosVidax][MenosViday]==false and pontos>50 then
    love.graphics.draw(menosvida,762,45)
  end

	--desenhando os tijolos
	for i=3,780,53 do
		for j = 27,117,18 do
			if j<=45 then
				r,g,b = 125,0,0
			elseif j<=81 then
				r,g,b = 255,125,0
			else
				r,g,b = 255,255,0
			end
			if tijolo[i][j]==true then
        love.graphics.setColor(r,g,b)
        love.graphics.rectangle('fill',i,j,lt,ht)
			end
		end
  end
  --desenhando bola
	love.graphics.setColor(255,0,0)
	love.graphics.circle('fill',bolax,bolay,bolar)
  --desenhando jogador
	love.graphics.setColor(0,0,255)
	love.graphics.rectangle('fill',jogadorx,jogadory,jogadorl,jogadorh)
end
