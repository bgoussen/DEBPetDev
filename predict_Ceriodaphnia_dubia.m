%% predict_my_pet
% Obtains predictions, using parameters and data

%%
function [prdData, info] = predict_Ceriodaphnia_dubia(par, data, auxData)
% created by Starrlight Augustine, Dina Lika, Bas Kooijman, Goncalo Marques and Laure Pecquerie 2015/01/30;
% last modified 2015/07/29

%% Syntax
% [prdData, info] = <../predict_my_pet.m *predict_my_pet*>(par, data, auxData)

%% Description
% Obtains predictions, using parameters and data
%
% Input
%
% * par: structure with parameters (see below)
% * data: structure with data (not all elements are used)
% * auxData : structure with temp data and other potential environmental data
%
% Output
%
% * prdData: structure with predicted values for data
% * info: identified for correct setting of predictions (see remarks)

%% Remarks
% Template for use in add_my_pet.
% The code calls <parscomp_st.html *parscomp_st*> in order to compute
% scaled quantities, compound parameters, molecular weights and compose
% matrixes of mass to energy couplers and chemical indices.
% With the use of filters, setting info = 0, prdData = {}, return, has the effect
% that the parameter-combination is not selected for finding the
% best-fitting combination; this setting acts as customized filter.

%% Example of a costumized filter
% See the lines just below unpacking

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


% customized filter
if k * v_Hp >= f_tL^3  % constraint required for reaching puberty with f_tL
    info = 0;
    prdData = {};
    return
end

if ~reach_birth(g, k, v_Hb, f_tL) % constraint required for reaching birth with f_tL
    info = 0;
    prdData = {};
    return;
end

if f_tL_T15_f1 <= 0 | f_tL_T15_f2 <= 0 | f_tL_T15_f3 <= 0 | f_tR <= 0 ...
        | f_tR_flim <= 0 | f_tS <= 0 | f_tS_flim <= 0  % constraint required f
    info = 0;
    prdData = {};
    return
end


