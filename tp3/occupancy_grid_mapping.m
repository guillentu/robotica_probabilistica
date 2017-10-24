
function l = occupancy_grid_mapping(l,x,z,res)
   % l tiene el tamaño de la grilla
   lo=log(0.5/(1-.5));
   % suponemos que solo avanza
   for i=[(x+res):res:((size(l,2)-1)*res)]
       if (i-z) < 20
           %%% modelo inverso del sensor
           if i < z
               prob= 0.3;
           elseif i >= z
               prob= 0.6;
           end
           aux=log(prob/(1-prob));
           l(i/res)=l(i/res)+aux - lo;
       else
           %l=l;          
       end
   end
end 