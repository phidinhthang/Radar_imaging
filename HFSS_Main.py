import os
import sys
installPath = "C:\Program Files\AnsysEM\\v232\Win64" # Location of HFSS installation
pluginLoc = "C:\Program Files\AnsysEM\\v232\Win64\PythonFiles\DesktopPlugin" # Location of ScriptEnv.py file
sys.path.append(installPath)
sys.path.append(pluginLoc)
import ScriptEnv
import csv
import HfssScriptUtil as hfss


ScriptEnv.Initialize("Ansoft.ElectronicsDesktop")
oDesktop.RestoreWindow()
oProject = oDesktop.SetActiveProject("SFR_range_estimation")
oDesign = oProject.SetActiveDesign("Vivaldi6 - Tapered Slot")
oDesign.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:LocalVariableTab",
			[
				"NAME:PropServers", 
				"LocalVariables"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:L",
					"Value:="		, sys.argv[1] + "mm"
				]
			]
		]
	])
oDesign.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:LocalVariableTab",
			[
				"NAME:PropServers", 
				"LocalVariables"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:CircleR",
					"Value:="		, sys.argv[2] + "mm"
				]
			]
		]
	])
oDesign.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:LocalVariableTab",
			[
				"NAME:PropServers", 
				"LocalVariables"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:rate",
					"Value:="		, sys.argv[3]
				]
			]
		]
	])
oProject.Save()
oDesign.AnalyzeAll()
oModule = oDesign.GetModule("ReportSetup")
oModule.ExportToFile("S Parameter Plot 1", "C:/Users/admin/Desktop/project/SFR_range_estimation/s21_results/week8/vivaldi_taper_s11.csv", False)
