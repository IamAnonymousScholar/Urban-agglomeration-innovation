#Description: merging all country maps (most detailed administrative level) into a big map

import arcpy
arcpy.env.workspace = "D:\\Research\\WEBS\\Geo_data\\city_map"

import os
os.curdir="D:\\Research\\WEBS\\Geo_data\\city_map"
os.listdir(os.curdir)
def getHighestShp(dirName):
    files=os.listdir(os.curdir+"\\"+dirName)
    shpfiles=[x for x in files if(".shp" in x)]
    if(len(shpfiles)==0):
        print(dirName)
        return
    return(os.curdir+"\\"+dirName+"\\"+shpfiles[-1])
    
highestShps=[getHighestShp(x) for x in os.listdir(os.curdir)]
highestShps

n=88;k=0;arcpy.management.Merge(highestShps[k:k+n],os.curdir+"\\"+str(k)+"to"+str(k+n-1)+".shp","")
n=27;k=88;arcpy.management.Merge(highestShps[k:k+n],os.curdir+"\\"+str(k)+"to"+str(k+n-1)+".shp","")
all_shp = "D:\\Research\\WEBS\\Geo_data\\city_map\\all.shp"
part1 = "D:\\Research\\WEBS\\Geo_data\\city_map\\0to87.shp"
part2 = "D:\\Research\\WEBS\\Geo_data\\city_map\\88to114.shp"
arcpy.management.Merge([part1,part2],all_shp,"")

