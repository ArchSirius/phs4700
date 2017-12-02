function [collision, face, r] = LineBox(r0, w0)
  minX = 3;
  maxX = 4;
  minY = 3;
  maxY = 5;
  minZ = 12;
  maxZ = 17;

  [is_collision1, r1] = linePlane(r0, w0, [1 0 0], minX, minY, maxY, minZ, maxZ);
  [is_collision2, r2] = linePlane(r0, w0, [1 0 0], maxX, minY, maxY, minZ, maxZ);
  [is_collision3, r3] = linePlane(r0, w0, [0 1 0], minY, minX, maxX, minZ, maxZ);
  [is_collision4, r4] = linePlane(r0, w0, [0 1 0], maxY, minX, maxX, minZ, maxZ);
  [is_collision5, r5] = linePlane(r0, w0, [0 0 1], minZ, minX, maxX, minY, maxY);
  [is_collision6, r6] = linePlane(r0, w0, [0 0 1], maxZ, minX, maxX, minY, maxY);

  minR = 999999;
  face = 0;
  r = [0 0 0];
  collision = false;
  if is_collisiion1 && norm(r0, r1) < minR
    minR = norm(r0, r1);
    collision = true;
    face = 1;
    r = r1;
  end
  if is_collisiion2 && norm(r0, r2) < minR
    minR = norm(r0, r2);
    collision = true;
    face = 2;
    r = r2;
  end
  if is_collisiion3 && norm(r0, r3) < minR
    minR = norm(r0, r3);
    collision = true;
    face = 3;
    r = r3;
  end
  if is_collisiion4 && norm(r0, r4) < minR
    minR = norm(r0, r4);
    collision = true;
    face = 4;
    r = r4;
  end
  if is_collisiion5 && norm(r0, r5) < minR
    minR = norm(r0, r5);
    collision = true;
    face = 5;
    r = r5;
  end
  if is_collisiion6 && norm(r0, r6) < minR
    minR = norm(r0, r6);
    collision = true;
    face = 6;
    r = r6;
  end

