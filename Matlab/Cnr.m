%% calculates C(n,r)= factorial(n)/factorial(f)*factorial(n-r)
function rescnr = Cnr(N)
i=1
cnr=0
factpartial = 0
for i=1:N
    disp(i)
    factpartial = (factorial(N) / (factorial(i)*factorial(N-i)))
    cnr = cnr + factpartial;
    factpartial = 0;
    disp(cnr);
end
rescnr = cnr;
disp('total is');
disp(rescnr);