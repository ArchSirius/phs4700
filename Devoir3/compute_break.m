function k1 = compute_break(qi, deltaT)
	ri = qi(1,:);
	vi = qi(2,:);

	qi

	if qi(1,3)==1
		m = 1540;
	elseif qi(1,3)==2
		m = 1010;
	else
		error('Unwanted option exception')
	end


	F = force_friction(m, vi)
	A = acceleration(F, m)
	V = velocity([vi(1), vi(2)], deltaT, A)
	R = position([ri(1), ri(2)], [V(1), V(2)], A, deltaT)
	
	ri

	deltaR = [R(1)-ri(1),R(2)-ri(2)]
	deltaV = [V(1),V(2)] - [vi(1), vi(2)]
	k1 = [[deltaR, ri(3)].'; [deltaV, vi(3)].'; [0; 0; 0].'];
