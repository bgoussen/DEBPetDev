%% mydata_my_pet
% Sets referenced data

%%
function [data, auxData, metaData, txtData, weights] = mydata_Ceriodaphnia_dubia
% created by Starrlight Augustine, Bas Kooijman, Dina Lika, Goncalo Marques and Laure Pecquerie 2015/03/31
% last modified: 2015/07/28

%% Syntax
% [data, auxData, metaData, txtData, weights] = <../mydata_my_pet.m *mydata_my_pet*>

%% Description
% Sets data, pseudodata, metadata, auxdata, explanatory text, weights coefficients.
% Meant to be a template in add-my-pet
%
% Output
%
% * data: structure with data
% * auxData: structure with auxilliairy data that is required to compute predictions of data (e.g. temperature, food.).
%   auxData is unpacked in predict and the user needs to construct predictions accordingly.
% * txtData: text vector for the presentation of results
% * metaData: structure with info about this entry
% * weights: structure with weights for each data set

%% Remarks
% Plots with the same labels and units can be combined into one plot by assigning a cell string with dataset names to metaData.grp,sets, and a caption to metaData.grp.caption.

%% To do (remove these remarks after editing this file)
% * copy this template; replace 'my_pet' by the name of your species (Genus_species)
% * fill in metaData fields with the proper information
% * insert references for each data (an example is given), for multiple references, please use commas to separate references
% * edit real data; remove all data that to not belong to your pet
% * list facts - this is where you can add relevant/interesting information on its biology
% * edit discussion concerning e.g. choice of model, assumptions needed to model certain data sets etc.
% * fill in all of the references

%% set metaData

metaData.phylum     = 'Arthropoda';
metaData.class      = 'Branchiopoda';
metaData.order      = 'Cladocera';
metaData.family     = 'Daphniidae';
metaData.species    = 'Ceriodaphnia_dubia';
metaData.species_en = 'Ceriodaphnia_dubia';
metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-W'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Benoit Goussen'};            % put names as authors as separate strings:  {'FirstName1 LastName2','FirstName2 LastName2'} , with corresponding author in first place
metaData.date_subm = [2015 08 27];                       % [year month day], date at which the entry is submitted
metaData.email    = {'benoit.goussen@york.ac.uk'};              % e-mail of corresponding author
metaData.address  = {'Environment Department , University of York, Heslington, York, United Kingdom'};   % affiliation, postcode, country of the corresponding author

% uncomment and fill in the following fields when the entry is updated:
% metaData.author_mod_1  = {'FirstName3 LastName3'};          % put names as authors as separate strings:  {'author1','author2'} , with corresponding author in first place
% metaData.date_mod_1    = [2017 09 18];                      % [year month day], date modified entry is accepted into the collection
% metaData.email_mod_1   = {'myname@myuniv.univ'};            % e-mail of corresponding author
% metaData.address_mod_1 = {'affiliation, zipcode, country'}; % affiliation, postcode, country of the corresponding author

% for curators only ------------------------------
% metaData.curator     = {'FirstName LastName'};
% metaData.email_cur   = {'myname@myuniv.univ'};
% metaData.date_acc    = [2015 04 22];
%-------------------------------------------------

%% set data
% zero-variate data;
% typically depend on scaled functional response f.
% here assumed to be equal for all real data; the value of f is specified in pars_init_my_pet.
% add an optional comment structure to give any additional explanations on
% how the value was chosen, see the last column of the ab data set for an
% example

% age 0 is at onset of embryo development
data.ab = 0;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'None';   comment.ab  = ''; % % BGo TO BE COMPLETED
temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
% observed age at birth is frequently larger than ab, because of diapauzes during incubation
data.ap = 4.4;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'Henry2004';     comment.ap = 'Determined by using the mean of 5 control replicates.'; % BGo TO BE CHECKED
temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
% observed age at puberty is frequently larger than ap,
%   because allocation to reproduction starts before first eggs appear
data.am = 23.1;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Stewart1998'; comment.am = 'In control water, see table 2 in Stewart1998';   % BGo COMPLETED
temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; % BGo COMPLETED
% (accounting for aging only)

