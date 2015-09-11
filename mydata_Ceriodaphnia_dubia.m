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
metaData.data_1     = {'t-L'; 't-R';'t-S'}; % tags for different types of uni-variate data % BGo MUST BE EQUAL TO THE DATA NAMES??

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
data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'None';   comment.ab  = 'Guessed at the moment'; % % BGo TO BE COMPLETED
temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
% observed age at birth is frequently larger than ab, because of diapauzes during incubation
data.ap = 4.4;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'Henry2004';     comment.ap = 'Determined by using the mean of 5 control replicates.'; % BGo TO BE CHECKED
temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
% observed age at puberty is frequently larger than ap,
%   because allocation to reproduction starts before first eggs appear
data.am = 23.1;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Stewart1998'; comment.am = 'In control water, see table 2 in Stewart1998';   % BGo COMPLETED
temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; % BGo COMPLETED
% (accounting for aging only)



% BGo TO BE COMPLETED
% Please specify what type of length measurement is used for your species.
% We put here snout-to-vent length, but you should change this depending on your species:
data.Lb  = 109.349;   units.Lb  = 'µm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'None'; % BGo GUESSED
data.Lp  = 566.571;   units.Lp  = 'µm';   label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = 'None';
data.Li  = 654.256;   units.Li  = 'µm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'None';

data.Wdb = 5.8e-6; units.Wdb = 'g';    label.Wdb = 'dry weights at birth';             bibkey.Wdb = 'None'; % BGo GUESSED
data.Wdp = 8e-4;   units.Wdp = 'g';    label.Wdp = 'dry weights at puberty';           bibkey.Wdp = 'None'; % BGo GUESSED
data.Wdi = 0.015;   units.Wdi = 'g';    label.Wdi = 'ultimate dry weights';             bibkey.Wdi = 'None'; % BGo GUESSED

data.Ri  = 2.3;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';              bibkey.Ri  = 'None'; % BGo GUESSED
% for an individual of ultimate length Li
temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; % BGo COMPLETED

%% starrlight's remarks 11/09:
% you put 2.3 for Ri but then the uni-variate data say there is a max of 16
% eggs/day ...
% maybe you could reduce the amount of parameters by just using the f = 1
% for all of the high food level growth curves instead of having e.g.
% f_tL_T15_f1, f_tL_T20_f1 etc.  


% uni-variate data

% uni-variate data at f1 = ? and temp = 15 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T15_f1 = [0 1 2 3 4 5 6 7 8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    407.44 528.1 575.31 606.97 633.78 664.77 609.69 637.14 677.86]';  % µm, carapace length at f and T
units.tL_T15_f1   = {'d', 'µm'};  label.tL_T15_f1 = {'time since birth', 'carapace length'};  bibkey.tL_T15_f1 = 'GamaFlores2011';
temp.tL_T15_f1    = C2K(15);  units.temp.tL_T15_f1 = 'K'; label.temp.tL_T15_f1 = 'temperature';
comment.tL_T15_f1 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f1 = ? and temp = 20 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T20_f1 = [0 1 2 3 4 5 6 7 8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    404.51 507.21 562.33 636.97 626.92 691.41 612.42 667.12 550.86]';  % µm, carapace length at f and T
units.tL_T20_f1   = {'d', 'µm'};  label.tL_T20_f1 = {'time since birth', 'carapace length'};  bibkey.tL_T20_f1 = 'GamaFlores2011';
temp.tL_T20_f1    = C2K(20);  units.temp.tL_T20_f1 = 'K'; label.temp.tL_T20_f1 = 'temperature';
comment.tL_T20_f1 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f1 = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T25_f1 = [0 1 2 3 4 5 6 7 8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    403.91 593.81 640.98 618.98 635.17 623.67 668.39 775.52 667.07]';  % µm, carapace length at f and T
units.tL_T25_f1   = {'d', 'µm'};  label.tL_T25_f1 = {'time since birth', 'carapace length'};  bibkey.tL_T25_f1 = 'GamaFlores2011';
temp.tL_T25_f1    = C2K(25);  units.temp.tL_T25_f1 = 'K'; label.temp.tL_T25_f1 = 'temperature';
comment.tL_T25_f1 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field




% uni-variate data at f2 = ? and temp = 15 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T15_f2 = [0 1 2 3 4 5 6 7 8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    402.48 564.63 593.76 598.9 571.67 673.25 613.7 596.06 599.43]';  % µm, carapace length at f and T
units.tL_T15_f2   = {'d', 'µm'};  label.tL_T15_f2 = {'time since birth', 'carapace length'};  bibkey.tL_T15_f2 = 'GamaFlores2011';
temp.tL_T15_f2    = C2K(15);  units.temp.tL_T15_f2 = 'K'; label.temp.tL_T15_f2 = 'temperature';
comment.tL_T15_f2 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f2 = ? and temp = 20 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T20_f2 = [0 1 2 3 4 5 6 7 8;   % d, time since ? % BGo D0 TIME TO BE CHECKED
    406.56 551.65 597.06 614.33 632.27 661.47 558.1 556.45 569.82]';  % µm, carapace length at f and T
