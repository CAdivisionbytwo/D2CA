
longNumber_Array = randi([1, 9], [1,10000000] )

tic;
d=longNumber_Array*5
%r = rem(d,10)
%q = [(d-r)/10,0]
f=[floor(d/10),0]
m = [0, mod(d, 10)]
result=f+m
toc;


