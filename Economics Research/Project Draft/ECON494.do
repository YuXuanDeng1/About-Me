clear all
import delimited "C:\Users\yuxua\Desktop\ECON 494\Project Draft\Merged Data t+1 cleaned.csv"
destring salch sal_ch_per, replace force float
sum
describe

eststo: reg returns sto_ch_per i.year i.stateid i.sector_code, robust
eststo: reg returns sto_ch_per stockopt_mil i.year i.stateid i.sector_code, robust
eststo: reg returns sto_ch_per stockopt_mil salary_thou i.year i.stateid i.sector_code, robust
eststo: reg returns sto_ch_per stockopt_mil salary_thou sal_ch_per i.year i.stateid i.sector_code, robust
eststo: reg returns sto_ch_per stockopt_mil salary_thou sal_ch_per mlvalt i.year i.stateid i.sector_code, robust

esttab using Regressiont+.csv, p ar2 label                        ///
title(Table II: Regression Results)       ///
nonumbers mtitles("Model I" "Model II" "Model III" "Model IV" "Model V")  ///
addnote("Note: All models contain year, state, sector fixed effects. ")
