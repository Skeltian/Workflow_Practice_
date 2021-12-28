#!/usr/bin/env wolframscript

argv = Rest @ $ScriptCommandLine;
Map[
Module[{lvPaclet},
(
	CreatePacletArchive["./" <> #];
	lvPaclet = First[FileNames["*.paclet"]];
	RenameFile[lvPaclet, "./" <> # <> "/Paclets/" <> lvPaclet, OverwriteTarget -> True];
	PacletManager`BuildPacletSiteFiles["./" <> #]
)
]&,

argv]
