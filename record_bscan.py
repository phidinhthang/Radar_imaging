# ----------------------------------------------
# Script Recorded by Ansys Electronics Desktop Version 2023.2.0
# 23:37:21  Jul 09, 2024
# ----------------------------------------------
import ScriptEnv
ScriptEnv.Initialize("Ansoft.ElectronicsDesktop")
oDesktop.RestoreWindow()
oProject = oDesktop.SetActiveProject("SFR_range_estimation")
oDesign = oProject.SetActiveDesign("HFSSDesign1")

for nY in range(-5, 6):
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
						"NAME:ny",
						"Value:="		, str(nY)
					]
				]
			]
		])
	oProject.Save()
	oDesign.AnalyzeAll()
	oModule = oDesign.GetModule("ReportSetup")
	oModule.ExportToFile("S Parameter Plot 2", "C:/Users/admin/Desktop/project/SFR_range_estimation/s21_results/setup_1_bscan/s21_bscan_ny_" + str(nY) + ".csv", False)
