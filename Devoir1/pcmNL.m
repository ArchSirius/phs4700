function pcm=pcmNL(posNL)
    rayon_navette = 3.5;
    hauteur_navette_cylindre = 27.93;
    hauteur_navette_cone = 9.31;
    masse_navette = 109e+03;
    cm_navette_cylindre = [0 0 hauteur_navette_cylindre/2];
    cm_navette_cone = [0 0 hauteur_navette_cylindre+hauteur_navette_cone/4];
    volume_navette_cylindre = hauteur_navette_cylindre * pi * rayon_navette^2;
    volume_navette_cone = hauteur_navette_cone * pi * rayon_navette^2 / 3;
    volume_navette = volume_navette_cylindre + volume_navette_cone;
    mv_navette = masse_navette / volume_navette;
    masse_navette_cylindre = volume_navette_cylindre * mv_navette;
    masse_navette_cone = volume_navette_cone * mv_navette;
    cm_navette = (masse_navette_cylindre * cm_navette_cylindre + masse_navette_cone * cm_navette_cone) / masse_navette;

    rayon_reservoir = 4.2;
    hauteur_reservoir_cylindre = 39.1;
    hauteur_reservoir_cone = 7.8;
    masse_reservoir_inf = 108e+03;
    masse_reservoir_sup = 631e+03;
    masse_reservoir = masse_reservoir_inf + masse_reservoir_sup;
    hauteur_reservoir_inf = 46.9 * 2 / 3;
    cm_reservoir_inf = [0 rayon_navette+rayon_reservoir hauteur_reservoir_inf/2];
    volume_reservoir_sup_cylindre = (hauteur_reservoir_cylindre - hauteur_reservoir_inf) * pi * rayon_reservoir^2;
    volume_reservoir_sup_cone = hauteur_reservoir_cone * pi * rayon_reservoir^2 / 3;
    volume_reservoir_sup = volume_reservoir_sup_cylindre + volume_reservoir_sup_cone;
    mv_reservoir_sup = masse_reservoir_sup / volume_reservoir_sup;
    masse_reservoir_sup_cylindre = volume_reservoir_sup_cylindre * mv_reservoir_sup;
    masse_reservoir_sup_cone = volume_reservoir_sup_cone * mv_reservoir_sup;
    hauteur_reservoir_sup_cylindre = hauteur_reservoir_cylindre - hauteur_reservoir_inf;
    cm_reservoir_sup_cylindre = [0 rayon_navette+rayon_reservoir hauteur_reservoir_inf+hauteur_reservoir_sup_cylindre/2];
    cm_reservoir_sup_cone = [0 rayon_navette+rayon_reservoir hauteur_reservoir_cylindre+hauteur_reservoir_cone/4];
    cm_reservoir = (masse_reservoir_inf * cm_reservoir_inf + masse_reservoir_sup_cylindre * cm_reservoir_sup_cylindre + masse_reservoir_sup_cone * cm_reservoir_sup_cone) / masse_reservoir;

    rayon_propulseur = 1.855;
    hauteur_propulseur_cylindre = 39.9;
    hauteur_propulseur_cone = 5.6;
    masse_propulseur = 469e+03;
    cm_propulseur_cylindre_x_pos = [rayon_reservoir+rayon_propulseur rayon_navette+rayon_reservoir hauteur_propulseur_cylindre/2];
    cm_propulseur_cylindre_x_neg = [-rayon_reservoir-rayon_propulseur rayon_navette+rayon_reservoir hauteur_propulseur_cylindre/2];
    volume_propulseur_cylindre = hauteur_propulseur_cylindre * pi * rayon_propulseur^2;
    volume_propulseur_cone = hauteur_propulseur_cone * pi * rayon_propulseur^2 / 3;
    volume_propulseur = volume_propulseur_cylindre + volume_propulseur_cone;
    mv_propulseur = masse_propulseur / volume_propulseur;
    masse_propulseur_cylindre = volume_propulseur_cylindre * mv_propulseur;
    masse_propulseur_cone = volume_propulseur_cone * mv_propulseur;
    cm_propulseur_cone_x_pos = [cm_propulseur_cylindre_x_pos(1) cm_propulseur_cylindre_x_pos(2) hauteur_propulseur_cylindre+hauteur_propulseur_cone/4];
    cm_propulseur_cone_x_neg = [cm_propulseur_cylindre_x_neg(1) cm_propulseur_cylindre_x_neg(2) hauteur_propulseur_cylindre+hauteur_propulseur_cone/4];
    cm_propulseur_x_pos = (masse_propulseur_cylindre * cm_propulseur_cylindre_x_pos + masse_propulseur_cone * cm_propulseur_cone_x_pos) / masse_propulseur;
    cm_propulseur_x_neg = (masse_propulseur_cylindre * cm_propulseur_cylindre_x_neg + masse_propulseur_cone * cm_propulseur_cone_x_neg) / masse_propulseur;

    masse_totale = masse_navette + masse_reservoir + masse_propulseur * 2;
    pcm = posNL + (masse_navette * cm_navette + masse_reservoir * cm_reservoir + masse_propulseur * (cm_propulseur_x_pos + cm_propulseur_x_neg)) / masse_totale;
end
