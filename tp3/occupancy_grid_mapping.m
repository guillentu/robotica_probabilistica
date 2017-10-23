
function l = occupancy_grid_mapping(l,x,z,res)
   % l tiene el tamaño de la grilla
   lo=0.5;
   % suponemos que solo avanza
   for i=(x+res):res:(size(l,2)*res)
       if (z-x) < 20
           %%% modelo inverso del sensor
           if i < z
               prob= 0.3;
           elseif i >= z
               prob= 0.6;
           end
           aux=log(prob/(1-prob));
           l(i/res)=l+aux - lo;
       else
           %l=l;          
       end
   end
end 