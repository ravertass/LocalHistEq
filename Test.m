clear all;

L = 256;

for i = 1:log2(L)
  a = 2^i;
  c{i} = zeros(a, 1);
end

c