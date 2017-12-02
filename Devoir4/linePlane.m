function [isCollision, vecteur_resultant] = intersectLinePlane(r0, w0, v1, v2)
  minX = 3;
  maxX = 4;
  minY = 3;
  maxY = 5;
  minZ = 12;
  maxZ = 17;

  is_collision1 = line_plane(r0, w0, [1 0 0], minX, minY, maxY, minZ, maxZ);
  is_collision2 = line_plane(r0, w0, [1 0 0], maxX, minY, maxY, minZ, maxZ);
  is_collision3 = line_plane(r0, w0, [0 1 0], minY, minX, maxX, minZ, maxZ);
  is_collision4 = line_plane(r0, w0, [0 1 0], maxY, minX, maxX, minZ, maxZ);
  is_collision5 = line_plane(r0, w0, [0 0 1], minZ, minX, maxX, minY, maxY);
  is_collision6 = line_plane(r0, w0, [0 0 1], maxZ, minX, maxX, minY, maxY);

  top = minX - dot(n, r0);
  bottom = dot(v, n);
  t = top / botoom;
  
  vecteur_resultant = r0 + t*v;
  
  x = vecteur_resultant(1);
  y = vecteur_resultant(2);
  z = vecteur_resultant(3);

  is_collision = true;
  if (x < minX || x > maxX) 
    is_collision = false;
  end
  if (y < minY || y > maxY) 
    is_collision = false;
  end
  if (z < minZ || z > maxZ)
     is_collision = false;
  end
