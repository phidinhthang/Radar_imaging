# ----------------------------------------------
# Script Recorded by Ansys Electronics Desktop Version 2023.2.0
# 19:44:45  Jul 13, 2024
# ----------------------------------------------
import ScriptEnv
ScriptEnv.Initialize("Ansoft.ElectronicsDesktop")
oDesktop.RestoreWindow()
oProject = oDesktop.SetActiveProject("SFR_range_estimation")
oDesign = oProject.SetActiveDesign("HFSSDesign1")
degs = ["0", "pi/4", "pi/2", "3*pi/4", "pi", "5*pi/4", "3*pi/2", "7*pi/4"]
deg_txts = ["0", "pi-div4", "pi-div2", "3pi-div4", "pi", "5pi-div4", "3pi-div2", "7pi-div4"]

for deg_idx, deg in enumerate(degs):
	for nZ in range(-5, 6):
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
							"NAME:deg",
							"Value:="		, deg
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
							"NAME:nz",
							"Value:="		, str(nZ)
						]
					]
				]
			])
		oProject.Save()
		oDesign.AnalyzeAll()
		oModule = oDesign.GetModule("ReportSetup")
		oModule.ExportToFile("S Parameter Plot 2", "C:/Users/admin/Desktop/project/SFR_range_estimation/s21_results/cscan/week4/chair_lambda_div6_distance_100mm_circle/s21_complex_deg_" + deg_txts[deg_idx] + "_nz_" + str(nZ) + ".csv", False)
