function [Coll tf raf vaf rbf vbf] = Devoir2(rai, vai, rbi, vbi, tb)
	deltaT = 0.01;
	minSpeed = 0.01;

    lona = [4.78*0.5 1.82*0.5];
    lonb = [4.23*0.5 1.6*0.5];
	Coll = 1;
	tf = 0;
	raf = [rai(1); rai(2); ang_rot(vai)];
	vaf = vai.';
	rbf = [rbi(1); rbi(2); ang_rot(vbi)];
	vbf = vbi.';

	qa = [raf, vaf, [1; 0; 0]];
	qb = [rbf, vbf, [2; 0; 0]];
    
    axis manual;
    axis([-20 120 -20 120]);
	tic
	while Coll ~= 0 && (norm([raf(1); raf(2)]) >= minSpeed || norm([rbf(1); rbf(2)]) >= minSpeed)
        rotated_positionA = rotated_position(raf, lona);
        rotated_positionB = rotated_position(rbf, lonb);
        xA = rotated_positionA(:, 1)
        yA = rotated_positionA(:, 2)
        if exist('pa')
            delete(pa);
            delete(pb);
        end
        pa = patch(xA, yA, 'green');
        
        xB = rotated_positionB(:, 1);
        yB = rotated_positionB(:, 2);
        pb = patch(xB, yB, 'yellow');
        drawnow;
        
        if collision(raf(2), rbf(2), rotated_positionA, rotated_positionB)
			...TODO VALEURS INSTANT APRES COLLISION
			break; 
		end
        
		qa = SEDRK4t0(qa, tf, deltaT, 'compute_break');	
		raf(3) = raf(3) + vai(3) * deltaT;
		
		if tf < tb
			g = 'compute_run';
		else
			g = 'compute_break';
			rbf(3) = rbf(3) + vbi(3) * deltaT;
		end
		qb = SEDRK4t0(qb, tf, deltaT, g);
		
		tf = tf + deltaT;
	
		qaPrime = qa.';
		qbPrime = qb.';

		raf = qaPrime(1,:);
        rbf = qbPrime(1,:);
        vaf = qaPrime(2,:);
        vbf = qbPrime(2,:);
	end
	toc
	qaPrime = qa.';
        qbPrime = qb.';
	raf = qaPrime(1,:)
	rbf = qbPrime(1,:)
	vaf = qaPrime(2,:)
	vbf = qbPrime(2,:)
