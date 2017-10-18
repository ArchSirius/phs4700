function [coup, tf, rbf, vbf] = Devoir2(option, rbi, vbi, wbi) 

	deltaT = 0.4;
	tf = 0;
	rbf = rbi;
	vbf = vbi;
  coup = -1;

  if option == 1
    g = 'option1';
  elseif option == 2
    g = 'option2';
  elseif option == 3
    g = 'option3';
  else
    error('Unwanted option exception')
  end
  
  q = [rbf; vbf; wbi; [0 0 0]]
	while coup < 5
    q = SEDRK4t0(q, tf, deltaT, g)
		tf = tf + deltaT
    q(4) = tf;
    coup = coup + 1
	end
