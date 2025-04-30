function [ya,A] = mtxfilter(a,x)

  %calculate signal length and length of kernel
  sigLen = length(x);
  coeffLen = length(a);

  n = sigLen;
  m = sigLen+coeffLen-1;
  
  A = zeros(m,n);
  
  for i = 1:n
    A(i:i+length(a)-1,i) = a;
  end

  ya = A*x';
end

