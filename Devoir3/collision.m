function [isCollision] = collision(raf, rbf)
  ... Angle en radiant selon les axes des x positif
  maX = raf(1);
  maY = raf(2);
  angA = -raf(3);

  mbX = rbf(1);
  mbY = rbf(2);
  angB = -rbf(3);
  lonaX = 4.78 * 0.5;
  lonaY = 1.82 * 0.5;
  lonbX = 4.23 * 0.5;
  lonbY = 1.6 * 0.5;
  
  
  posANotRotated = [-lonaX lonaY ;...
                      lonaX lonaY ;...
                      lonaX -lonaY ;...
                    -lonaX -lonaY ];
  rotatedA = rotate(angA, posANotRotated) + [maX  maY];

  posBNotRotated = [-lonbX lonbY ;...
                    lonbX lonbY ;...
                    lonbX -lonbY ;...
                    -lonbX -lonbY ];
  rotatedB = rotate(angB, posBNotRotated) + [mbX  mbY];

  systemA = rotate(-angA, [rotatedA ; rotatedB]);
  isCollision = check_collision(systemA);

  if not(isCollision)
    systemB = rotate(-angB, [rotatedB ; rotatedA]);
    isCollision = check_collision(systemB);
  end
    





 

  
