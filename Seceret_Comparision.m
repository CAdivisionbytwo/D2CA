longNumber_Array = randi([1, 9], [1,1000000] )


%-----------------------Multiplication by 5 Using VECTOR  Algorithm---------

tic;
d=longNumber_Array*5
f=[floor(d/10),0];
m = [0, mod(d, 10)];
result=f+m;
time_by_5_r=toc;


%------------------------------------Non Optimized REPLACEMENT Algorithm---------

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

time_no_r=toc;

%------------------------------------Optimized REPLACEMENT Algorithm---------

tic;
nDigits = length(longNumber_Array);
result = zeros(1, nDigits+1);
longNumber_Array = [0, longNumber_Array];
temp = longNumber_Array(2:end);

for i = 1:nDigits
    d1 = longNumber_Array(i);
    d2 = temp(i);
    d22=floor(d2/2);

    if (mod(d1, 2) == 1)
        result(i) = 5+d22;
    else
        result(i) = 0+d22;
    end

end
if (mod(longNumber_Array(end), 2) == 1)
    result(end) = 5;
end
time_op_r=toc;

%------------------------------------doing  with VECTOR Our Algorithm---------
tic;
d = longNumber_Array / 2;
f = [floor(d), 0];
m = [0, mod(d, 1) * 10];
result = f + m;

toc;
%------------------------------------doing  with for Our Algorithm---------
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

time_our_v=toc;



%------------------------------------doing  with for Our Algorithm---------
pp = parpool(nWorkers);
tic;
nDigits = length(longNumber_Array);
result = zeros(1, nDigits+1);
m = 0;
parfor i = 1:nDigits
    d = longNumber_Array(i) / 2;
    result(i) = floor(d) + m;
    m = mod(d, 1) * 10;
end

result(end) = m;

time_our_v=toc;


%----------------------Parelle Replacement Algorithm-----------------------


pp = parpool(2);

tic;

nDigits = length(longNumber_Array);
result = zeros(1, nDigits+1);
longNumber_Array = [0, longNumber_Array];
temp = longNumber_Array(2:end);

tic;
nDigits = length(longNumber_Array);
result = zeros(1, nDigits+1);
longNumber_Array = [0, longNumber_Array];
temp = longNumber_Array(2:end);

parfor i = 1:nDigits
    d1 = longNumber_Array(i);
    d2 = temp(i);
    d22=floor(d2/2);

    if (mod(d1, 2) == 1)
        result(i) = 5+d22;
    else
        result(i) = 0+d22;
    end

end
if (mod(longNumber_Array(end), 2) == 1)
    result(end) = 5;
end
time_pp=toc;

delete(pp);


