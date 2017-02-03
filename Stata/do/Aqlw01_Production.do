clear
capture log close
set more off
cap mat clear 
global drop 

* define paths
global workdir "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\Stata"
global aquamade "D:\Docs\Myanmar\AquaAgri\Analysis\Aqua\stata\made"
global agrimade "D:\Docs\Myanmar\AquaAgri\Analysis\Agri\stata\made" 

global graphs "$workdir\graphs"
global madedata "$workdir\madedata"
global tables "$workdir\tables"
global outtab "$tables\table.xlsx"

global rawdata "D:\Docs\Myanmar\Data\AquaAgri\version0_9July16_v14"
global hhchar "D:\Docs\Myanmar\Data\AquaAgri\hhchars\160714_hhchar_v14_un.dta"
global hhgroup "$madedata\hhgroups.dta"

global lewiesheet "D:\Docs\Myanmar\AquaAgri\Analysis\AquaLEWIE_github\GAMS\AQ_LEWIE_InputSheet_v7"

cd $workdir 


* ============================================================
* ============= Data for Fish Activity =======================
* ============================================================

/*  1) Compute total output from fish activity, by household:  */
*----------------------------------------------------------------------------------------------
use $aquamade\aqua_allcosts, clear
merge 1:1 eahh using $hhgroup 
drop if _m==2 
drop _m 
count
 

collapse (mean) rev_fish, by (lwgroup) 
decode lwgroup, gen(gname)
list 
mkmat rev_fish, matrix(m) rownames(gname)
mat list m
matrix fishrev = m'
matrix list fishrev 
putexcel B2 = matrix(fishrev, names) using $lewiesheet, sheet("Fish") modify keepcellformat 
clear



/*  2) Compute factor shares: */
*----------------------------------------------------------------------------------------------

* Need to take both nurseries and growout ponds - appending them together
* Keeping only the income and input costs: 
use $aquamade\aqua_allcosts, clear

 
* Merge in value of total assets 
merge m:1 eahhid using $madedata\ass_val 
drop if _m==2
drop _m 

* Impute out values if needed: 
imputeout cst_purch cst_constrep, bylist(cluster) 
 
 
cap mat clear
* generate variables to put all costs into simple categories: 
* purchased inputs, labor, capital

* intermediate inputs:
egen i_aqua = rowtotal(cst_seed)
egen i_intinp = rowtotal(cst_feed cst_harv cst_mkt cst_leg cst_bor) 


* Value-added creating inputs: 
egen i_labor = rowtotal(cst_lab) 
* Is land the area or the investment?  *aqua_sparea
egen i_land = rowtotal(aqua_sparea) 
* Includes real value of all assets rval: 
* egen i_capit = rowtotal(cst_purch cst_constrep cst_mach ) 
* adding cost of purchase and cost of construction makes a negative coeff for small farms. 
* that might be because land is already picking up that investment
egen i_capit = rowtotal(cst_mach)
egen i_other = rowtotal(cst_oinp)

label var i_land "Land"
label var i_labor "labor"
label var i_capit "capital"
label var i_other "other inputs that create value added"
label var i_aqua "intermediate inputs from aquaculture (seed)"
label var i_intinp "all other purchased intermediate inputs"

gen y = rev_fish 
keep eahhid y i_*  wei
 
sort eahhid
tempfile growout 
save `growout' 

merge 1:1 eahh using $hhgroup 
drop if _m==2 
drop _m 
count

* Generate Log variables where needed: 
foreach v of varlist y i_* {
	gen l`v' = log(`v')
}

* generate variables for the regression:
* Maybe no need for Other - they are intermediate inputs, not value-added creating inputs
global rhsfish "li_labor li_land  li_capit li_other"
global cstrfish "li_labor+li_land+li_capit +li_other"

* look for outliers: 
tab li_labor 
tab li_land
tab li_capit
*drop if li_capit <=-2
*drop if li_capit >=9 & li_capit!=.


* run a constrained log-log regression
eststo clear  
constraint 3 $cstrfish = 1 , c(3)
*bysort lwgroup : eststo: reg ly $rhsfish , r 
bysort lwgroup : eststo: cnsreg ly $rhsfish [aw=wei], r  c(3) 

