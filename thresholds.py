"""
@author: jared.brush
"""
#SW PLANT ASSETS

#imports
import os
import pandas as pd

#set working directory and outpath
wd ="//pwdoows/OOWS/Climate Change Adaptation/CCAP Risk Assessment/Inundation Analysis/__Phase II/Plant Risk Assessments/WWMP_Flood_Risk_Assessment"
os.chdir(wd)
outpath = "//pwdoows/OOWS/Climate Change Adaptation/CCAP Risk Assessment/Inundation Analysis/__Phase II/Plant Risk Assessments/WWMP_Flood_Risk_Assessment/Python_outputs"
#list OF files in directory
files = os.listdir(wd)


#import CSVs
arch_assets = "//pwdoows/OOWS/Climate Change Adaptation/CCAP Risk Assessment/Inundation Analysis/__Phase II/Plant Risk Assessments/WWMP_Flood_Risk_Assessment/WWMP_AssetElevationSurvey_2015_ARCH_CSV_JB.csv"
arch_df = pd.read_csv(arch_assets)
mech_assets = "//pwdoows/OOWS/Climate Change Adaptation/CCAP Risk Assessment/Inundation Analysis/__Phase II/Plant Risk Assessments/WWMP_Flood_Risk_Assessment/WWMP_AssetElevationSurvey_2015_MECH_&_ELECT_CSV_JB.csv"
mech_df = pd.read_csv(mech_assets)

#combine ARCH and MECH into one DF
data = pd.concat([arch_df, mech_df])

#keeping only SW plants
data = data[data.Plant == "Southwest"]
#convert NAVD88 to string
data['NAVD88'] = data['NAVD88'].astype(str)
#remove rows with NaN/Null
data = data[data.NAVD88 != "nan"]

total_count = float((data.NAVD88).count())

#list of values and empty DF
int_hi = [4.84, 7.05, 7.48, 7.83, 8.23, 8.5, 8.74, 6.55, 8.76, 9.19, 9.54, 9.94, 10.21, 10.45, 10.06, 12.27, 12.7, 13.05, 13.45, 13.72, 13.96, 6.08, 8.29, 8.72, 9.07, 9.47, 9.74, 9.98, 7.79, 10, 10.43, 10.78, 11.18, 11.45, 11.69, 11.3, 13.51, 13.94, 14.29, 14.69, 14.96, 15.2]
val = pd.DataFrame()

#NAVD88 back to float for evailuation
data['NAVD88'] = data['NAVD88'].astype(float)

#setup for summary table
elev_list = []
count_list = []
perc_list = []
 
#loop
for x in int_hi:
    val = data[data.NAVD88 <= x]
    elev_list.append(x)
    x_count = float((val.NAVD88).count())
    count_list.append(x_count)
    x_perc = (x_count/total_count)*100
    perc_list.append(x_perc)
    val.to_csv(outpath+"/int_hi_"+str(int(x*100))+".csv")
    dict1 = {"elevation":elev_list, "# asset": count_list, "percent": perc_list}
    summary = pd.DataFrame.from_dict(dict1)
    summary.to_csv(outpath+"/summary_"+str(int(x*100))+".csv")
             

#dict1 = {"elevation":elev_list, "# asset": count_list, "percent": perc_list}
         
#summary = pd.DataFrame.from_dict(dict1)
# =============================================================================
#  total_count = float((data.NAVD88).count())
#  min_count = float((minor.NAVD88).count())
#  mod_count = float((moderate.NAVD88).count())
#  maj_count = float((major.NAVD88).count())
#  
#  summary_data = {'Scenario': ['Minor', 'Moderate', 'Major'], '# assets': [min_count,mod_count,maj_count], '% total': [(min_count/total_count)*100,(mod_count/total_count)*100,(maj_count/total_count)*100]} 
#  summary = pd.DataFrame(summary_data)
#  cols = ['Scenario','# assets', '% total']
#  summary = summary[cols]
#  summary.to_csv(outpath+"/summary.csv", sheet_name='Sheet_name_1') 
# =============================================================================


                   
                   
                   
                   
                   
                   
                   
                   
                   