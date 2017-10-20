figure;

% Essaie 1
rbi = [0 0.5 1.10];
vbi = [4 0 0.8];
wbi = [0 -70 0];
Devoir2(3, rbi, vbi, wbi)

% % % Essaie 2
rbi = [0 0.4 1.14];
vbi = [13 1 0.2];
wbi = [0 100 -50];
Devoir2(2, rbi, vbi, wbi)
% 
% % Essaie 3
rbi = [2.74 0.5 1.14];
vbi = [-5 0 0.2];
wbi = [0 100 0];
Devoir2(1, rbi, vbi, wbi)
% 
% % Essaie 4
rbi = [0 0.3 1.00];
vbi = [10 -2 0.2];
wbi = [0 10 -100];
Devoir2(3, rbi, vbi, wbi)

x = [0 0 2.74 2.74];
y = [0 1.525 1.525 0];
z = [0.76 0.76 0.76 0.76];
patch(x,y,z,'green')


x = [0.5*2.74 0.5*2.74 0.5*2.74 0.5*2.74];
y = [-0.1525 1.83-0.1525 1.83-0.1525 -0.1525];
z = [0.76 0.76 0.76+0.1525 0.76+0.1525];
patch(x,y,z,'yellow')

view(3)