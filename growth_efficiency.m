% salut Benoit, je m'excuse pour ma reponse tardive
% j'etait un peu submerge la semain derniere avec les proposal et le code
% en meme temps

% je reviens a present avec l'esprit plus clair.

% tu peux utiliser ce code pour voir plus facilement quel est to kap_G
% selon les valeur que tu mets dans pars_init:


[data, auxData, metaData, txtData, weights] = mydata_Ceriodaphnia_dubia;
[par, metaPar, txtPar] = pars_init_Ceriodaphnia_dubia(metaData);
 
 
 % kap_G = mu_V * d_V/ w_V/ E_G; -, growth conversion efficiency
 
 
 cp = parscomp_st(par); % computes compound parameters;
 
 fprintf('growth conversion efficiency kap_G is %1.2f \n',cp.kap_G) % print value of growth conversion efficiency to screen