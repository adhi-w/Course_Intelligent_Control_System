% Illustration of intensifier

x = (-1:0.1:1)';
mf = tri_mf(x, [-1, 0, 1]);


Highly=mf.^3;
Very=mf.^2;
More_or_less=mf.^0.5;
Roughly=mf.^0.25;
all=[Highly Very mf More_or_less Roughly];
plot(x, all); xlabel('X = number'); ylabel('Membership Grades');
axis([-inf inf 0 1.1]);
title('x is close to 0');
text(0.3, 0.2, '"Highly" close to 0')
text(0.4, 0.3, '"Very" close to 0')
text(0.5, 0.4, 'Close to 0')
text(0.5, 0.6, '"More or less" close to 0')
text(0.65, 0.7, '"Roughly" close to 0')
