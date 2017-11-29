function [R d] = LigneRectangle(omega, intersectxy, poso, hCylindre, mCylindre)
	
	if omega(1) ~= 0
		t = intersectxy(1) - poso(1) / omega(1);
	elseif omega(2) ~= 0
		t = intersectxy(2) - poso(2) / omega(2);
	else
		error('there is no slope, only Zuul');	
	end

	r = poso + t*omega;
	
	if (r(3) < mCylindre(3)+hCylindre && r(3) > mCylindre(3)-hCylindre)
		R = r;
		d = 1;
 	else 
		R = NaN;
		d = 0;
	end	
