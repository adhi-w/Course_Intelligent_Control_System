% Illustration of cylindrical extension of fuzzy sets


xx = (0:1:20)';
yy = (0:1:20)';

bell_x = gbell_mf(xx, [4, 2, 10]);
[x,y] = meshgrid(bell_x, yy);

subplot(221); plot(xx, bell_x);
xlabel('X'); ylabel('Membership Grades');
title('(a) Base Fuzzy Set A');
set(gca, 'xticklabel', []);

subplot(222); mesh(xx, yy, x);
view(-20, 30);
xlabel('X'); ylabel('y'); zlabel('Membership Grades');
set(gca, 'box', 'on');
set(gca, 'xticklabel', []); set(gca, 'yticklabel', []);
title('(b) Cylindrical Extension of A');