%{

BGo TO BE COMPLETED

% Please specify what type of length measurement is used for your species.
% We put here snout-to-vent length, but you should change this depending on your species:
data.Lb  = 0.45;   units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'Anon2015';
data.Lp  = 2.36;   units.Lp  = 'cm';   label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = {'Anon2015','Wiki'}; % for multiple references, please use commas to separate references
data.Li  = 6.25;   units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Wiki';

data.Wdb = 5.8e-5; units.Wdb = 'g';    label.Wdb = 'dry weights at birth';             bibkey.Wdb = 'Anon2015';
data.Wdp = 8e-3;   units.Wdp = 'g';    label.Wdp = 'dry weights at puberty';           bibkey.Wdp = 'Anon2015';
data.Wdi = 0.15;   units.Wdi = 'g';    label.Wdi = 'ultimate dry weights';             bibkey.Wdi = 'Wiki';

data.Ri  = 2.3;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';              bibkey.Ri  = 'Wiki';
% for an individual of ultimate length Li
temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; % BGo COMPLETED


%}

% uni-variate data

% uni-variate data at f1 = ? and temp = 15 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T15_f1 = [0 0.98 1.989	2.984 3.99 4.991 5.992 6.997 7.993;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    109.349 350 449.723 513.731 566.571 628.576 519.29 573.319 654.256]';  % µm, carapace length at f and T
units.tL_T15_f1   = {'d', 'µm'};  label.tL_T15_f1 = {'time since birth', 'carapace length'};  bibkey.tL_T15_f1 = 'GamaFlores2011';
temp.tL_T15_f1    = C2K(15);  units.temp.tL_T15_f1 = 'K'; label.temp.tL_T15_f1 = 'temperature';
comment.tL_T15_f1 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f1 = ? and temp = 20 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T20_f1 = [0	0.986	1.989	2.978	3.99	4.995	5.985	6.995	8.001;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    112.471	319.052	429.73	577.538	557.413	686.37	529.764	637.549	404.958]';  % µm, carapace length at f and T
units.tL_T20_f1   = {'d', 'µm'};  label.tL_T20_f1 = {'time since birth', 'carapace length'};  bibkey.tL_T20_f1 = 'GamaFlores2011';
temp.tL_T20_f1    = C2K(20);  units.temp.tL_T20_f1 = 'K'; label.temp.tL_T20_f1 = 'temperature';
comment.tL_T20_f1 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f1 = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T25_f1 = [0	0.985	1.993	2.987	3.991	4.991	5.994	6.993	7.996;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    113.469	488.942	582.338	538.273	569.941	548.191	636.062	847.38	634.053]';  % µm, carapace length at f and T
units.tL_T25_f1   = {'d', 'µm'};  label.tL_T25_f1 = {'time since birth', 'carapace length'};  bibkey.tL_T25_f1 = 'GamaFlores2011';
temp.tL_T25_f1    = C2K(25);  units.temp.tL_T25_f1 = 'K'; label.temp.tL_T25_f1 = 'temperature';
comment.tL_T25_f1 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field




