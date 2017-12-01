function [R d] = LigneRectangle(omega, intersectxy, poso, hCylindre, mCylindre, rCylindre)
	omega = omega	
	if omega(1) ~= 0
		t = (intersectxy(1) - poso(1)) / omega(1);
	elseif omega(2) ~= 0
		t = (intersectxy(2) - poso(2)) / omega(2);
	else
		error('there is no slope, only Zuul');	
	end

	r = poso + t*omega;
	
	if (r(3) <= mCylindre(3)+hCylindre/2 && r(3) >= mCylindre(3)-hCylindre/2)
		R = r;
		d = 1;
 	else 
		if omega(3)>0
			z = mCylindre(3)-hCylindre/2;
		else
			z = mCylindre(3)+hCylindre/2;
		end
		
		t = (z - poso(3)) / omega(3);
		r = poso + t*omega

		norm_xy = norm(r(1:2)-mCylindre(1:2))

		if norm(r(1:2)-mCylindre(1:2))<rCylindre
			R = r;
			d = 1;
		else
			R = NaN;
			d = 0;
		end
	end	
