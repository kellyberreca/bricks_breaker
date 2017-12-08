function mover(dt)
  x = love.mouse.getX( )
	jogadorx = x-jogadorl/2
  if (love.keyboard.isDown("left") or love.keyboard.isDown("a")) and jogadorx>=0 then
		jogadorx = jogadorx - jogadorvelocidade*dt
    love.mouse.setPosition( jogadorx+jogadorl/2, love.mouse.getY( ) )
	elseif (love.keyboard.isDown("right") or love.keyboard.isDown("d"))and jogadorx<=700 then
		jogadorx = jogadorx + jogadorvelocidade*dt
    love.mouse.setPosition( jogadorx+jogadorl/2, love.mouse.getY( ) )
	end
  return jogadorx
end
