function [Coll tf raf vaf rbf vbf] = Devoir3(rai, vai, rbi, vbi, tb)
	deltaT = 0.002;
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
    axis([-20 400 -20 400]);
	tic
	while (norm([vaf(1) vaf(2)]) >= minSpeed || norm([vbf(1) vbf(2)]) >= minSpeed)
		rotated_positionA = rotated_position(raf, lona);
		rotated_positionB = rotated_position(rbf, lonb);
		xA = rotated_positionA(:, 1);
		yA = rotated_positionA(:, 2);
		if exist('pa')
		    delete(pa);
		    delete(pb);
		end
		pa = patch(xA, yA, 'green');
		
		xB = rotated_positionB(:, 1);
		yB = rotated_positionB(:, 2);
		pb = patch(xB, yB, 'yellow');
		drawnow;
		
    	[isCollision, hits] = collision(raf(3), rbf(3), rotated_positionA, rotated_positionB);
		if (isCollision)
		    [qa2, qb2] = postCollision(raf, vaf, rbf, vbf, hits);
		    qa = qa.';
		    qb = qb.';
		    qa(2,:) = qa2.';
		    qb(2,:) = qb2.';
		    qa = qa.';
            qb = qb.';
		    Coll = 0;
		    break; 
    	end
		
		qa = SEDRK4t0(qa, tf, deltaT, 'compute_break');	
		raf3 = raf(3) + vai(3) * deltaT;
		
		if tf < tb
			g = 'compute_run';
			rbf3 = rbf(3);
		else
			g = 'compute_break';
			rbf3 = rbf(3) + vbi(3) * deltaT;
		end
		qb = SEDRK4t0(qb, tf, deltaT, g);
		
		tf = tf + deltaT
	
		qaPrime = qa.';
		qbPrime = qb.';
		

		raf = qaPrime(1,:);
		raf(3) = raf3;
		rbf = qbPrime(1,:);
		rbf(3) = rbf3;
		vaf = qaPrime(2,:);
		vbf = qbPrime(2,:)
	end
	toc
	qaPrime = qa.';
	qbPrime = qb.';
	raf = qaPrime(1,:)
	rbf = qbPrime(1,:)
	vaf = qaPrime(2,:)
	vbf = qbPrime(2,:)
