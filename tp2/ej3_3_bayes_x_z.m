% Ej 3 3 Probabilidad P(x|z) = (lilelihood . Prior)/evidence

%  T0 T1 posiciones de las antenas
T=[12 5;...
    4 7];
% sedes 1=PC , 2=H
sedes=[10 6;
        8 3];
% Mediciones
d=[3.9;... % d0
   4.5];   % d1
sigma_z=[1; 1.5]
% probabilidad de estar en una sedes
prior=[0.3; 0.7];% PC H
% Likelihood
prob_PC=ej3_2_likelihood(d,T,[sedes(1,1);sedes(2,1)]);
prob_H=ej3_2_likelihood(d,T,[sedes(1,2);sedes(2,2)]);

% Bayes P(y|x) = likelihood.prior
prob_PC_Z=prob_PC*prior(1);
prob_H_Z=prob_H*prior(2);
nu=prob_PC_Z+prob_H_Z;
prob_PC_Z=prob_PC_Z/nu
prob_H_Z=prob_H_Z/nu