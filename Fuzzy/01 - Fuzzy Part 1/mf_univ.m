%x = [1 2 3 4 5 6 7 8];
%mf = [.1 .3 .8 1 .9 .5 .2 .1];
x = [0 1 2 3 4 5 6];
mf = [.1 .3 .7 1 .6 .2 .1];
subplot(2,2,1);
plot(x, mf, '*');
axis([-inf inf 0 1.2]);
hold on
for ii=1:length(x)
	plot([x(ii) x(ii)],[0 mf(ii)], '-');
end
hold off
%xlabel('X = Number of Courses');
xlabel('X = Number of Children');
ylabel('Membership Grades');
title('(a) Fuzzy: MF on a Discrete Universe');

x = 0:1:100;
mf = gbell_mf(x, [10, 2, 50]);
subplot(2,2,2);
plot(x, mf);
axis([-inf inf 0 1.2]);
xlabel('X = Age');
ylabel('Membership Grades');
title('(b) Fuzzy: MF on a Continuous Universe');

x = [0 1 2 3 4 5 6];
mf = [1 1 1 1 0 0 0];
subplot(2,2,3);
plot(x, mf, '*');
axis([-inf inf 0 1.2]);
hold on
for ii=1:length(x)
	plot([x(ii) x(ii)],[0 mf(ii)], '-');
end
hold off
%xlabel('X = Number of Courses');
xlabel('X = Number of Children');
ylabel('Membership Grades');
title('(c) Crisp: MF on a Discrete Universe');

x = 0:1:100;
mf=[zeros(1,51),ones(1,50)];
subplot(2,2,4);
plot(x, mf);
axis([-inf inf 0 1.2]);
xlabel('X = Age');
ylabel('Membership Grades');
title('(d) Crisp: MF on a Continuous Universe');
