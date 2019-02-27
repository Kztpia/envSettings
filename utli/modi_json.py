#!/usr/bin/python
import json

def FilterDefine(flags):
    result=[]
    for flag in flags:
        if flag.startswith('-D'):
            result+=[flag]
    return result

def turnPathToAbsPath(incDir,baseDir):
    import os.path as p
    if incDir.startswith('/'):
        return p.abspath(incDir)
    else:
        return p.abspath(p.join(baseDir,incDir))

def searchIncludeFileDir(includeDirs,filename):
    import os.path as p
    for includedir in includeDirs:
        if p.isfile(p.join(includedir[2:],filename)):
            return p.join(includedir[2:],filename)
    return "empty"

def completeDirForFlag_include(includeDirs,flags):
    result=[]
    foundInclude=False
    for i in range(len(flags)):
        if flags[i].startswith('-include'):
            completePath=searchIncludeFileDir(includeDirs,flags[i+1])
            if completePath!="empty":
                result+=[flags[i],completePath]
                i+=1
    return result

def FilterInluce(flags,baseDir):
    result=[]
    foundSysInclude=False
    for flag in flags:
        if foundSysInclude:
            foundSysInclude=False
            result+=[turnPathToAbsPath(flag,baseDir)]
        elif flag.startswith('-isystem'):
            result+=[flag]
            foundSysInclude=True
        elif flag.startswith('-I'):
            result+=['-I'+turnPathToAbsPath(flag[2:],baseDir)]
    return result

def filterFlags(compile_unit_data):
    flags=compile_unit_data['arguments']
    defs = FilterDefine(compile_unit_data['arguments'])
    includes = FilterInluce(compile_unit_data['arguments'],compile_unit_data['directory'])
    includeFiles = completeDirForFlag_include(includes,compile_unit_data['arguments'])
    return [flags[0]]+defs+includes+includeFiles+flags[-1:]

import argparse
def getArg():
    parser = argparse.ArgumentParser()
    parser.add_argument('filename',nargs='?',default='compile_commands.json',help="""relative path to compile_commands.json""")
    return parser.parse_args()

def main():
    args=getArg()
    with open(args.filename,"r") as f:
        origion = json.load(f)
        for aug_dict in origion:
            aug_dict['arguments']=filterFlags(aug_dict)

    with open(args.filename,"w") as f:
        json.dump(origion,f,indent=4,separators=(',',':'),sort_keys=True)

main()
print('hello there')
