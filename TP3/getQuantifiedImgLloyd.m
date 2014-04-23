function lloyd = getQuantifiedImgLloyd( img, N )
%Initialisation
fMax = max(max(img));
q = fMax/N;

r = zeros(1,N);
d = zeros(1,N);

for i=1:N
    d(i+1)=i*q;
end
d
lloyd = img;

EQMold = 1000;
diffEQM = 1000;

while diffEQM > 0.01;
    %compute r
    for i = 1:N
      v = find( (img >= d(i) & img <= d(i+1)));
      r(i) = mean(img(v));
    end

    %compute d
    for i = 2:N
      d(i) = (r(i) + r(i-1))/2;
    end
    d
    %quantification
    for i = 1:N
      v = find(( img >= d(i) & img <= d(i+1)));
      lloyd(v) = r(i);      
    end


    EQMnew = mean(abs(lloyd - img).^2);
    diffEQM = abs(EQMnew - EQMold);
    EQMold = EQMnew;

end;
end
