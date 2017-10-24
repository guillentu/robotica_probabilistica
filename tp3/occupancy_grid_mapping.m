
function l = occupancy_grid_mapping(l,x,z,res)
   % l tiene el tamaño de la grilla
<<<<<<< HEAD
   lo=0.5;
   % suponemos que solo avanza
   for i=(x+res):res:(size(l,2)*res)
       if (z-x) < 20
=======
   lo=log(0.5/(1-.5));
   % suponemos que solo avanza
   for i=[(x+res):res:((size(l,2)-1)*res)]
       if (i-z) < 20
>>>>>>> affe96ee465fd681e71c73522b77fc1f75b4c320
           %%% modelo inverso del sensor
           if i < z
               prob= 0.3;
           elseif i >= z
               prob= 0.6;
           end
           aux=log(prob/(1-prob));
<<<<<<< HEAD
           l(i/res)=l+aux - lo;
=======
           l(i/res)=l(i/res)+aux - lo;
>>>>>>> affe96ee465fd681e71c73522b77fc1f75b4c320
       else
           %l=l;          
       end
   end
end 