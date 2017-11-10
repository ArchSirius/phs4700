function [isCollision] = collision(angA, angB, rotatedA, rotatedB)
  ... Angle en radiant selon les axes des x positif
  systemA = rotate(angA, [rotatedA ; rotatedB]);
  isCollision = check_collision(systemA);

  if not(isCollision)
    systemB = rotate(angB, [rotatedB ; rotatedA]);
    isCollision = check_collision(systemB);
  end
    