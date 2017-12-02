function [xi yi zi face] = Devoir4(nout, nin, poso)
	N = 5;
	M = 5;

	hCylindre = 0.18;
	rCylindre = 0.02;
	mCylindre = [0.04 0.04 0.11];

	vecteur0 = mCylindre - poso;
	angleAlpha = atan2(vecteur0(2), vecteur0(1));
	normeVecteur0 = norm([vecteur0(1) vecteur0(2)]);
	angleBeta = asin(rCylindre / normeVecteur0);

	phiMinus = angleAlpha - angleBeta;
	phiPlus = angleAlpha + angleBeta;
	
	top = mCylindre + [rCylindre*cos(pi+angleAlpha) rCylindre*sin(pi+angleAlpha) hCylindre/2];
	bottom = mCylindre + [rCylindre*cos(pi+angleAlpha) rCylindre*sin(pi+angleAlpha) -hCylindre/2];
 
	if poso(3) < mCylindre(3)-hCylindre/2
		bottom = mCylindre + [rCylindre*cos(angleAlpha) rCylindre*sin(angleAlpha) -hCylindre/2];
	elseif poso(3) > mCylindre(3)+hCylindre/2
		top = mCylindre + [rCylindre*cos(angleAlpha) rCylindre*sin(angleAlpha) hCylindre/2];
	end

	vectTop = top - poso;
	vectBottom = bottom - poso;

	angleTop = atan2(vectTop(3), norm([vectTop(1) vectTop(2)]))
	angleBottom = atan2(vectBottom(3), norm([vectBottom(1) vectBottom(2)]))

	thetaPlus =  pi/2 - angleBottom
	thetaMinus =  pi/2 - angleTop

	hits = []


	i = 0
	j = 0
	for n = 1:N
		for m = 1:M
			theta = thetaMinus+(thetaPlus-thetaMinus)/(2*N)*(2*n-1);
			phi = phiMinus+(phiPlus-phiMinus)/(2*M)*(2*m-1);
			omega = [sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta)];
			[intersectx intersecty d]= LineCircle(omega, poso, mCylindre, rCylindre, 1);
			if (d ~= 0)
				j = j+1
				intersectxy = [intersectx intersecty];
				[R d] = LineRectangle(omega, intersectxy, poso, hCylindre, mCylindre, rCylindre, true) 
				if d 
					i = i+1
				end
				%[collision, face, r] = find_collision(R, omega, 0, mCylindre, hCylindre, rCylindre, nin, nout)
				collision = 0
				if collision
					hits = [hits; r(1) r(2) r(3) face];
				end
			end
		end
		
	end
	i=i
	j=j
