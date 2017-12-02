function [isCollision, vecteur_resultant] = intersectLinePlane(r0, w0, v1, v2)
  top = minX - dot(n, r0);
  bottom = dot(v, n);
  t = top / botoom;
  
  vecteur_resultant = r0 + t*v;
  
  x = vecteur_resultant(1);
  y = vecteur_resultant(2);
  z = vecteur_resultant(3);

  is_collision = true;
  if (x < minX || x > maxX) 
    isCollision = false;
  end
  if (y < minY || y > maxY) 
    isCollision = false;
  end
  if (z < minZ || z > maxZ)
     isCollision = false;
  end