estout
return list
esttab,  nodepvar  label nonumber not se 
return list 
matrix mout = r(coefs) 
mat l mout
*matrix coleq mout = 
matrix coleq mout = "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'" ///
					"`r(m2_estimates_title)'"  "`r(m2_estimates_title)'"  "`r(m2_estimates_title)'"
mat l mout
*matrix colnames mout = "`r(m1_estimates_title)' beta" "`r(m1_estimates_title)' se" "`r(m1_estimates_title)' p" ///
*					"`r(m2_estimates_title)' beta" "`r(m2_estimates_title)' se" "`r(m2_estimates_title)' p"
matrix colnames mout = beta se p beta se p 
mat l mout

putexcel B8 = matrix(mout, names) using $lewiesheet, sheet("Fish") modify keepcellformat 

* intermediate input shares: 
gen iish_aqua = i_aqua / y 
gen iish_intinp = i_intinp / y 
tabstat iish* [aw=wei], by(lwgroup)  stat(mean med)

crash  
* ============================================================
* ============= Nursery Ponds??  ===========
* ============================================================
* use $aquamade\clean_nurscost, clear
* generate variables to put all costs into simple categories: 
* purchased inputs, labor, capital



* ============================================================
* ============= Data for Crop - Livestock Activity ===========
* ============================================================

/* 3) Agriculture total output  */
*----------------------------------------------------------------------
use $agrimade\agri_costs_revs,  clear
merge 1:1 eahh using $hhgroup 
drop if _m==2 
drop _m 
count
 

egen y = rowtotal(gross_sale_monsoon gross_sale_dry)
* Convert to Lahks 
replace y=y/100000
decode lwgroup , gen(groupname)

* Give non-ag households some production, assuming they use their ag land same as ag people: 
gen y_pa = y/ld_agown 
label var y_pa "crop income per acre of ag land"
egen y_mean = mean(y_pa) , by(cluster)
* assign imputed production only to groups 1 and 2: 
gen y_imp = y_mean*ld_agown 



collapse (mean)  y y_imp, by(lwgroup groupname)
mkmat  y y_imp, matrix(mm) rownames(groupname) 
matrix croprev = mm'
mat l croprev 
putexcel B2 = matrix(croprev, names) using $lewiesheet, sheet("Crop") modify keepcellformat 



/* 4) Agriculture factor shares */
*----------------------------------------------------------------------

use $agrimade\agri_costs_revs,  clear
cap mat clear 
* generate variables to put all costs into simple categories: 
* purchased inputs, labor, capital
egen i_agri = rowtotal(dry_seeds_cost monsoon_seeds_cost)
*gen i_agri = 
*egen i_feed = rowtotal() 
egen i_labor = rowtotal(dry_dayrate dry_piecerate dry_add_templabor /// 
				monsoon_dayrate monsoon_piecerate monsoon_add_templabor) 
egen i_land = rowtotal(agri_sparea) 
egen i_capit = rowtotal(dry_irri_cost  /// 
						monsoon_irri_cost monsoon_equipment_cost ) 
egen i_other = rowtotal(dry_transport_costs dry_inputs_cost /// 
						monsoon_transport_costs monsoon_inputs_cost)

global rhscrop "li_labor li_land li_capit li_other"
global cstrcrop "li_labor+li_land+li_capit+li_other"

egen y = rowtotal(gross_sale_monsoon gross_sale_dry)


merge 1:1 eahh using $hhgroup 
drop if _m==2 
drop _m 
count

* Generate Log variables where needed: 
* No need to recode to lahk.
foreach v of varlist y i_* {
		gen l`v' = log(`v')
}

sum l* 

* run a constrained log-log regression
eststo clear  
constraint 3 $cstrcrop = 1 
bysort lwgroup : eststo: cnsreg ly $rhscrop, r c(3) 


estout
return list
esttab,  nodepvar  label nonumber not se 
return list 
matrix mout = r(coefs) 
mat l mout
*matrix coleq mout = 
* Only one household has crops in this module: 
matrix coleq mout = "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'"  "`r(m1_estimates_title)'" 

mat l mout
matrix colnames mout = beta se p 
mat l mout
 
putexcel B8 = matrix(mout, names) using $lewiesheet, sheet("Crop") modify keepcellformat 
 


 
