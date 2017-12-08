function BolaVelocidade(dt,bolax,bolay,bolavelocidadex,bolavelocidade,pontos)
  if pontos >= 80 then
    bolay ,bolax= (bolay+2.5*bolavelocidade*dt),(bolax+2.5*bolavelocidadex*dt)
  elseif pontos>=50 then
    bolay ,bolax= (bolay+2*bolavelocidade*dt),(bolax+2*bolavelocidadex*dt)
  elseif pontos>=40 then
    bolay ,bolax= (bolay+1.8*bolavelocidade*dt),(bolax+1.8*bolavelocidadex*dt)
  elseif pontos >=30 then
    bolay ,bolax= (bolay+1.6*bolavelocidade*dt),(bolax+1.6*bolavelocidadex*dt)
  elseif pontos >=20 then
    bolay ,bolax= (bolay+1.4*bolavelocidade*dt),(bolax+1.4*bolavelocidadex*dt)
  elseif pontos >=10 then
    bolay ,bolax= (bolay+1.2*bolavelocidade*dt),(bolax+1.2*bolavelocidadex*dt)
  else
    bolay ,bolax= (bolay+bolavelocidade*dt),(bolax+bolavelocidadex*dt)
  end
  return bolay ,bolax
end
