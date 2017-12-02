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

	angleTop = atan2(vectTop(3), norm([vectTop(1) vectTop(2)]));
	angleBottom = atan2(vectBottom(3), norm([vectBottom(1) vectBottom(2)]));

	thetaPlus =  pi/2 - angleBottom;
	thetaMinus =  pi/2 - angleTop;

	xi = [];
	yi = [];
	zi = [];
	face = [];

	for n = 1:N
		for m = 1:M
			theta = thetaMinus+(thetaPlus-thetaMinus)/(2*N)*(2*n-1);
			phi = phiMinus+(phiPlus-phiMinus)/(2*M)*(2*m-1);
			omega = [sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta)];
			[intersectx intersecty d]= LineCircle(omega, poso, mCylindre, rCylindre, 1);
			if (d ~= 0)
				intersectxy = [intersectx intersecty];
				[R d] = LineRectangle(omega, intersectxy, poso, hCylindre, mCylindre, rCylindre);
				if d 
					%[collision, iFace, r] = find_collision(R, omega, 0, mCylindre, hCylindre, rCylindre, nin, nout)
					collision = 0;
					if collision
						xi = [xi; r(1)];
						yi = [yi; r(2)];
						zi = [zi; r(3)];
						face = [face; iFace];  
					end	
				end
			end
		end
		
	end

	Division = 18;
	n = 2*pi/Division;

	for i = 0:n-1
	  current = mCylindre + [rCylindre*cos(i*n) rCylindre*sin(i*n) 0];
	  currentTop = current + [0 0 hCylindre/2];
	  currentBottom = current - [0 0 hCylindre/2];
	  next = mCylindre + [rCylindre*cos(i*(n+1)) rCylindre*sin(i*(n+1))];
	  nextTop = next + [0 0 hCylindre/2];
          nextBottom = next - [0 0 hCylindre/2];
	  
	  plot3([currentTop(1) currentBottom(1)], [currentTop(2) currentBottom(2)], [currentTop(3) currentBottom(3)]);
	  plot3([currentTop(1) nextTop(1)], [currentTop(2) nextTop(2)], [currentTop(3) nextTop(3)]);
	  plot3([currentBottom(1) nextBottom(1)], [currentBottom(2) nextBottom(2)], [currentBottom(3) nextBottom(3)]);
	  drawnow;
	end	

	for i = 1:length(xi)
		if face(i)==1
			lineSpec = '.r';
		elseif face(i)==2
                        lineSpec = '.c';
		elseif face(i)==3
                        lineSpec = '.g';
		elseif face(i)==4
                        lineSpec = '.y';
		elseif face(i)==5
                        lineSpec = '.b';
		elseif face(i)==6
                        lineSpec = '.m';
		end
		plot3(xi(i), yi(i), zi(i), lineSpec);
		drawnow;
	end

