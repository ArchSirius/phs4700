function [coup] = coup_verification(rbi)

	rayon = 0.0199;

	if (rbi[1]<=rayon || rbi[1]>1.37-rayon) && (rbi[2]>=rayon || rbi[2]<=1.525-rayon) && (rbi[3]<=0.76+rayon)
		coup = 1;
	elseif (rbi[1]<1.37+rayon || rbi[1]>=2.74-rayon) && (rbi[2]>=rayon || rbi[2]<=1.525-rayon) && (rbi[3]<=0.76+rayon)
		coup = 0;
	elseif (rbi[1]>=1.37-rayon || rbi[1]<=1.37+rayon) && (rbi[2]>=rayon-0.1525 || rbi[2]<=1.6775+rayon) && (rbi[3]>=0.76+rayon || rbi[3]<=0.9125+rayon)
		coup = 2;
	elseif rbi[3]<=rayon
		coup = 3;
	else
		coup = -1;
	end