% compute temperature correction factors
TC_ab = tempcorr(temp.ab, T_ref, T_A);
TC_ap = tempcorr(temp.ap, T_ref, T_A);
TC_am = tempcorr(temp.am, T_ref, T_A);
TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
% temperature correction factor for each length univariate data
TC_tL_T15_f1 = tempcorr(temp.tL_T15_f1, T_ref, T_A);
TC_tL_T20_f1 = tempcorr(temp.tL_T20_f1, T_ref, T_A);
TC_tL_T25_f1 = tempcorr(temp.tL_T25_f1, T_ref, T_A);
TC_tL_T15_f2 = tempcorr(temp.tL_T15_f2, T_ref, T_A);
TC_tL_T20_f2 = tempcorr(temp.tL_T20_f2, T_ref, T_A);
TC_tL_T25_f2 = tempcorr(temp.tL_T25_f2, T_ref, T_A);
TC_tL_T15_f3 = tempcorr(temp.tL_T15_f3, T_ref, T_A);
TC_tL_T20_f3 = tempcorr(temp.tL_T20_f3, T_ref, T_A);
TC_tL_T25_f3 = tempcorr(temp.tL_T25_f3, T_ref, T_A);
% BGo Others (all those in auxData.temp??


% uncomment if you need this for computing moles of a gas to a volume of gas
% - else feel free to delete  these lines
% molar volume of gas at 1 bar and 20 C is 24.4 L/mol
% T = C2K(20); % K, temp of measurement equipment- apperently this is
% always the standard unless explicitely stated otherwise in a paper (pers.
% comm. Mike Kearney).
% X_gas = T_ref/ T/ 24.4;  % M,  mol of gas per litre at T_ref and 1 bar;

% zero-variate data

% life cycle
pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Lw_b = L_b/ del_M;                % cm, physical length at birth at f
Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth at f (remove d_V for wet weight)
aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty (remove d_V for wet weight)
aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

% ultimate
l_i = f - l_T;                    % -, scaled ultimate length at f
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

% pack to output
% the names of the fields in the structure must be the same as the data names in the mydata file
prdData.ab = aT_b;
prdData.ap = aT_p;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Li = Lw_i;
prdData.Wdb = Wd_b;
prdData.Wdp = Wd_p;
prdData.Wdi = Wd_i;
prdData.Ri = RT_i;

% uni-variate data

%% Time-length
% T15_f1 %BGo BEST WAY TO DO OR USE OF auxData FOR THE DIFFERENTS TEMPERATURES ?
f = f_tL_T15_f1; pars_lb = [g; k; v_Hb];                          % compose parameters
ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
ELw_T15_f1 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_T15_f1 * r_B * tL_T15_f1(:,1)); % cm, expected physical length at time
%
% T20_f1 %BGo BEST WAY TO DO OR USE OF auxData FOR THE DIFFERENTS TEMPERATURES ?
f = f_tL_T15_f1; pars_lb = [g; k; v_Hb];                          % compose parameters
ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
ELw_T20_f1 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_T20_f1 * r_B * tL_T20_f1(:,1)); % cm, expected physical length at time
%
% T25_f1 %BGo BEST WAY TO DO OR USE OF auxData FOR THE DIFFERENTS TEMPERATURES ?
f = f_tL_T15_f1; pars_lb = [g; k; v_Hb];                          % compose parameters
ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
ELw_T25_f1 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_T25_f1 * r_B * tL_T25_f1(:,1)); % cm, expected physical length at time
%
% T15_f2 %BGo BEST WAY TO DO OR USE OF auxData FOR THE DIFFERENTS TEMPERATURES ?
f = f_tL_T15_f2; pars_lb = [g; k; v_Hb];                          % compose parameters
ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
ELw_T15_f2 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_T15_f2 * r_B * tL_T15_f2(:,1)); % cm, expected physical length at time
%
% T20_f2 %BGo BEST WAY TO DO OR USE OF auxData FOR THE DIFFERENTS TEMPERATURES ?
f = f_tL_T15_f2; pars_lb = [g; k; v_Hb];                          % compose parameters
ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
ELw_T20_f2 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_T20_f2 * r_B * tL_T20_f2(:,1)); % cm, expected physical length at time
%
% T25_f2 %BGo BEST WAY TO DO OR USE OF auxData FOR THE DIFFERENTS TEMPERATURES ?
f = f_tL_T15_f2; pars_lb = [g; k; v_Hb];                          % compose parameters
ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
ELw_T25_f2 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_T25_f2 * r_B * tL_T25_f2(:,1)); % cm, expected physical length at time
%
% T15_f3 %BGo BEST WAY TO DO OR USE OF auxData FOR THE DIFFERENTS TEMPERATURES ?
f = f_tL_T15_f3; pars_lb = [g; k; v_Hb];                          % compose parameters
ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
ELw_T15_f3 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_T15_f3 * r_B * tL_T15_f3(:,1)); % cm, expected physical length at time
%
% T20_f3 %BGo BEST WAY TO DO OR USE OF auxData FOR THE DIFFERENTS TEMPERATURES ?
f = f_tL_T15_f3; pars_lb = [g; k; v_Hb];                          % compose parameters
ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
ELw_T20_f3 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_T20_f3 * r_B * tL_T20_f3(:,1)); % cm, expected physical length at time
%
% T25_f3 %BGo BEST WAY TO DO OR USE OF auxData FOR THE DIFFERENTS TEMPERATURES ?
f = f_tL_T15_f3; pars_lb = [g; k; v_Hb];                          % compose parameters
ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
ELw_T25_f3 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_T25_f3 * r_B * tL_T25_f3(:,1)); % cm, expected physical length at time

%% Reproduction
% T 25 (reference temperature), 
f = f_tR; pars_R = [kap ; kap_R ; g; k_J; k_M; L_T; v; U_Hb; U_Hp ];
[EN ElN UE0] = cum_reprod(tR(:,1), f, pars_R); % cumulative number of eggs, UE0. % BGo parameter Lf not included in cum_reprod. TO INCLUDE?
%
% T 25 (reference temperature), f limited
f = f_tR_flim; pars_R = [kap ; kap_R ; g; k_J; k_M; L_T; v; U_Hb; U_Hp ];
[EN_flim ElN_flim UE0_flim] = cum_reprod(tR_flim(:,1), f, pars_R); % cumulative number of eggs, UE0 % BGo parameter Lf not included in cum_reprod. TO INCLUDE?

% kappa; kappa_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp
%% Survival


%% length-weight
% EWw = (LW(:,1) * del_M).^3 * (1 + f * w);                   % g, expected wet weight at time

% pack to output
% the names of the fields in the structure must be the same as the data names in the mydata file
prdData.tL_T15_f1 = ELw_T15_f1;
prdData.tL_T20_f1 = ELw_T20_f1;
prdData.tL_T25_f1 = ELw_T25_f1;
prdData.tL_T15_f2 = ELw_T15_f2;
prdData.tL_T20_f2 = ELw_T20_f2;
prdData.tL_T25_f2 = ELw_T25_f2;
prdData.tL_T15_f3 = ELw_T15_f3;
prdData.tL_T20_f3 = ELw_T20_f3;
prdData.tL_T25_f3 = ELw_T25_f3;
prdData.tR = EN;
prdData.tR_flim = EN_flim;
%prdData.tS = ES;
%prdData.tS_flim = ES_flim;
% prdData.LW = EWw;