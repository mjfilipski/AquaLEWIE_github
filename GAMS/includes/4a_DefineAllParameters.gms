* ================================================================================================
* ================================================================================================
* ====================== STEP 4 - CALIBRATE THE MODEL  ===========================================
* ================================================================================================
* ================================================================================================


parameter
* meta-parameters with parameter draws
fshare_t(g,f,h,draw)  unscaled draw the cobb-douglas factor shares
eshare_t(g,h,draw)    unscaled draw of expenditure shares

* drawn parameters:
pv_dr(g,v,draw)       drawn or computed from draw price at village level
pz_dr(g,draw)         drawn or computed from draw price at zoi level
ph_dr(g,h,draw)       drawn or computed from draw price as seen from household
pva_dr(g,h,draw)      drawn or computed from draw price of value added
qva_dr(g,h,draw)      drawn or computed from draw quantity of value added
qp_dr(g,h,draw)       drawn or computed from draw quantity produced
tqp_dr(g,draw)        drawn or computed total qty produced in the zoi
ttqp_dr(draw)         drawn or computed total output of the zoi
fd_dr(g,f,h,draw)     drawn or computed from draw factor demand
id_dr(g,gg,h,draw)    drawn or computed from draw intermediate demand
pshift_dr(g,h,draw)   drawn or computed from draw cobb-douglas production shifter
fshare_dr(g,f,h,draw) drawn or computed from draw cobb-douglas factor shares
r_dr(g,f,h,draw)      drawn or computed from draw rent for fixed factors
wv_dr(f,v,draw)       drawn or computed from draw village-wide wage for tradable factors
wz_dr(f,draw)         drawn or computed from draw zoi-wide wage for tradable factors
vash_dr(g,h,draw)     drawn or computed from draw value-added share
idsh_dr(gg,g,h,draw)  drawn or computed from draw intermediate demand share
tidsh_dr(gg,h,draw)   drawn or computed from draw total intermediate input share (1-vash)
fixfac_dr(g,f,h,draw) drawn or computed from draw fixed factor demand
unemp_dr(f,h,draw)    drawn or computed from draw unemployment
unempsh_dr(f,h,draw)  drawn or computed from draw hh share of total unemployment
vfmsfix_dr(f,v,draw)  drawn or computed from draw factors fixed at the Village level
zfmsfix_dr(f,draw)    drawn or computed from draw factors fixed at the zoi level
vmsfix_dr(g,v,draw)   drawn or computed from draw goods fixed at the Village level
zmsfix_dr(g,draw)     drawn or computed from draw goods fixed at the zoi level

exinc_dr(h,draw)      drawn or computed from draw exogenous income
endow_dr(f,h,draw)    drawn or computed from draw endowment
qc_dr(g,h,draw)       drawn or computed from draw level of consumption
tqc_dr(g,draw)        drawn or computed from draw total qc
alpha_dr(g,h,draw)    drawn or computed from draw consumption shares
y_dr(h,draw)          drawn or computed from draw nominal hh income
cpi_dr(h,draw)        drawn or computed from draw consumer price index of hh
ry_dr(h,draw)         drawn or computed from draw real hh income
cmin_dr(g,h,draw)     drawn or computed from draw incompressible demand
trin_dr(h,draw)       drawn or computed from draw transfers in - received
trout_dr(h,draw)      drawn or computed from draw transfers out - given
trinsh_dr(h,draw)     drawn or computed from draw share of all transfers in the eco going to h
troutsh_dr(h,draw)    drawn or computed from draw share of yousehold h's income being given as transfers
hfd_dr(f,h,draw)      drawn or computed from draw factor demand of household h for factor f
vfd_dr(f,v,draw)      drawn or computed from draw village demand for factor f
zfd_dr(f,draw)        drawn or computed from draw zoi demand for factor f
hms_dr(g,h,draw)      drawn or computed from draw household marketed surplus of good g
vms_dr(g,v,draw)      drawn or computed from draw village marketed surplus of good g
zms_dr(g,draw)        drawn or computed from draw household marketed surplus of good g
hfms_dr(f,h,draw)     drawn or computed from draw household factor marketed surplus
vfms_dr(f,v,draw)     drawn or computed from draw village factor marketed surplus
zfms_dr(f,draw)       drawn or computed from draw zoi factor marketed surplus

