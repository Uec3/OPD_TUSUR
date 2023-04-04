function [y3] = KR(y2,z)
  y3 = ones(z,1);
  i1 = size(y2,2);
  i2 = size(y3,2);
  j1 = size(y2,1);
  j2 = size(y3,1);
  for i = 1:j2;
    x3(i,:) = [y2,zeros(j1,i2-1)];
  endfor
  k = j2;
  q3 = y3;
  m = i1 + (i2 - 1);
  y3 = zeros(k,m);
  for k = 1:j2;
    for m = 1:i1 + (i2 - 1);
      y3(k,m) = x3(k,m) * q3(k,:);
    endfor
  endfor
endfunction

function[y3] = CR(y2,z)
  y3 = zeros(1,z);
  i1 = size(y2,2);
  i2 = z;
  j1 = size(y2,1);
  j2 = 1;
  x3 = [y2,zeros(j1,i2-1)];
  k = j2;
  m = i1 + (i2 - 1);
  y3 = zeros(k,m);
  for k = 1:j2;
    for m = 1:i1 + (i2 - 1);
      if m==1
        y3(k,m) = x3(k,m)
      endif
      if m > 1 && m < i2 + 1
        y3(k,m) = x3(k,m) + y3(k,m-1)
      endif
      if m - i2 >=1
        y3(k,m) = x3(k,m) - x3(k,m-i2) + y3(k,m-1)      
      endif
    endfor
  endfor
endfunction
