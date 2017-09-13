function inertia=inertia_cylindre(m, r, h)
    ix = m / 12 * (3 * r ^ 2 + h ^ 2);
    iy = ix;
    iz = (m * r ^ 2) / 2;
    inertia = [ix iy iz];