function [isCollision vecteur_resultant] = linePlane(r0, v, n, point, minX, maxX, minY, maxY, minZ, maxZ)
  epsilon = 1e-10
  top = dot(n, point) - dot(n, r0);
  bottom = dot(v, n);
  t = top / bottom;
  
  vecteur_resultant = r0 + t*v;
  
  x = vecteur_resultant(1);
  y = vecteur_resultant(2);
  z = vecteur_resultant(3);

  isCollision = true;
  if (x < minX - epsilon || x > maxX + epsilon)
    isCollision = false;
  end
  if (y < minY - epsilon || y > maxY + epsilon)
    'y'
    isCollision = false;
  end
  if (z < minZ - epsilon || z > maxZ + epsilon)
    'z'
    isCollision = false;
  end
