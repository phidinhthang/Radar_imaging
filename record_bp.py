# ----------------------------------------------
# Script Recorded by Ansys Electronics Desktop Version 2023.2.0
# 19:44:45  Jul 13, 2024
# ----------------------------------------------
import ScriptEnv
ScriptEnv.Initialize("Ansoft.ElectronicsDesktop")
oDesktop.RestoreWindow()
oProject = oDesktop.SetActiveProject("SFR_range_estimation")
oDesign = oProject.SetActiveDesign("HFSSDesign7")

for nY in range(-5, 6):
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
							"NAME:ny",
							"Value:="		, str(nY)
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
		oModule.ExportToFile("S Parameter Plot 2", "C:/Users/admin/Desktop/project/SFR_range_estimation/s21_results/cscan/week12/vivaldi_bw_3_10_simplebomb_lambda_div05_dis_300mm_3GHz_10GHz/s21_complex_ny_" + str(nY) + "_nz_" + str(nZ) + ".csv", False)
