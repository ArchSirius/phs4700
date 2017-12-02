function [x y d] = LineCircle(omega, poso, mCylindre, rCylindre, normeCourte)	
	if omega(1) ~= 0 
		m = omega(2)/omega(1);
	else 
		m = inf;
	end

	c = poso(2) - m*poso(1);
	
	A = m^2 + 1;
	B = 2*(m*c - m*mCylindre(2) - mCylindre(1));
	C = mCylindre(1)^2 + mCylindre(2)^2 - 2*c*mCylindre(2) - rCylindre^2 + c^2;

	D = B^2 - 4*A*C;

	if D<0 
		d=0;
		x = NaN;
		y = NaN;
	elseif D==0 
		d=1;
		x = -B/(2*A);
		y = m*x + c;
	else 
		d=2;
		x1 = (-B+sqrt(D))/(2*A);
		x2 = (-B-sqrt(D))/(2*A);
		y1 = m*x1 + c;
		y2 = m*x2 + c;

		r1 = [x1 y1] - [poso(1) poso(2)];
		r2 = [x2 y2] - [poso(1) poso(2)];

			if ((norm(r1) < norm(r2) && normeCourte) || (norm(r1) > norm(r2) && ~normeCourte)) 
				x = x1;
				y = y1;
			else 
				x = x2;
				y = y2;
			end
	end
	SURLERAYON = norm([x y]-mCylindre(1:2))

