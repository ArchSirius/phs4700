function F_f = force_friction(m, v)
	g = -9.8
	velocity = [v(1); v(2)];
	speed = norm(velocity);
	mu = 0.075;
	if speed < 50
		mu = 0.15 * (1 - speed / 100);
	end
	F_f = -mu * m * g * velocity / speed;
