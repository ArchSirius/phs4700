function [collision] =  A(r, w0, mCylindre, hCylindre, rCylindre, n_in, n_out)
  low_z = mCylindre(3) - 0.5 * hCylindre;
  high_z  = mCylindre(3) + 0.5 * hCylindre;

  z = r(3);
  % bottom or top 
  if (z == low_z)
    normal = [0 0 -1];
  elseif (z == high_z) 
    normal = [0 0 1];
  else
    normal = [mCylindre(1) - r(1) mCylindre(2) - r(2) 0];
  end
  
  %% Calcul de l'angle d'incidence
  % Si ca ner marche pas, regarder w0 (peut etre enelver une dimension).
  % Regarder aussi pi. Peut etre ne doit pas etre mis
  w0_xy = w0(1:2);
  normal_xy = normal(1:2);
  theta_out = 0;
  if (norm(w0_xy) ~= 0 || norm(normal_xy) ~= 0)
    theta_in = acos(dot(w0_xy,normal_xy) / (norm(w0_xy) * norm(normal_xy)));
    theta_out = asin(n_in * sin(theta_in) / n_out);
  end

  w0_xz = [w0(1) w0(3)];
  normal_xz = [normal(1) normal(3)];
  phi_out = 0;
  if (norm(w0_xz) ~= 0 || norm(normal_xz) ~= 0)
    phi_in = acos(dot(w0_xz,normal_xz) / (norm(w0_xz) * norm(normal_xz)));
    phi_out = asin(n_in * sin(theta_in) / n_out);
  end

  ux = cos(phi_out);
  uz = sin(phi_out);
  vy = cos(theta_out);
  vx = sin(theta_out);

  w1 = [ux + vx vy uz];
  LineCircle(w1, r, mCylindre, rCylindre, 0);
  collision = NaN;
