#!/usr/bin/env wolframscript

argv = Rest @ $ScriptCommandLine;
Map[
Module[{lvNewPaclet, lvOldPaclets = FileNames["./" <> # <> "/Paclets/*.paclet"]},
(
	If[Length[lvOldPaclets] > 0,
		Map[
		RenameFile[#, "./" <> StringSplit[#, "\\"][[2]] <> "/Archived_/" <> Last[StringSplit[#, "\\"]]]&
		
		lvOldPaclets]
	];
	CreatePacletArchive["./" <> #];
	lvNewPaclet = First[FileNames["*.paclet"]];
	RenameFile[lvNewPaclet, "./" <> # <> "/Paclets/" <> lvNewPaclet, OverwriteTarget -> True];
	PacletManager`BuildPacletSiteFiles["./" <> #]
)
]&,

argv]
