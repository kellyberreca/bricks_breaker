require 'estadojogo/menu'
require 'estadojogo/fase1'
require 'estadojogo/pontos'
require 'estadojogo/instrucoes'
require "funcoes/retangulo"
require 'funcoes/Colisoes'
require 'funcoes/mover'
require 'funcoes/BolaVelocidade'

function love.load()
	fonte1 = love.graphics.newFont('PressStart2P.ttf',36)
	fonte2 = love.graphics.newFont('PressStart2P.ttf',24)
	fonte3 = love.graphics.newFont('PressStart2P.ttf',18)
	tijolosom = love.audio.newSource("sons/somtijolo.wav", "static")
	bolaparede = love.audio.newSource('sons/bolaparede.wav','static')
	jogadorsom = love.audio.newSource("sons/somjogador.wav", "static")
	menu_load()
	estadojogo = 'menu'
end
function love.update(dt)
	function love.keypressed(key)
		if key == "escape" then
			love.event.quit()
		end
	end
	if estadojogo =='menu' then
		menu_update(dt)
	elseif estadojogo =='instrucoes' then
		instrucoes_update(dt)
	elseif estadojogo == 'fase1' then
		fase1_update(dt)
	elseif estadojogo == 'pontos' then
		pontos_update(dt)
	end
end
function love.draw()
	if estadojogo =='menu' then
		menu_draw()
	elseif estadojogo =='instrucoes' then
		instrucoes_draw()
	elseif estadojogo == 'fase1' then
		fase1_draw()
	elseif estadojogo == 'pontos' then
		pontos_draw()
	end
end 