savsh_dr(h,draw)      drawn or computed savings rate
sav_dr(h,draw)        drawn or computed savings level
exprocsh_dr(h,draw)   drawn or computed outside-of-zoi expenditures rate
exproc_dr(h,draw)     drawn or computed outside-of-zoi expenditures level
expzoish_dr(h,draw)   drawn or computed outside-of-zoi expenditures level


* calibration values in each draw
*pm1(g,draw)         calibrated market price
pv1(g,v,draw)       calibrated price at village level
pz1(g,draw)         calibrated price at zoi level
ph1(g,h,draw)       calibrated price as seen by household
pva1(g,h,draw)      calibrated price of value added
qva1(g,h,draw)      calibrated quantity of value added
qp1(g,h,draw)       calibrated quantity produced
tqp1(g,draw)        calibrated total quantity produced
ttqp1(draw)
hqp1(h,draw)        calibrated total qty produced by a household
fd1(g,f,h,draw)     calibrated factor demand
id1(g,gg,h,draw)    calibrated intermediate demand
pshift1(g,h,draw)   calibrated cobb-douglas shifter
fshare1(g,f,h,draw) calibrated cobb-douglas shares
r1(g,f,h,draw)      calibrated rent for fixed factors
wv1(f,v,draw)       calibrated village-wide wage for tradable factors
wz1(f,draw)         calibrated zoi-wide wage for tradable factors
vash1(g,h,draw)     calibrated value-added share
idsh1(gg,g,h,draw)  calibrated intermediate demand share
tidsh1(gg,h,draw)   calibrated total intermediate input share (1-vash)
fixfac1(g,f,h,draw) calibrated fixed factor demand
exinc1(h,draw)      calibrated exogenous income
endow1(f,h,draw)    calibrated endowment
qc1(g,h,draw)       calibrated level of consumption
alpha1(g,h,draw)    calibrated consumption shares
y1(h,draw)          calibrated income of household
cpi1(h,draw)        calibrated cpi
vqc1(v,g,draw)      calibrated village consumption
vcpi1(v,draw)       calibrated village cpi
cri1(v,f,draw)      calibrated rent weighted index

ry1(h,draw)         calibrated real income
ty1(draw)           calibrated income total
try1(draw)          calibrated real income total
cmin1(g,h,draw)     calibrated incompressible demand
trin1(h,draw)       calibrated transfers in - received
trout1(h,draw)      calibrated transfers out - given
sav1(h,draw)        calibrated savings
exproc1(h,draw)     calibrated expenditure rest of country
trinsh1(h,draw)     calibrated share of all transfers in the eco going to h
troutsh1(h,draw)    calibrated share of yousehold h's income being given as transfers
hfd1(f,h,draw)      calibrated factor demand of household h for factor f
vfd1(f,v,draw)      calibrated village demand for factor f
zfd1(f,draw)        calibrated zoi demand for factor f
hms1(g,h,draw)      calibrated household marketed surplus of good g
vms1(g,v,draw)      calibrated village marketed surplus of good g
zms1(g,draw)        calibrated household marketed surplus of good g
*unemp1(f,h,draw)    calibrated unemployement in the household
hfms1(f,h,draw)     calibrated household factor marketed surplus
vfms1(f,v,draw)     calibrated village factor marketed surplus
zfms1(f,draw)       calibrated zoi factor marketed surplus
vfmsfix1(f,v,draw)    calibrated factors fixed at the Village level (family labor)
zfmsfix1(f,draw)      calibrated factors fixed at the zoi level (hired labor)
hfsup1(f,h,draw)    calibrated factor supply by the household


