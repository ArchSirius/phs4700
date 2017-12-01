function [xi yi zi face] = Devoir4(nout, nin, poso)
	N = 5;
	M = 5;

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
	angleAlpha = atan2(vecteur0(2), vecteur0(1));
	normeVecteur0 = norm([vecteur0(1) vecteur0(2)]);
	angleBeta = asin(rCylindre / normeVecteur0);

	phiMinus = angleAlpha - angleBeta
	phiPlus = angleAlpha + angleBeta
	
	xyVect = [rCylindre*cos(angleAlpha) rCylindre*sin(angleAlpha) 0];
	topCylindre = mCylindre + [0 0 hCylindre/2] + xyVect;
	bottomCylindre = mCylindre - [0 0 hCylindre/2] + xyVect;

	zDiffBottom = poso(3) - bottomCylindre(3);
	zDiffTop = topCylindre(3) - poso(3);
	posInt = [poso(1) poso(2) poso(3)-zDiffBottom];
	xyNorm = norm(bottomCylindre - posInt);

	thetaPlus = pi - atan(xyNorm/zDiffBottom) 
	thetaMinus = atan(xyNorm/zDiffTop)

	i = 0;
	j = 0;
	for n = 1:N
		for m = 1:M
			theta = thetaMinus+(thetaPlus-thetaMinus)/(2*N)*(2*n-1);
			phi = phiMinus+(phiPlus-phiMinus)/(2*M)*(2*m-1);
			omega = [sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta)];
			[intersectx intersecty d]= LineCircle(omega, poso, mCylindre, rCylindre, 1);
			if (d ~= 0)
				intersectxy = [intersectx intersecty];
				[R d] = LineRectangle(omega, intersectxy, poso, hCylindre, mCylindre, rCylindre) 
				%TODO verification si le hit est sur un des disque
				j = j+1
				if (d == 1)
					i = i+1
					[w1, isRefracted] = Refraction(R, omega, mCylindre, hCylindre, rCylindre, nin, nout)
					if isRefracted
						l = 0;
						while l<100 && ~isRefracted
							l=l+1;
							%Verification hit cube
						end	
					end
				end
			end
		end
		
	end
	i = i
