function [collision] =  A(r0, w0, mCylindre, hCylindre, rCylindre, n_in, n_out)
 
  %% Calul de la normal du plan xy
  c = mCylindre(1:2);
  
    %% Calcul de la normal du plan zy
  low_x = mCylindre(1) - rCylindre;
  high_x = mCylindre(1) + rCylindre;
  
  low_y = mCylindre(2) 
  
  low_z = mCylindre(3) - 0.5 * hCylindre;
  high_z  = mCylindre(3) + 0.5 * hCylindre;

  x = r0(1);
  z = r0(3);
  % bottom or top 
  if (z == low_z):
    normal_xy = [0 0 0];
    normal_zx = [0 0 -1];
    normal_zy = [0 0 -1];
  if (z == high_z): 
    normal_xy = [0 0 0];
    normal_zx = [0 0 1];
    normal_zy = [0 0 1];
  else:
    normale_xy = [c(1) - r(1) c(2) - r(2) 0];
    normal_zx = [0 1 0];
    normal_zy = [1 0 0];
  end
  
  %% Calcul de l'angle d'incidence
  % Si ca ner marche pas, regarder w0 (peut etre enelver une dimension).
  % Regarder aussi pi. Peut etre ne doit pas etre mis
  theta_in = pi - acos(dot(w0,normale_xy) / (norm(w0) * norm(normale_xy)));
  theta_out_xy = asin(n_in * sin(theta_in) / n_out);
  theta_in = pi - acos(dot(w0,normale_zx) / (norm(w0) * norm(normale_zx)));
  theta_out_zx = asin(n_in * sin(theta_in) / n_out);
  theta_in = pi - acos(dot(w0,normale_zy) / (norm(w0) * norm(normale_zy)));
  theta_out_zy = asin(n_in * sin(theta_in) / n_out);