% uni-variate data at f2 = ? and temp = 15 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T15_f2 = [0	0.955	1.979	2.973	3.976	4.987	5.987	6.996	8.01;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    103.981	432.727	483.201	496.386	447.433	646.878	525.879	492.223	500.406]';  % µm, carapace length at f and T
units.tL_T15_f2   = {'d', 'µm'};  label.tL_T15_f2 = {'time since birth', 'carapace length'};  bibkey.tL_T15_f2 = 'GamaFlores2011';
temp.tL_T15_f2    = C2K(15);  units.temp.tL_T15_f2 = 'K'; label.temp.tL_T15_f2 = 'temperature';
comment.tL_T15_f2 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f2 = ? and temp = 20 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T20_f2 = [0	1.012	2.067	2.993	3.995	4.999	6	6.996	8.005;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    105.899	400.166	503.135	529.781	566.47	625.342	410.744	413.638	443.412]';  % µm, carapace length at f and T
units.tL_T20_f2   = {'d', 'µm'};  label.tL_T20_f2 = {'time since birth', 'carapace length'};  bibkey.tL_T20_f2 = 'GamaFlores2011';
temp.tL_T20_f2    = C2K(20);  units.temp.tL_T20_f2 = 'K'; label.temp.tL_T20_f2 = 'temperature';
comment.tL_T20_f2 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f2 = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T25_f2 = [0	0.979	1.987	2.985	3.985	4.993	5.989	6.992	7.994;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    106.05	531.11	445.971	524.141	456.768	471.367	509.589	648.009	530.604]';  % µm, carapace length at f and T
units.tL_T25_f2   = {'d', 'µm'};  label.tL_T25_f2 = {'time since birth', 'carapace length'};  bibkey.tL_T25_f2 = 'GamaFlores2011';
temp.tL_T25_f2    = C2K(25);  units.temp.tL_T25_f2 = 'K'; label.temp.tL_T25_f2 = 'temperature';
comment.tL_T25_f2 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f3 = ? and temp = 15 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T15_f3 = [0	0.985	2.078	2.981	3.961	4.983	5.98	6.981	8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    109.779	365.947	457.719	600.361	527.963	621.997	477.678	408.067	361.475]';  % µm, carapace length at f and T
units.tL_T15_f3   = {'d', 'µm'};  label.tL_T15_f3 = {'time since birth', 'carapace length'};  bibkey.tL_T15_f3 = 'GamaFlores2011';
temp.tL_T15_f3    = C2K(15);  units.temp.tL_T15_f3 = 'K'; label.temp.tL_T15_f3 = 'temperature';
comment.tL_T15_f3 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f3 = ? and temp = 20 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T20_f3 = [0	0.981	1.98	2.98	3.961	4.982	5.981	6.981	8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    112.401	362.151	526.42	558.538	622.427	674.752	405.898	383.37	424.281]';  % µm, carapace length at f and T
units.tL_T20_f3   = {'d', 'µm'};  label.tL_T20_f3 = {'time since birth', 'carapace length'};  bibkey.tL_T20_f3 = 'GamaFlores2011';
temp.tL_T20_f3    = C2K(20);  units.temp.tL_T20_f3 = 'K'; label.temp.tL_T20_f3 = 'temperature';
comment.tL_T20_f3 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f3 = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T25_f3 = [0	0.98	1.98	2.979	3.962	4.979	5.98	6.979	8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    114.754	487.705	384.375	464.906	496.49	490.514	539.344	573.928	593.852]';  % µm, carapace length at f and T
units.tL_T25_f3   = {'d', 'µm'};  label.tL_T25_f3 = {'time since birth', 'carapace length'};  bibkey.tL_T25_f3 = 'GamaFlores2011';
temp.tL_T25_f3    = C2K(25);  units.temp.tL_T25_f3 = 'K'; label.temp.tL_T25_f3 = 'temperature';
comment.tL_T25_f3 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field




% uni-variate data at f = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Mean reproduction
data.tR = [4.037 5.079 6.051 7.054 8.019 9.083 10.042 11.054 12.033 13.048 14.062 15.044 16.008 16.982 18.041 18.968 20.066 21.123 22.095 23.067 24.08 25.176 26.101 28.092 29.142;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    5.098 10.099 9.535 13.196 15.109 11.826 15.973 16.141 13.019 12.091 11.812 7.31 9.589 8.336 6.879 7.372 6.972 6.043 5.48 4.998 4.841 5.131 6.476 3.401 5.234]';  % #, mean reproduction at f and T
units.tR   = {'d', '#'};  label.tR = {'time since birth', 'Reproduction'};  bibkey.tR = 'Stewart1998';
temp.tR    = C2K(25);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
comment.tR = 'Extracted from figure 3 of Stewart1998. Day 0 considered as hatching'; % optional field


% uni-variate data at f limited = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Mean reproduction
data.tR_flim = [10.078	11.174	12.488	14.953	17.034	18.13	19.061	19.992	21.197	22.074	23.059	24.21	25.962	27.222	29.03	31.166	36.753	37.793;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    1.31	1.831	1.377	1.477	1.577	1.578	2.424	3.238	3.012	2.394	1.355	1.486	1.26	1.716	1.718	1.72	1.367	1.564]';  % #, mean reproduction at f and T
units.tR_flim   = {'d', '#'};  label.tR_flim = {'time since birth', 'Reproduction'};  bibkey.tR_flim = 'Stewart1998';
temp.tR_flim    = C2K(25);  units.temp.tR_flim = 'K'; label.temp.tR_flim = 'temperature';
comment.tR_flim = 'Extracted from figure 4 (curve non filtered no food added) of Stewart1998. Day 0 considered as hatching'; % optional field




