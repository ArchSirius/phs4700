function [collision r] = LineCylinder(r0, v0, hCylindre, mCylindre, rCylindre)
  [x, y, d] = LineCircle(v0, r0, mCylindre, rCylindre, 0);
  collision = 0;
  r = r0;

  if d
    intersectxy = [x y];
    [r collision] = LineRectangle(v0, intersectxy, r0, hCylindre, mCylindre, rCylindre, 1);
  end
  
