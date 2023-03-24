% Illustration of various MFs

x = 0:0.1:10;

mf = smf(x, [2 8]);
subplot(221); plot(x, mf);
axis([-inf inf 0 1.2]);
ylabel('Membership Grades'); title('(a) S-Function MF');
%set(gca, 'xticklabels', []);
set(gca, 'xtick', [0 2 4 6 8 10]);

mf = zmf(x, [4 6]);
subplot(222); plot(x, mf);
axis([-inf inf 0 1.2]);
ylabel('Membership Grades'); title('(b) Z-Function MF');
%set(gca, 'xticklabels', []);
set(gca, 'xtick', [0 2 4 6 8 10]);

mf = pimf(x, [1 6 6 10]);
subplot(223); plot(x, mf);
axis([-inf inf 0 1.2]);
ylabel('Membership Grades'); title('(c) Pi-Function MF');
%set(gca, 'xticklabels', []);
set(gca, 'xtick', [0 2 4 6 8 10]);

mf = pimf(x, [1 4 9 10]);
%mf = simplePi_mf(x, [6 3]);
subplot(224); plot(x, mf);
axis([-inf inf 0 1.2]);
ylabel('Membership Grades'); title('(d) 2-sided Pi MF');
%set(gca, 'xticklabels', []);
set(gca, 'xtick', [0 2 4 6 8 10]);
