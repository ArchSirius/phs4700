function [collision face r] = FindCollision(r0, v0, count, mCylindre, hCylindre, rCylindre, n_in, n_out)
	if count == 0
		v = Refraction(r0, v0, mCylindre, hCylindre, n_in, n_out);
	else
		v = Refraction(r0, v0, mCylindre, hCylindre, n_out, n_in);
	end

	[collision face r] = LineBox(r0, v);

	if ~collision
		[collision, r] = LineCylinder(r0, v, hCylindre, mCylindre, rCylindre);
		if collision && count <= 100
			[collision face r] = FindCollision(r, r - r0, count + 1, mCylindre, hCylindre, rCylindre, n_in, n_out);
		else
			collision = false;
		end
	end
