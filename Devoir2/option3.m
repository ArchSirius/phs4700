function k1 = option3(q0, tn)
  m_b = 2.74 / 1000;
  rayon = 1.99 / 100;
  ri = q0(1,:);
  vi = q0(2,:);
  wi = q0(3,:);
  ti = q0(4,1);
  deltat = tn - ti;
  
  F = force_g(m_b) + force_air(vi, rayon) + magnus(vi, wi, rayon);
  a = acceleration(F, m_b);
  v = velocity(vi, deltat, a) - vi;
  r = position(ri, v, a, deltat) - ri;
  w = [0 0 0];
  t = [ti 0 0];
  k1 = [r; v; w; t];
