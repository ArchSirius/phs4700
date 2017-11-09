function [Coll tf raf vaf rbf vbf] = Devoir2(rai, vai, rbi, vbi, tb)
	deltaT = 0.01;
	minSpeed = 0.01;

	Coll = 1;
	tf = 0;
	raf = [rai(1); rai(2); ang_rot(vai)];
	vaf = vai.';
	rbf = [rbi(1); rbi(2); ang_rot(vbi)];
	vbf = vbi.';

	qa = [raf, vaf, [1; 0; 0]]
	qb = [rbf, vbf, [2; 0; 0]]

	tic
	while Coll ~= 0 && (norm([raf(1); raf(2)]) >= minSpeed || norm([rbf(1); rbf(2)]) >= minSpeed)
		qa = SEDRK4t0(qa, tf, deltaT, 'compute_break');	
		raf(3) = raf(3) + vai(3) * deltaT;
		
		if collision(raf, rbf) 
			break; 
		end
		
		if tf < tb
			g = 'compute_run';
		else
			g = 'compute_break';
			rbf(3) = rbf(3) + vbi(3) * deltaT;
		end
		qb = SEDRK4t0(qb, tf, deltaT, g);
		
		if collision(raf, rbf) 
                        break; 
                end

		tf = tf + deltaT;
		raf = qa(1,:);
        	rbf = qb(1,:);
        	vaf = qa(2,:);
        	vbf = qb(2,:);
	end
	toc
	raf = qa(1,:)
	rbf = qb(1,:)
	vaf = qa(2,:)
	vbf = qb(2,:)
