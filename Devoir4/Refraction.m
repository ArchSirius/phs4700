function [w1, isRefracted] =  Refraction(r, w0, mCylindre, hCylindre, nin, nout, isOut)
	if ~isOut
		tmp = nin;
		nin = nout;
		nout = tmp;
	end
	epsilon = 1e-10;
	low_z = mCylindre(3) - 0.5 * hCylindre;
	high_z  = mCylindre(3) + 0.5 * hCylindre;
	z = r(3);

	if z == low_z
		normal = [0 0 -1];
		if ~isOut
			normal = [normal(1) normal(2) -normal(3)];
		end
		z_offset = pi;
	elseif z == high_z
		normal = [0 0 1];
		if ~isOut
			normal = [normal(1) normal(2) -normal(3)];
		end
		z_offset = 0;
	else
		normal = [r(1)-mCylindre(1) r(2)-mCylindre(2) 0];
		if ~isOut
			normal = [-normal(1) -normal(2) normal(3)];
		end
		z_offset = pi/2;
	end

	w0_xy = w0(1:2);
	normal_xy = normal(1:2);
	phi_out = 0;
	if norm(w0_xy) ~= 0 && norm(normal_xy) ~= 0
		phi_in = acos(dot(w0_xy, normal_xy) / (norm(w0_xy) * norm(normal_xy) + epsilon));
		phi_out = asin(nin * sin(phi_in) / nout);
	end

	w0_xz = [norm(w0(1:2)) w0(3)];
	normal_xz = [norm(normal(1:2)) normal(3)];
	theta_in = acos(dot(w0_xz, normal_xz) / (norm(w0_xz) * norm(normal_xz) + epsilon));
	% TODO gerer reflextion total interne
	theta_out = asin(nin * sin(theta_in) / nout);

	angleNormal_xy = atan2(normal(2), normal(1));
	theta = z_offset - theta_out;
	phi = pi - phi_out + angleNormal_xy;
	w1 = [sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta)];
	isRefracted = 1;
	if abs(phi_out) > pi / 2 || abs(theta_out) > pi / 2
		isRefracted = 0;
	end
