# -*- coding: utf-8 -*-
"""
Created on Thu Jun  6 11:23:45 2019

@author: jared.brush
"""

#import the arcpy package
import arcpy

#set parameter for output
fpath = 'path'
arcpy.SetParameter(1, fpath)

# specify the path to the GDB with the asset files
#make sure the path uses '/' and NOT '\'
arcpy.env.workspace = 'path2'
arcpy.env.overwriteOutput = True


# collects all the Feature Classes in the GDB
fcs = arcpy.ListFeatureClasses()

# run the Merge tool
arcpy.Merge_management (inputs=fcs, output=fpath)

