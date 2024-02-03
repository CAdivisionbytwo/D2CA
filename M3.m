

longNumber_Array = randi([1, 9], [1,1000000] )

fId = fopen('Output.csv', 'w');
fprintf(fId, ' ,Alg1_Vec,Alg1_For,Alg2_Vec,Alg2_For,Alg3_For,Alg3_ParFor@1,Alg3_ParFor@2,Alg3_ParFor@3,Alg3_ParFor@4');

tic;
d=longNumber_Array*5
f=[floor(d/10),0];
m = [0, mod(d, 10)];
result=f+m;
toc;


tic;
d = longNumber_Array / 2;
f = [floor(d), 0];
m = [0, mod(d, 1) * 10];
result = f + m;

toc;