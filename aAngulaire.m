function aAngulaire = aAngulaire(forces, centreDeMasse, mInertie, vAngulaire, angRot, positionsForces) 
	r = positionsForces - centreDeMasse;
	rotX = [[1;0;0] [0; cos(angRot); sin(angRot)] [0; -sin(angRot); cos(angRot)]];
	f_ang = (rotX * forces);
	tau = cross(r, f_ang, 2);
	L = vAngulaire * mInertie;
	tau_net = sum(tau, 1);
	aAngulaire = (tau_net + cross(L, vAngulaire)) * inv(mInertie);