* after a simulation for each draw
*pm2(g,draw)         simulated market price
pv2(g,v,draw)       simulated price at village level
pz2(g,draw)         simulated price at zoi level
ph2(g,h,draw)       simulated price as seen by household
pva2(g,h,draw)      simulated price of value added
qva2(g,h,draw)      simulated quantity of value added
qp2(g,h,draw)       simulated quantity produced
tqp2(g,draw)        simulated total quantity produced in the economy
ttqp2(draw)
hqp2(h,draw)         sim total qty produced by a household
fd2(g,f,h,draw)     simulated factor demand
id2(g,gg,h,draw)    simulated intermediate demand
pshift2(g,h,draw)    simulated cobb-douglas shifter
fshift2(g,f,h,draw) simulated cobb-douglas shares
r2(g,f,h,draw)      simulated rent for fixed factors
wv2(f,v,draw)       simulated village-wide wage for tradable factors
wz2(f,draw)         simulated zoi-wide wage for tradable factors
vash2(g,h,draw)     simulated value-added share
idsh2(gg,g,h,draw)  simulated intermediate demand share
tidsh2(gg,h,draw)   simulated total intermediate input share (2-vash)
fixfac2(g,f,h,draw) simulated fixed factor demand
exinc2(h,draw)      simulated exogenous income
endow2(f,h,draw)    simulated endowment
qc2(g,h,draw)       simulated level of consumption
alpha2(g,h,draw)    simulated consumption shares
y2(h,draw)          simulated income of household
cpi2(h,draw)        simulated cpi
cri2(v,f,draw)          simulated capital rent index (cap rent in activity*weight of activity)
vqc2(v,g,draw)      simulated village consumption
vcpi2(v,draw)       simulated village cpi


ry2(h,draw)         simulated real income
ty2(draw)           simulated income total
try2(draw)          simulated real income total
cmin2(g,h,draw)     simulated incompressible demand
trin2(h,draw)       simulated transfers in - received
trout2(h,draw)      simulated transfers out - given
sav2(h,draw)        simulated savings
exproc2(h,draw)     simulated expenditure rest of country
trinsh2(h,draw)     simulated share of all transfers in the eco going to h
troutsh2(h,draw)    simulated share of yousehold h's income being given as transfers
hfd2(f,h,draw)      simulated factor demand of household h for factor f
vfd2(f,v,draw)      simulated village demand for factor f
zfd2(f,draw)        simulated zoi demand for factor f
hms2(g,h,draw)      simulated household marketed surplus of good g
vms2(g,v,draw)      simulated village marketed surplus of good g
zms2(g,draw)        simulated household marketed surplus of good g
*unemp2(f,h,draw)    calibrated unemployement in the households
hfms2(f,h,draw)     simulated household factor marketed surplus
vfms2(f,v,draw)     simulated village factor marketed surplus
zfms2(f,draw)       simulated zoi factor marketed surplus
hfsup2(f,h,draw)    simulated factor supply by the household

* delta calibration /simulation
pvD(g,v,draw)       delta price at village level
pzD(g,draw)         delta price at zoi level
phD(g,h,draw)       delta price as seen by household

pvaD(g,h,draw)      delta price of value added
qvaD(g,h,draw)      delta quantity of value added
qpD(g,h,draw)       delta quantity produced
tqpD(g,draw)        delta total qp
ttqpD(draw)
hqpD(h,draw)          delta hqp
fdD(g,f,h,draw)     delta factor demand
idD(g,gg,h,draw)    delta intermediate demand
pshiftD(g,h,draw)    delta cobb-douglas shifter
fshareD(g,f,h,draw) delta cobb-douglas shares
rD(g,f,h,draw)      delta rent for fixed factors
wvD(f,v,draw)       delta village-wide wage for tradable factors
wzD(f,draw)         delta zoi-wide wage for tradable factors
vashD(g,h,draw)     delta value-added share
idshD(gg,g,h,draw)  delta intermediate demand share
tidshD(gg,h,draw)   delta total intermediate input share (1-vash)
fixfacD(g,f,h,draw) delta fixed factor demand
exincD(h,draw)      delta exogenous income
endowD(f,h,draw)    delta endowment
qcD(g,h,draw)       delta level of consumption
alphaD(g,h,draw)    delta consumption shares
yD(h,draw)          delta income of household
cpiD(h,draw)        delta cpi
criD(v,f,draw)        delta capital rent index (cap rent in activity*weight of activity)
vqcD(v,g,draw)      delta village consumption
vcpiD(v,draw)       delta village cpi

