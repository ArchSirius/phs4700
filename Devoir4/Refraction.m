function [w1, isRefracted] =  Refraction(r, w0, mCylindre, hCylindre, n_in, n_out)
  low_z = mCylindre(3) - 0.5 * hCylindre;
  high_z  = mCylindre(3) + 0.5 * hCylindre;
  z = r(3);

  % bottom or top 
  if (z == low_z)
    normal = [0 0 -1];
  elseif (z == high_z) 
    normal = [0 0 1];
  else
    normal = [r(1)-mCylindre(1) r(2)-mCylindre(2) 0];
  end
  
  w0_xy = w0(1:2);
  normal_xy = normal(1:2);
  phi_out = 0;
  if (norm(w0_xy) ~= 0 && norm(normal_xy) ~= 0)
    phi_in = acos(dot(w0_xy,normal_xy) / (norm(w0_xy) * norm(normal_xy) + 1e-10));
    phi_out = asin(n_in * sin(phi_in) / n_out);
  end
  w0_xz = [norm(w0(1:2)) w0(3)];
  normal_xz = [norm(normal(1:2)) normal(3)];
  theta_in = acos(dot(w0_xz,normal_xz) / (norm(w0_xz) * norm(normal_xz) + 1e-10));
  % TODO gerer reflextion total interne
  theta_out = asin(n_in * sin(theta_in) / n_out);

  if w0(3) < 0
    theta_out = -theta_out;
  end

  w1 = [sin(theta_out)*cos(pi-phi_out) sin(theta_out)*sin(pi-phi_out) cos(theta_out)];
  isRefracted = 1;
  if abs(phi_out)>(pi/2) || abs(theta_out)>(pi/2)
	  isRefracted = 0;
  end

