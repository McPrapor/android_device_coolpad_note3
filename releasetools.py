import common
import edify_generator

def FixPaths(info):
    edify = info.script
    for i in xrange(len(edify.script)):
      if "ui_print(" in edify.script[i] and "By:-" in edify.script[i]:
        edify.script[i] = 'ui_print("*                   By:-m4h0n3y                  *");'
    for i in xrange(len(edify.script)):
      if "mtk-msdc.0/11230000.msdc0" in edify.script[i]:
        edify.script[i] = edify.script[i].replace('mtk-msdc.0/11230000.msdc0','mtk-msdc.0')
    return

def FullOTA_InstallEnd(info):
    FixPaths(info)

def IncrementalOTA_InstallEnd(info):
    FixPaths(info)
