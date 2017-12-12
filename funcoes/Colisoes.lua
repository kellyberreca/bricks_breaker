

function BolaParede(bolax,bolar,bolavelocidadex)
	if (bolax-bolar<=0 and bolavelocidadex<0) or (bolax+bolar>=800 and bolavelocidadex>0) then
		bolavelocidadex = bolavelocidadex*-1
		love.audio.play(bolaparede)
	end
	return bolavelocidadex
end

function BolaTeto(bolay,bolar,bolavelocidade)
	if bolay-bolar<=0 and bolavelocidade<0 then
		bolavelocidade = bolavelocidade*-1
		love.audio.play(bolaparede)
	end
	return bolavelocidade
end

function BolaJogador(bolay,bolax,bolar,bolavelocidade,bolavelocidadex)
	if bolay+bolar>=jogadory and bolay+bolar<=jogadory+jogadorh and bolavelocidade>0 then
		if (bolax+bolar==jogadorx or bolax-bolar==jogadorx+jogadorl) then 
			bolavelocidadex, bolavelocidade=velocidade*-0.87, velocidade*-0.5
			love.audio.play(jogadorsom)
		end
      
		if bolax>=jogadorx and bolax <jogadorx+20 then
			bolavelocidadex, bolavelocidade=velocidade*-0.87, velocidade*-0.5
			love.audio.play(jogadorsom)

		elseif bolax >=jogadorx+20 and bolax<jogadorx+40 then
			bolavelocidadex, bolavelocidade = velocidade*-0.71, velocidade*-0.71
			love.audio.play(jogadorsom)

		elseif bolax>=jogadorx+40 and bolax<=jogadorx+60 then
			bolavelocidadex, bolavelocidade =bolavelocidadex*-1, bolavelocidade*-1
			love.audio.play(jogadorsom)

		elseif bolax>jogadorx+60 and bolax<=jogadorx+80 then
			bolavelocidadex, bolavelocidade =velocidade*0.71, velocidade*-0.71
			love.audio.play(jogadorsom)

		elseif bolax>jogadorx+80 and bolax<=jogadorx+100 then
			bolavelocidadex, bolavelocidade = velocidade*0.87, velocidade*-0.5
			love.audio.play(jogadorsom)
		end
	end
	return bolavelocidade,bolavelocidadex
end
function BolaTijolo(tijolo,i,j,ht,lt,bolax,bolay,bolar,bolavelocidadex,bolavelocidade,pontos)
	if (bolay-bolar<=j+ht and bolay+bolar>=j) and (bolax>=i and bolax<=i+lt) and bolavelocidade>0 then
		tijolo[i][j]=false
		love.audio.play(tijolosom)
		bolavelocidade = bolavelocidade*-1
		pontos = pontos+1
	elseif (bolay-bolar<=j+ht and bolay+bolar>=j) and (bolax>=i and bolax<=i+lt) and bolavelocidade<0 then
		tijolo[i][j]=false
		love.audio.play(tijolosom)
		bolavelocidade = bolavelocidade*-1
		pontos = pontos+1
	elseif (bolax+bolar>=i and bolax-bolar<=i+lt) and (bolay>=j and bolay<=j+ht) and bolavelocidadex>0 then
		tijolo[i][j]=false
		love.audio.play(tijolosom)
		bolavelocidadex = bolavelocidadex*-1
		pontos  = pontos+1
	elseif (bolax+bolar>=i and bolax-bolar<=i+lt) and (bolay>=j and bolay<=j+ht) and bolavelocidadex<0 then
		tijolo[i][j]=false
		love.audio.play(tijolosom)
		bolavelocidadex = bolavelocidadex*-1
		pontos  = pontos+1
	end
	return tijolo[i][j],bolavelocidade,bolavelocidadex,pontos
end
function BolaPoder(bolax,bolay,poderx,podery)
	return ((bolax+bolar>=poderx and bolax-bolar<=poderx+16) and (bolay+bolar >= podery and bolay-bolar<=podery+16))
end
