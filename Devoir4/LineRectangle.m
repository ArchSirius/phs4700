function [R d] = LineRectangle(omega, intersectxy, poso, hCylindre, mCylindre, rCylindre, isOut)
	if omega(1) ~= 0
		t = (intersectxy(1) - poso(1)) / omega(1);
	elseif omega(2) ~= 0
		t = (intersectxy(2) - poso(2)) / omega(2);
	else
		error('there is no slope, only Zuul');	
	end

  normal = [poso(1) - intersectxy(1) poso(2) - intersectxy(2) 0];
  x = intersectxy(1);
  y = intersectxy(2);
  maxz = mCylindre(3) + hCylindre/2;
  minz = mCylindre(3) - hCylindre/2;
  [d R] = linePlane(poso, omega, normal, [x y 0], x, x, y, y, minz, maxz);
  

%	r = poso + t*omega;
	
%	if (r(3) <= mCylindre(3)+hCylindre/2 && r(3) >= mCylindre(3)-hCylindre/2)
%		R = r;
%		d = 1;
%	else 
  if ~d
		if (omega(3)>0 || isOut) || (omega(3)<0 || isOut)
			z = mCylindre(3)-hCylindre/2;
		else
			z = mCylindre(3)+hCylindre/2;
		end
		
		t = (z - poso(3)) / omega(3);
		r = poso + t*omega;

		if norm(R(1:2)-mCylindre(1:2))<rCylindre
		  R = r;
		  d = 1;
		else
		  R = NaN;
		  d = 0;
		end
	end	
