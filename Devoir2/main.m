function main(option)
	if option ~= 1 && option ~= 2 && option ~= 3
		error('Unwanted option exception')
	end

	figure;

	% Essai 1
	disp('Essai 1')
	rbi = [0.00 0.50 1.10];
	vbi = [4.00 0.00 0.80];
	wbi = [0.00 -70.00 0.00];
	Devoir2(option, rbi, vbi, wbi)

	% Essai 2
	disp('Essai 2')
	rbi = [0.00 0.40 1.14];
	vbi = [10.00 1.00 0.20];
	wbi = [0.00 100.00 -50.00];
	Devoir2(option, rbi, vbi, wbi)

	% Essai 3
	disp('Essai 3')
	rbi = [2.74 0.50 1.14];
	vbi = [-5.00 0.00 0.20];
	wbi = [0.00 100.00 0.00];
	Devoir2(option, rbi, vbi, wbi)

	% Essai 4
	disp('Essai 4')
	rbi = [0.00 0.30 1.00];
	vbi = [10.00 -2.00 0.20];
	wbi = [0.00 10.00 -100.00];
	Devoir2(option, rbi, vbi, wbi)

	% Table
	x = [0 0 2.74 2.74];
	y = [0 1.525 1.525 0];
	z = [0.76 0.76 0.76 0.76];
	patch(x,y,z,'green')

	% Filet
	x = [0.5*2.74 0.5*2.74 0.5*2.74 0.5*2.74];
	y = [-0.1525 1.83-0.1525 1.83-0.1525 -0.1525];
	z = [0.76 0.76 0.76+0.1525 0.76+0.1525];
	patch(x,y,z,'yellow')

	view(3)
