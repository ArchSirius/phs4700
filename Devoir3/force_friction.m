function F_f = force_friction(m, v)
    minSpeed = 0.01;
	g = 9.8;
	velocity = [v(1); v(2)]
	speed = norm(velocity)
	if speed < 50
		mu = 0.15 * (1 - (speed / 100));
    else
        mu = 0.075;
    end
    if speed < minSpeed / 2
        F_f = [0; 0]
    else
        F_f = -mu * m * g * velocity / speed
    end
