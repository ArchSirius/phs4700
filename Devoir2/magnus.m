function m = magnus(v, wb, rayon)
  C = 0.29;
  p = 1.2;
  m = 4 * p * C * rayon ^ 3 * cross(wb, v);
