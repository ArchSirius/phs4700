function [collision r] = LineCylinder(r0, v0, hCylindre, mCylindre, rCylindre, normeCourte, count)
  [x, y, d] = LineCircle(v0, r0, mCylindre, rCylindre, normeCourte);
  collision = 0;

  if count == 0
	  isOut = 1;
  end	

  if d
    intersectxy = [x y];
    [r collision] = LineRectangle(v0, intersectxy, r0, hCylindre, mCylindre, rCylindre);
  end
  
