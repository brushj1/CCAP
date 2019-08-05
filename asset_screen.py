"""
@author: jared.brush
"""
#POST-PROCESSING FOR INUNDATION MODEL 

#imports
import os
import pandas as pd
import shutil
from shutil import move
#import openpyxl

#set working directory
wd = 'path'
outpath = 'path2'
os.chdir(wd)

#list OF files in directory
files = os.listdir(wd)

#creates list of all XLSX files in directory
#files_xls = [f for f in files if f[-3:] == 'csv']????
files_xls = [f for f in files if f[-3:] == 'xls']

#create an empty DataFrame to store data combination
assets_ply = pd.DataFrame()
assets_pnt= pd.DataFrame()

#empty list to be used later for naming excel file
level = []

test = "ply_SLR_Inn_12.xls"
print(test[-6:-4])

#this for loop iterates through all XLSX files, and adds the relevant values to SLR column
#It then adds all of the information to the assets DataFrame
for f in files_xls:
    if len(f) == 19 and f[0:3] == "ply":
        data = pd.read_excel(f)
        data['SLR'] = f[-7:-4]
        data['DataType'] = "Polygon"
        assets_ply = assets_ply.append(data)
        level.append(int(f[-7:-4]))
    elif len(f) == 20 and f[0:3] == "ply":
        data = pd.read_excel(f)
        data['SLR'] = f[-8:-4]
        data['DataType'] = "Polygon"
        assets_ply = assets_ply.append(data)
        level.append(int(f[-8:-4]))
    elif len(f) == 18 and f[0:3] == "ply":
        data = pd.read_excel(f)
        data['SLR'] = f[-6:-4]
        data['DataType'] = "Polygon"
        assets_ply = assets_ply.append(data)
        level.append(int(f[-6:-4]))     
        
for f in files_xls:
    if len(f) == 19 and f[0:3] == "pnt":
        data = pd.read_excel(f)
        data['SLR'] = f[-7:-4]
        data['DataType'] = "Point"
        assets_pnt = assets_pnt.append(data)
        level.append(int(f[-7:-4]))
    elif len(f) == 20 and f[0:3] == "pnt":
        data = pd.read_excel(f)
        data['SLR'] = f[-8:-4]
        data['DataType'] = "Point"
        assets_pnt = assets_pnt.append(data)
        level.append(int(f[-8:-4]))
    elif len(f) == 18 and f[0:3] == "pnt":
        data = pd.read_excel(f)
        data['SLR'] = f[-6:-4]
        data['DataType'] = "Point"
        assets_pnt = assets_pnt.append(data)
        level.append(int(f[-6:-4]))     
        
#edit SLR
#convert SLR column from string to integer
assets_ply['SLR'] = assets_ply['SLR'].astype(int)
assets_pnt['SLR'] = assets_pnt['SLR'].astype(int)
assets_ply = assets_ply.round(6)  
assets_pnt = assets_pnt.round(6)      

#drop duplicates
assets_pnt = assets_pnt.sort_values('SLR', ascending = True).drop_duplicates(['X_Coord','Y_Coord'])   
assets_ply = assets_ply.sort_values('SLR', ascending = True).drop_duplicates(['Shape_Area','Shape_Length'])   


#combine assets
assets_all = assets_ply
assets_all = assets_all.append(assets_pnt)
assets_all= assets_all.sort_values('SLR', ascending = True)

#removes unnecessary columns
keepcols = ["SLR", "NAME","Facility","Parent_Facility","DataType","Type","ID","ADDRESS","Shape_Length"]
for col in assets_all.columns:
    if col not in keepcols:
        del assets_all[col]
        
#then reorders the columns
assets_all = assets_all[keepcols]

#reset index before export
assets_all = assets_all.reset_index()
del assets_all["index"]

#export assets DataFrame to XLSX using 'level' for naming
level.sort()
xlname = str(level[0])+'to'+str(level[-1])+'_HAT'
assets_all.to_csv(outpath+"/"+xlname+".csv", sheet_name='Sheet_name_1') 
assets_all.to_excel(outpath+"/"+xlname+".xls", sheet_name='Sheet_name_1') 

old_file = 'O:/Climate Change Adaptation/CCAP Risk Assessment/Inundation Analysis/08 GIS Exposure Analysis/Exposure_Tool_Phase_II/AssetScreening/assetscreen_old/'

for x in files_xls:
    shutil.move(wd+'/'+x, old_file+x)      
        
        
        
        
        
        
        