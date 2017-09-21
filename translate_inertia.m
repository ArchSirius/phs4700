function inertia=translate_inertia(ic, d, rc, m)
    dc = d - rc;
    Tdc = [[dc(2)^2 + dc(3)^2 ; -dc(2)*dc(1) ; -dc(3)*dc(1)] [-dc(1)*dc(2) ; dc(1)^2*dc(3)^2 ; -dc(3)*dc(2)] [-dc(1)*dc(3) ; -dc(2)*dc(3) ; dc(1)^2 + dc(2)^2]];
    inertia = diag(ic) + m * Tdc;
