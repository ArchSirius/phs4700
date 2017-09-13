function inertia = inertia_cone(m, r, h)
    ix = 3 * m / 20 * (r ^ 2 + 4 * h^2);
    iy = ix;
    iz = 3 * m * r ^ 2 / 10;
    inertia = [ix iy iz];