ryD(h,draw)         delta real income
tyD(draw)           delta income total
tryD(draw)          delta real income total
cminD(g,h,draw)     delta incompressible demand
trinD(h,draw)       delta transfers in - received
troutD(h,draw)      delta transfers out - given
savD(h,draw)        delta savings
exprocD(h,draw)     delta expenditure rest of country
trinshD(h,draw)     delta share of all transfers in the eco going to h
troutshD(h,draw)    delta share of yousehold h's income being given as transfers
hfdD(f,h,draw)      delta factor demand of household h for factor f
vfdD(f,v,draw)      delta village demand for factor f
zfdD(f,draw)        delta zoi demand for factor f
hmsD(g,h,draw)      delta household marketed surplus of good g
vmsD(g,v,draw)      delta village marketed surplus of good g
zmsD(g,draw)        delta household marketed surplus of good g
hfmsD(f,h,draw)     delta household factor marketed surplus
vfmsD(f,v,draw)     delta village factor marketed surplus
zfmsD(f,draw)       delta zoi factor marketed surplus
hfsupD(f,h,draw)    delta factor supply by the household

* percent change calibration/simulation
pvPC(g,v,draw)        % change price at village level
pzPC(g,draw)          % chage price at zoi level
phPC(g,h,draw)        % change price as seen by household

pvaPC(g,h,draw)      % change price of value added
qvaPC(g,h,draw)      % change quantity of value added
qpPC(g,h,draw)       % change quantity produced
tqpPC(g,draw)        % change in total qp
ttqpPC(draw)
hqpPC(h,draw)          % change in hqp

fdPC(g,f,h,draw)     % change factor demand
idPC(g,gg,h,draw)    % change intermediate demand
pshiftPC(g,h,draw)    % change cobb-douglas shifter
fsharePC(g,f,h,draw) % change cobb-douglas shares
rPC(g,f,h,draw)      % change rent for fixed factors
wvPC(f,v,draw)       % change village-wide wage for tradable factors
wzPC(f,draw)         % change zoi-wide wage for tradable factors
vashPC(g,h,draw)     % change value-added share
idshPC(gg,g,h,draw)  % change intermediate demand share
tidshPC(gg,h,draw)   % change total intermediate input share (1-vash)
fixfacPC(g,f,h,draw) % change fixed factor demand
exincPC(h,draw)      % change exogenous income
endowPC(f,h,draw)    % change endowment
qcPC(g,h,draw)       % change level of consumption
alphaPC(g,h,draw)    % change consumption shares
yPC(h,draw)          % change income of household
cpiPC(h,draw)        % change in cpi
criPC(v,f,draw)        % change capital rent index (cap rent in activity*weight of activity)
vqcPC(v,g,draw)      % change village consumption
vcpiPC(v,draw)       % change village cpi


ryPC(h,draw)         % change in real income
tyPC(draw)           % change income total
tryPC(draw)          % change real income total
cminPC(g,h,draw)     % change incompressible demand
trinPC(h,draw)       % change transfers in - received
troutPC(h,draw)      % change transfers out - given
savPC(h,draw)        % change savings
exprocPC(h,draw)     % change expenditure rest of country
trinshPC(h,draw)     % change share of all transfers in the eco going to h
troutshPC(h,draw)    % change share of yousehold h's income being given as transfers
hfdPC(f,h,draw)      % change factor demand of household h for factor f
vfdPC(f,v,draw)      % change village demand for factor f
zfdPC(f,draw)        % change zoi demand for factor f
hmsPC(g,h,draw)      % change household marketed surplus of good g
vmsPC(g,v,draw)      % change village marketed surplus of good g
zmsPC(g,draw)        % change household marketed surplus of good g
hfmsPC(f,h,draw)     % change household factor marketed surplus
vfmsPC(f,v,draw)     % change village factor marketed surplus
zfmsPC(f,draw)       % change zoi factor marketed surplus
hfsupPC(f,h,draw)    % change factor supply by the household
;