units.tL_T20_f2   = {'d', 'µm'};  label.tL_T20_f2 = {'time since birth', 'carapace length'};  bibkey.tL_T20_f2 = 'GamaFlores2011';
temp.tL_T20_f2    = C2K(20);  units.temp.tL_T20_f2 = 'K'; label.temp.tL_T20_f2 = 'temperature';
comment.tL_T20_f2 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f2 = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T25_f2 = [0 1 2 3 4 5 6 7 8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    406.56 615.69 572.69 614.1 580.02 585.88 616.43 677.08 617.58]';  % µm, carapace length at f and T
units.tL_T25_f2   = {'d', 'µm'};  label.tL_T25_f2 = {'time since birth', 'carapace length'};  bibkey.tL_T25_f2 = 'GamaFlores2011';
temp.tL_T25_f2    = C2K(25);  units.temp.tL_T25_f2 = 'K'; label.temp.tL_T25_f2 = 'temperature';
comment.tL_T25_f2 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f3 = ? and temp = 15 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T15_f3 = [0 1 2 3 4 5 6 7 8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    398.33 531.67 578.33 648.33 613.33 663.33 590 555 531.67]';  % µm, carapace length at f and T
units.tL_T15_f3   = {'d', 'µm'};  label.tL_T15_f3 = {'time since birth', 'carapace length'};  bibkey.tL_T15_f3 = 'GamaFlores2011';
temp.tL_T15_f3    = C2K(15);  units.temp.tL_T15_f3 = 'K'; label.temp.tL_T15_f3 = 'temperature';
comment.tL_T15_f3 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f3 = ? and temp = 20 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T20_f3 = [0 1 2 3 4 5 6 7 8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    402.48 528.1 609.09 625.62 657.02 683.47 551.24 536.36 559.5]';  % µm, carapace length at f and T
units.tL_T20_f3   = {'d', 'µm'};  label.tL_T20_f3 = {'time since birth', 'carapace length'};  bibkey.tL_T20_f3 = 'GamaFlores2011';
temp.tL_T20_f3    = C2K(20);  units.temp.tL_T20_f3 = 'K'; label.temp.tL_T20_f3 = 'temperature';
comment.tL_T20_f3 = 'Extracted from figure 3 of Gama-Flores2011'; % optional field

% uni-variate data at f3 = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Carapace length % BGo WHAT DOES THAT MEAN? QUESTION ASKED TO AUTHOR
data.tL_T25_f3 = [0 1 2 3 4 5 6 7 8;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    407.32 594.31 542.28 582.93 600.81 595.93 618.7 636.59 644.72]';  % µm, carapace length at f and T
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



%{
% uni-variate data at f limited = ? and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Survival ad libitum
data.tS = [1.071	2.189	3.121	4.176	5.170	6.164	7.096	7.965	8.959	10.014	11.002	12.182	13.300	14.042	15.036	15.776	17.014	17.881	18.813	19.984	21.289	22.155	23.087	24.076	25.068	26.124	27.116	27.982	28.971	30.148	30.816	32.183	33.175	34.105	35.096	35.963;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    49.779	49.774	49.770	49.642	49.638	49.758	49.630	49.627	49.746	48.999	45.280	45.399	45.270	42.914	42.910	39.935	36.958	35.592	35.588	29.763	29.881	27.896	28.016	25.040	23.797	23.545	22.551	20.442	17.094	15.108	5.817	5.688	4.445	3.451	1.589	0.471]';  % #, mean reproduction at f and T
units.tS   = {'d', '#'};  label.tS = {'time since birth', 'Survival'};  bibkey.tS = 'Stewart1998';
temp.tS    = C2K(25);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
comment.tS = 'Extracted from figure 1 (control curve) of Stewart1998. Day 0 considered as hatching'; % optional field




% uni-variate data at f = 0 and temp = 25 C (this value should be added in
% pars_init_my_pet as a parameter f_tL) % BGo f TO BE CHANGED
% Survival starvation
data.tS_flim = [0.692	1.732	2.727	3.678	4.795	5.756	6.886	7.936	8.815	9.798	10.797	11.873	12.856	13.977;    % d, time since ? % BGo D0 TIME TO BE CHECKED
    49.895	47.183	45.476	44.858	44.848	39.076	25.969	15.487	6.226	1.377	1.753	1.546	0.937	0.595]';  % #, mean reproduction at f and T
units.tS_flim   = {'d', '#'};  label.tS_flim = {'time since birth', 'Survival'};  bibkey.tS_flim = 'Stewart1998';
temp.tS_flim    = C2K(25);  units.temp.tS_flim = 'K'; label.temp.tS_flim = 'temperature';
comment.tS_flim = 'Extracted from figure 1 (Lake Reality outfall water filtered, no food added) of Stewart1998. Day 0 considered as hatching'; % optional field

%}

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

% set1 = {'tL_T15_f1','tL_T20_f1','tL_T25_f1'};
% comment1 = {'Length at low food for three temperatures'};
% 
% set2 = {'tL_T15_f2','tL_T20_f2','tL_T25_f2'};
% comment2 = {'Length at medium food for three temperatures'};
% 
% set3 = {'tL_T15_f3','tL_T20_f3','tL_T25_f3'};
% comment3 = {'Length at high food for three temperatures'};

set4 = {'tL_T15_f1','tL_T15_f2','tL_T15_f3'};
comment4 = {'Length at high, medium, low food (15 C)'};

set5 = {'tL_T20_f1','tL_T20_f2','tL_T20_f3'};
comment5 = {'Length at high, medium, low f (20 C)'};

set6 = {'tL_T25_f1','tL_T25_f2','tL_T25_f3'};
comment6 = {'Length at high, medium and low f (25C)'};

set7 = {'tR','tR_flim'};
comment7 = {'Repoduction rate at high food, low food'};

% set8 = {'tS', 'tS_flim'}; % you may group as many curves as you would like
% comment8 = {'Survival and high food, low food'};

% just keep adding sets and comments here :-)
metaData.grp.sets       = {set4,set5,set6,set7};
metaData.grp.comment = {comment4,comment5,comment6,comment7};



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
bibkey = 'None'; type = 'Misc'; bib = [...
    'note = {Guessed}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
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