% uni-variate data at f limited = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Survival ad libitum
data.S = [1.071	2.189	3.121	4.176	5.170	6.164	7.096	7.965	8.959	10.014	11.002	12.182	13.300	14.042	15.036	15.776	17.014	17.881	18.813	19.984	21.289	22.155	23.087	24.076	25.068	26.124	27.116	27.982	28.971	30.148	30.816	32.183	33.175	34.105	35.096	35.963;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    49.779	49.774	49.770	49.642	49.638	49.758	49.630	49.627	49.746	48.999	45.280	45.399	45.270	42.914	42.910	39.935	36.958	35.592	35.588	29.763	29.881	27.896	28.016	25.040	23.797	23.545	22.551	20.442	17.094	15.108	5.817	5.688	4.445	3.451	1.589	0.471]';  % #, mean reproduction at f and T
units.S   = {'d', '#'};  label.S = {'time since birth', 'Survival'};  bibkey.S = 'Stewart1998';
temp.S    = C2K(25);  units.temp.S = 'K'; label.temp.S = 'temperature';
comment.S = 'Extracted from figure 1 (control curve) of Stewart1998. Day 0 considered as hatching'; % optional field




% uni-variate data at f = 0 and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Survival starvation
data.S_flim = [0.692	1.732	2.727	3.678	4.795	5.756	6.886	7.936	8.815	9.798	10.797	11.873	12.856	13.977;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    49.895	47.183	45.476	44.858	44.848	39.076	25.969	15.487	6.226	1.377	1.753	1.546	0.937	0.595]';  % #, mean reproduction at f and T
units.S_flim   = {'d', '#'};  label.S_flim = {'time since birth', 'Survival'};  bibkey.S_flim = 'Stewart1998';
temp.S_flim    = C2K(25);  units.temp.S_flim = 'K'; label.temp.S_flim = 'temperature';
comment.S_flim = 'Extracted from figure 1 (Lake Reality outfall water filtered, no food added) of Stewart1998. Day 0 considered as hatching'; % optional field





% data.LW = [0.9 1.8 3.2 4.3 5.0;      % cm, snout-to-vent length at f
%            0.004 0.03 0.20 0.55 1.1]';   % g, wet weights at f and T
% units.LW = {'cm', 'g'};     label.LW = {'snout to vent length', 'wet weights'};  bibkey.LW = 'Anon2015';
% comment.LW = 'Put here any relevant remarks about this data'; % optional field



%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights (remove these remarks after editing the file)
% the weights were set automatically with the function setweigths,
% if one wants to ovewrite one of the weights it should always present an explanation example:
%
% zero-variate data:
% weights.Wdi = 100 * weights.Wdi; % Much more confidence in the ultimate dry
%                                % weights than the other data points
% uni-variate data:
% weights.tL = 2 * weights.tL;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weights.psd)
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% overwriting pseudodata and respective weights (remove these remarks after editing the file)
% the pseudodata and respective weights were set automatically with the function setpseudodata
% if one wants to overwrite one of the values then please provide an explanation
% example:
% data.psd.p_M = 1000;                    % my_pet belongs to a group with high somatic maint
% weights.psd.kap = 10 * weights.psd.kap;   % I need to give this pseudo data a higher weights

%% Remarks
% Plots with the same labels and units can be combined into one plot by
% assigning a cell string with dataset names to metaData.grp,sets, and a
% caption to metaData.grp.comment

set1 = {'tL_T15_f1';'tL_T20_f1';'tL_T25_f1'};
comment1 = {'Length at low food for three temperatures'};

set2 = {'tL_T15_f2';'tL_T20_f2';'tL_T25_f2'};
comment2 = {'Length at medium food for three temperatures'};

set3 = {'tL_T15_f3';'tL_T20_f3';'tL_T25_f3'};
comment3 = {'Length at high food for three temperatures'};

set4 = {'tL_T15_f1';'tL_T15_f2';'tL_T15_f3'};
comment4 = {'Length at low temperature (15 C) for three low, medium, and high food level'};

set5 = {'tL_T20_f1';'tL_T20_f2';'tL_T20_f3'};
comment5 = {'Length at medium temperature (20 C) for three low, medium, and high food level'};

set6 = {'tL_T25_f1';'tL_T25_f2';'tL_T25_f3'};
comment6 = {'Length at optimal temperature (25 C) for three low, medium, and high food level'};

set7 = {'tR';'tR_flim'};
comment7 = {'Repoduction rate at high food, low food'};

set8 = {'S'; 'S_flim'}; % you may group as many curves as you would like
comment8 = {'Survival and high food, low food'};



