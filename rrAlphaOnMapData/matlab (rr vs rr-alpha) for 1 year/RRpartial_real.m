function cost=RRpartial_real(C,M,r,request_sequence,alpha,forward,f_1)
  Delta1=0;
  Delta2=0;
  Delta3=0;
  r=0;
  cost1=0;
  n_1=0;
  n_alpha=0;
  n_0=0;
  for l=1:length(request_sequence)
    x=request_sequence(l);
    s=forward(l);
    %s=x;
    c=C(l);
%   c=0.4*x;
    Delta1=min(M,max(0,Delta1+x-c-f_1(l)));% no service is stored vs full stored
    Delta2=min(alpha*M,max(0,Delta2+x-s-alpha*c));%no service is stored vs alpha stored
    Delta3=min((1-alpha)*M,max(0,Delta3+s-((1-alpha)*c)-f_1(l)));%alpha is stored vs full stored
         if  r==0 %if the request is arrived and the service is not rented
           n_0=n_0+1;
        cost1=cost1+x;
            if Delta1==M && Delta2~=alpha*M 
              cost1=cost1+M;
               r=1;
             elseif Delta1~=M && Delta2==alpha*M 
              cost1=cost1+alpha*M;
              r=alpha;
             elseif Delta1==M && Delta2==alpha*M
                if   Delta3==0
                 cost1=cost1+alpha*M;
                r=alpha;
               else
               cost1=cost1+M;
               r=1;
               end
             end 
        elseif  r==alpha
             n_alpha=n_alpha+1;
         cost1=cost1+s+alpha*c;
             if Delta3==(1-alpha)*M && Delta2~=0
              cost1=cost1+(1-alpha)*M;
               r=1;
             elseif Delta3~=(1-alpha)*M && Delta2==0
              r=0;
             elseif Delta3==(1-alpha)*M && Delta2==0
              if   Delta1==0
                r=0;
               else
               cost1=cost1+(1-alpha)*M;
                r=1;
               end
             end 
         elseif  r==1 %if the service is rented then at each step check if renting is beneficial
             n_1=n_1+1;
        cost1=cost1+c;
            if Delta1~=0 && Delta3==0
               r=alpha;
             elseif Delta1==0 && Delta3~=0
              r=0;
             elseif Delta1==0 && Delta3==0
                if   Delta2==alpha*M
                r=alpha;
               else
               r=0;
               end
               
             end 
        end
    
    
     
  end
  
  cost=cost1;
%   cost = [n_0 n_alpha n_1];
end