function Main()
    longNumber_Array = randi([0, 9], [1,10000000] )
    longNumber_Array1 =longNumber_Array
    tagsim(longNumber_Array1)
    %zarb(longNumber_Array)
    %Alg2_For(longNumber_Array1)
    Alg2_For(longNumber_Array1)

end

function zarb(longNumber_Array)
tic;

d=longNumber_Array*0.5;
f=[floor(d),0];
m = [0, mod(d, 1) * 10];
result=f+m;

toc;
end
function tagsim(longNumber_Array)
tic;

d = longNumber_Array / 2;
f = [floor(d), 0];
m = [0, mod(d, 1) * 10];
result = f + m;

toc;
end

function Alg2_For(longNumber_Array)

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

toc;

end
function Alg1_For(longNumber_Array)

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

toc;

end

