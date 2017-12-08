function toqueretangulo(mousex,mousey,rx, ry, rw, rh)
  return (mousex>= rx and mousex <= rx+rw) and (mousey >= ry and mousey <= ry + rh)
end
