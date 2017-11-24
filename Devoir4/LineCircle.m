function [x y] = LineCircle(slope, yOrigin, mCylindre, rCylindre)	

	d1 = [0 yOrigin] - [mCylindre(1) mCylindre(2)];
	d2 = [1 yOrigin+slope] - [mCylindre(1) mCylindre(2)];
	
	dx = d2(1) - d1(1);
	dy = d2(2) - d1(2);
	dr = sqrt(dx^2 + dy^2);
	D = d1(1) * d2(2) - d2(1) * d1(2);

	dySign = 1;
	if (dy < 0) 
		dySign = -1;
	end

	xPlus  = (D * dy + dySign * dx * sqrt(rCylindre^2 * dr^2 - D^2) / dr^2);
	xMinus = (D * dy - dySign * dx * sqrt(rCylindre^2 * dr^2 - D^2) / dr^2);
	yPlus  = (-D * dy + abs(dy) * sqrt(rCylindre^2 * dr^2 - D^2) / dr^2);
	yMinus = (-D * dy - abs(dy) * sqrt(rCylindre^2 * dr^2 - D^2) / dr^2);

	x = xPlus;
	y = yPlus;
