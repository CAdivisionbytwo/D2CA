function Main()

clc;

nDigits = [10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000]; % number of digits
MaxIter = 100; % number of iterations for each element of nDigits

fId = fopen('Output.csv', 'w');
fprintf(fId, ' ,Alg1_Vec,Alg1_For,Alg2_Vec,Alg2_For,Alg3_For,Alg3_ParFor@1,Alg3_ParFor@2,Alg3_ParFor@3,Alg3_ParFor@4');

for nd = 1:length(nDigits)
    fprintf('Digits #: %d\n', nDigits(nd));
    fprintf(fId, '\nDigits #: %d\n', nDigits(nd));
    for iter = 1:MaxIter
        fprintf('iter:%d\t', iter);
        longNumber_Array = randi([0, 9], [1, nDigits(nd)]);

        [~, exeTime1_Vec] = Alg1_Vector(longNumber_Array);
        [~, exeTime1_For] = Alg1_For(longNumber_Array);
        [~, exeTime2_Vec] = Alg2_Vector(longNumber_Array);
        [~, exeTime2_For] = Alg2_For(longNumber_Array);
        [~, exeTime3_For] = Alg3_For(longNumber_Array);
        [~, exeTime3_ParFor1] = Alg3_ParFor(longNumber_Array, 1);
        [~, exeTime3_ParFor2] = Alg3_ParFor(longNumber_Array, 2);
        [~, exeTime3_ParFor3] = Alg3_ParFor(longNumber_Array, 3);
        [~, exeTime3_ParFor4] = Alg3_ParFor(longNumber_Array, 4);

        fprintf(fId, '%2d,%f,%f,%f,%f,%f,%f,%f,%f,%f\n', iter, exeTime1_Vec, exeTime1_For, exeTime2_Vec, exeTime2_For, exeTime3_For, exeTime3_ParFor1, exeTime3_ParFor2, exeTime3_ParFor3, exeTime3_ParFor4);
    end
    fprintf('\n\n');
end

fclose(fId);

end

function [result, exeTime] = Alg1_Vector(longNumber_Array)

tic;

d = longNumber_Array / 2;
f = [floor(d), 0];
m = [0, mod(d, 1) * 10];
result = f + m;

exeTime = toc;

end

function [result, exeTime] = Alg1_For(longNumber_Array)

tic;

nDigits = length(longNumber_Array);
result = zeros(1, nDigits+1);

m = 0;
for i = 1:nDigits
    d = longNumber_Array(i) / 2;
    result(i) = floor(d) + m;
    m = mod(d, 1) * 10;
end

result(end) = m;

exeTime = toc;

end

function [result, exeTime] = Alg2_Vector(longNumber_Array)

tic;

d=longNumber_Array*5
f=[floor(d/10),0];
m = [0, mod(d, 10)];
result=f+m;

exeTime = toc;

end

function [result, exeTime] = Alg2_For(longNumber_Array)

tic;

nDigits = length(longNumber_Array);
result = zeros(1, nDigits+1);

m = 0;
for i = 1:nDigits
    d = longNumber_Array(i) * 0.5;
    result(i) = floor(d) + m;
    m = mod(d, 1) * 10;
end

result(end) = m;

exeTime = toc;

end

function [result, exeTime] = Alg3_For(longNumber_Array)

tic;

nDigits = length(longNumber_Array);
result = zeros(1, nDigits+1);
longNumber_Array = [0, longNumber_Array];

for i = 1:nDigits
    d1 = longNumber_Array(i);
    d2 = longNumber_Array(i+1);
    if (mod(d1, 2) == 0)
        switch (d2)
            case {0, 1}
                result(i) = 0;
            case {2, 3}
                result(i) = 1;
            case {4, 5}
                result(i) = 2;
            case {6, 7}
                result(i) = 3;
            case {8, 9}
                result(i) = 4;
        end
    else
        switch (d2)
            case {0, 1}
                result(i) = 5;
            case {2, 3}
                result(i) = 6;
            case {4, 5}
                result(i) = 7;
            case {6, 7}
                result(i) = 8;
            case {8, 9}
                result(i) = 9;
        end
    end
end

if (mod(longNumber_Array(end), 2) == 1)
    result(end) = 5;
end

exeTime = toc;

end

function [result, exeTime] = Alg3_ParFor(longNumber_Array, nWorkers)

pp = parpool(nWorkers);

tic;

nDigits = length(longNumber_Array);
result = zeros(1, nDigits+1);
longNumber_Array = [0, longNumber_Array];
temp = longNumber_Array(2:end);

parfor i = 1:nDigits
    d1 = longNumber_Array(i);
    d2 = temp(i);
    if (mod(d1, 2) == 0)
        switch (d2)
            case {0, 1}
                result(i) = 0;
            case {2, 3}
                result(i) = 1;
            case {4, 5}
                result(i) = 2;
            case {6, 7}
                result(i) = 3;
            case {8, 9}
                result(i) = 4;
        end
    else
        switch (d2)
            case {0, 1}
                result(i) = 5;
            case {2, 3}
                result(i) = 6;
            case {4, 5}
                result(i) = 7;
            case {6, 7}
                result(i) = 8;
            case {8, 9}
                result(i) = 9;
        end
    end
end

if (mod(longNumber_Array(end), 2) == 1)
    result(end) = 5;
end

exeTime = toc;

delete(pp);

end