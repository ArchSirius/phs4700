function [xi yi zi face] = Devoir4(nout, nin, poso)
	N = 100;
	M = 100;

	hCylindre = 0.18;
	rCylindre = 0.02;
	mCylindre = [0.04 0.04 0.11];

	mCube = [0.035 0.04 0.145];
	x1Cube = 3;
	x2Cube = 4;
	y1Cube = 3;
	y2Cube = 5;
	z1Cube = 12;
	z2Cube = 17;

	vecteur0 = mCylindre - poso;
	angle0 = atan2(vecteur0(2), vecteur0(1));
	normeVecteur0 = norm(vecteur0(1), vecteur0(2));
	angleAlpha = asin(rCylindre / normeVecteur0);

	thetaMinus = angle0 - angleAlpha;
	thetaPlus = angle0 + angleAlpha;
	
	xyVect = [rCylindre*cos(angle0) rCylindre*sin(angle0) 0];
	topCylindre = mCylindre + [0 0 hCylindre/2] + xyVect;
	bottomCylindre = mCylindre - [0 0 hCylindre/2] + xyVect;

	zDiffBottom = poso(3) - bottomCylindre(3);
	zDiffTop = topCylindre(3) - poso(3);
	posInt = [poso(1) poso(2) poso(3)-zDiffBottom];
	xyNorm = norm(bottomCylindre - posInt);

	phiPlus = pi - atan(xyNorm/zDiffBottom); 
	phiMinus = atan(xyNorm/zDiffTop);

	for n = 1:N
		for m = 1:M
			theta = thetaMinus+(thetaPlus-thetaMinus)/(2*N)*(2*n-1);
			phi = phiMinus+(phiPlus-phiMinus)/(2*M)*(2*m-1);
			omega = [sin(theta)cos(phi) sin(theta)sin(phi) cos(theta)]
			yOrigin = vecteur(2) - vecteur(1)*slope;
			[intersectx intersecty] = LineCircle(omega, poso, mCylindre, rCylindre)
			if (~isnan(intersectx) && ~isnan(intersecty))
				...TODO 
			end
		end
	end

