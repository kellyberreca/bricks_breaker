
function fase1_load()

	--pause
	pause = false

	--tempo
	tempo = 0

	--tijolos
	lt = 50
	ht = 15
	tijolo={}
	for i=3,745,53 do
		tijolo[i] = {}
		for j = 27,117,18 do
			tijolo[i] [j] = true
		end
	end

	--bola
	velocidade = 250
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

  	tempo1 = (os.time())%100
  	tempo2 = tempo1%10

	tempo3 = math.floor(tempo1/2)
	tempo4 = math.floor(tempo2/2)

	MaisVida = true
	if tempo1<=14 then
		MaisVidax = 3+53*tempo1
	else
		MaisVidax = 3+53*(math.floor(tempo1/7))
	end

	if tempo2<=5 then
		MaisViday = 27+18*tempo2
	else
		MaisViday = 27+18*(math.floor(tempo2/2))
	end

	MenosVida = true
	if tempo3<=14 then
		MenosVidax = 3+53*tempo3
	else
		MenosVidax = 3+53*(math.floor(tempo3/4))
	end
	MenosViday = 27+18*tempo4
end

function fase1_update(dt)
	if not pause then

		if love.keyboard.isDown('p') then
			pause = true
		end
		--contagem do tempo
		tempo = tempo+dt

		if love.keyboard.isDown('r') then
			fase1_load()
		end

		jogadorx = mover(dt)
		bolavelocidade,bolavelocidadex = BolaJogador(bolay,bolax,bolar,bolavelocidade,bolavelocidadex)
		bolavelocidadex =  BolaParede(bolax,bolar,bolavelocidadex)
		bolavelocidade = BolaTeto(bolay,bolar,bolavelocidade)
		if v>=0  and pontos<90 then
			--tijolo
			for i=3,745,53 do
				for j = 27,117,18 do
					if tijolo[i][j]==true then
						tijolo[i][j],bolavelocidade,bolavelocidadex,pontos =  BolaTijolo(tijolo,i,j,ht,lt,bolax,bolay,bolar,bolavelocidadex,bolavelocidade,pontos)
					end
				end
			end
			--bola
			bolay,bolax = BolaVelocidade(dt,bolax,bolay,bolavelocidadex,bolavelocidade,pontos)
			--vida

			if MaisVida == true and tijolo[MaisVidax][MaisViday]==false and pontos>30 then
				if BolaPoder(bolax,bolay,MaisVidax+18.5,MaisViday) then
					if v==3 then
						v = 3
					else
						v = v+1
					end
					MaisVida = false
				end
			end

			if MenosVida == true and tijolo[MenosVidax][MenosViday]==false and pontos>50 then
				if BolaPoder(bolax,bolay,MenosVidax+18.5,MenosViday) then
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

	else

		if love.keyboard.isDown('c') then
			pause = false
		end

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

	if tempo>1 and (tempo%60)>=0 and (tempo%60)<=0.3 then
		love.graphics.setBackgroundColor(255, 255, 255 )
	else
		love.graphics.setBackgroundColor( 0, 0, 0 )
		if MaisVida == true and tijolo[MaisVidax][MaisViday]==false and pontos>30 then
			love.graphics.draw(vida,MaisVidax+18.5,MaisViday)
		end
		if MenosVida == true and tijolo[MenosVidax][MenosViday]==false and pontos>50 then
			love.graphics.draw(menosvida,MenosVidax+18.5,MenosViday)
		end

		--desenhando os tijolos
		for i=3,745,53 do
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

end
