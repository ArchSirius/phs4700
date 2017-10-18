function [coup, tf, rbf, vbf] = Devoir2(option, rbi, vbi, wbi) 

	deltaT = 0.1;
	coup = -1;
	tf = 0;
	rbf = rbi;
	vbf = vbi;

	while coup < 0 
		coup = coup_verification(rbf);
		if coup >= 0
			break
		end

		tf = tf + deltaT;
		...TODO
	end
