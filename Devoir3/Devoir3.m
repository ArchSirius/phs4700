function [Coll tf raf vaf rbf vbf] = Devoir2(rai, vai, rbi, vbi, tb)
	deltaT = 0.001;
	minSpeed = 0.01;

	Coll = 1;
	tf = 0;
	raf = [rai; ang_rot(vai)];
	vaf = vai;
	rbf = [rbi; ang_rot(vbi)];
	vbf = vbi;

	qa = [raf; vaf; 1];
	qb = [rbf; vbf; 2];

	tic
	while Coll ~= 0 && (norm([raf(1); raf(2)]) >= minSpeed || norm([rbf(1); rbf(2)]) >= minSpeed)
		qa = SEDRK4t0(qa, tf, deltaT, 'compute_break');
		raf(3) = raf(3) + vai(3) * deltaT; 
		...TODO determine collision
		if tf < tb
			g = 'compute_run';
		else
			g = 'compute_break';
			rbf(3) = rbf(3) + vbi(3) * deltaT;
		end
		qb = SEDRK4t0(qb, tf, deltaT, g);
		...TODO determine collision
		tf = tf + deltaT;
	end
	toc