% just keep adding sets and comments here :-)
metaData.grp.sets       = {set1,set2,set3,set4,set5,set6,set7,set8};
metaData.grp.comment = {comment1,comment2,comment3,comment4,comment5,comment6,...
    comment7,comment8};



%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
if exist('comment','var')
    txtData.comment = comment;
end

%% Discussion points %BGo TO BE MODIFIED
D1 = 'Author_mod_1: I found information on the number of eggs per female as a function of length in Anon2013 that was much higher than in Anon2015 but chose to not include it as the temperature was not provided';
% optional bibkey: metaData.bibkey.D1 = 'Anon2013';
D2 = 'Author_mod_1: I was surprised to observe that the weights coefficient for ab changed so much the parameter values';
% optional bibkey: metaData.bibkey.D2 = 'Kooy2010';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts %BGo TO BE MODIFIED
% list facts: F1, F2, etc.
% make sure each fact has a corresponding bib key
% do not put any DEB modelling assumptions here, only relevant information on
% biology and life-cycles etc.
F1 = 'The larval stage lasts 202 days and no feeding occurs';
metaData.bibkey.F1 = 'Wiki'; % optional bibkey
metaData.facts = struct('F1',F1);

%% References
% the following two references should be kept-----------------------------------------------------------
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
    'author = {Kooijman, S.A.L.M.}, ' ...
    'year = {2010}, ' ...
    'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
    'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
    'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
    'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LikaKear2011'; type = 'Article'; bib = [ ...  % used for the estimation method
    'author = {Lika, K. and Kearney, M.R. and Freitas, V. and van der Veer, H.W. and van der Meer, J. and Wijsman, J.W.M. and Pecquerie, L. and Kooijman, S.A.L.M.},'...
    'year = {2011},'...
    'title = {The ''''covariation method'''' for estimating the parameters of the standard Dynamic Energy Budget model \textrm{I}: Philosophy and approach},'...
    'journal = {Journal of Sea Research},'...
    'volume = {66},'...
    'number = {4},'...
    'pages = {270-277},'...
    'DOI = {10.1016/j.seares.2011.07.010},'...
    'howpublished = {\url{http://www.sciencedirect.com/science/article/pii/S1385110111001055}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%------------------------------------------------------------------------------------------------------

% References for the data, following BibTex rules
% author names : author = {Last Name, F. and Last Name2, F2. and Last Name 3, F3. and Last Name 4, F4.}
% latin names in title e.g. \emph{Pleurobrachia pileus}

bibkey = 'Wiki'; type = 'Misc'; bib = [...
    'howpublished = {\url{https://en.wikipedia.org/wiki/Ceriodaphnia_dubia}},'...% replace my_pet by latin species name
    'note = {Accessed : 2015-08-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GamaFlores2011'; type = 'Article'; bib = [ ...
    'author = {Gama-Flores, Jose Luis and Huidobro-Salas, Maria Elena and Sarma, S. S. S. and Nandini, S}, ' ...
    'year = {2011}, ' ...
    'title = {Somatic and population growth responses of \emph{Ceriodaphnia dubia} and \emph{Daphnia pulex} (Cladocera) to changes in food (\emph{Chlorella vulgaris}) level and temperature.}, ' ...
    'journal = {Journal of Environmental Biology}, ' ...
    'volume = {32}, ' ...
    'number = {}, '...
    'pages = {489 - 495}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Henry2004'; type = 'Article'; bib = [ ...
    'author = {Henry, Theodore B and Kwon, Jeong-Wook and Armbrust, Kevin L and Black, Marsha C}, ' ...
    'year = {2004}, ' ...
    'title = {Acute and chronic toxicity of five selective serotonin reuptake inhibitors in \emph{Ceriodaphnia dubia}}, ' ...
    'journal = {Environmental toxicology and chemistry}, ' ...
    'volume = {23}, ' ...
    'number = {9}, '...
    'pages = {2229--2233},'...
    'doi = {10.1897/03-278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stewart1998'; type = 'Article'; bib = [ ...
    'author = {Stewart, Arthur J and Konetsky, Belinda K},' ...
    'year = {1998}, ' ...
    'title = {Longevity and reproduction of \emph{Ceriodaphnia dubia}, ' ...
    'journal = {Environmental Toxicology and Chemistry}, ' ...
    'volume = {17}, ' ...
    'number = {6}, '...
    'pages = {1165--1171},'...
    'doi = {10.1002/etc.5620170625}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
