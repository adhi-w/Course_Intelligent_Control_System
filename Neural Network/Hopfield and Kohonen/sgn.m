function sgn1 = sgn(u,theta)
%sgn subfunction
for i=1:size(u,1)
    if gt(u(i),theta(i))
        sgn1(i,1)=1;
    elseif eq(u(i),theta(i))
        sgn1(i,1)=u(i);
    else
        sgn1(i,1)=-1;
    end
end