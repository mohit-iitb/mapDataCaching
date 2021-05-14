function cost=Chase(C,M,r,request_sequence,f_1)
  Delta=0;
  %r=0;
  cost1=0;
  for l=1:length(request_sequence)
    x=request_sequence(l);
    c=C(l);
         if x~=0 && r==0 %if the request is arrived and the service is not rented
        cost1=cost1+x;
         elseif  r==1 %if the service is rented then at each step check if renting is beneficial
        cost1=cost1+c+f_1(l);
        end
    Delta=min(M,max(0,Delta+x-c-f_1(l)));
    if Delta==M
      cost1=cost1+M*(r==0);
      r=1;
    elseif Delta==0 
      r=0;
    end
  end
  cost=cost1;
end