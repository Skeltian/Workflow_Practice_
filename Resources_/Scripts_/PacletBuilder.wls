#!/usr/bin/env wolframscript

argv = Rest @ $ScriptCommandLine;
loc = NotebookDirectory[];
SetDirectory[loc];
SetDirectory["../../"];
Print[Directory[]];
Map[
(
	CreatePacletArchive["./" <> #];
	RenameFile["./" <> # <> "-1.0.0.paclet", "./" <> # <> "/Paclets/" <> # <> "-1.0.0.paclet", OverwriteTarget -> True];
	PacletManager`BuildPacletSiteFiles["./" <> #]
	RenameFile["./Resources_/PacletSite.mz", "./" <> # <> "/PacletSite.mz", OverwriteTarget -> True]
)&,

argv]
