function out = get_indcs(pangle, n, lenproj)
% given projection data, this method will tell
% us the indx where 
y = [-n/2:n/2-1]/(n/2);
x = y';
xy = x*ones(1,n)+i*ones(n,1)*y;
xoff = real(xy*exp(i*pangle));
ndx = round(xoff*lenproj/2)+lenproj/2+1;
ndx = min(ndx, lenproj);
out = max(1,ndx);

end