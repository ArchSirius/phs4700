function k1 = compute_run(qi, deltaT)
	ri = qi(1,:);
	vi = qi(2,:);
	m = 1010;	

	R = position([ri(1); ri(2)], [vi(1); vi(2)]; [0;0], deltaT);
	deltaR = [ri(1);ri(2)] - [ri(1); ri(2)];

	k1 = [[deltaR; ri(3)]; [0; 0; vi(3)]; qi(3)];
