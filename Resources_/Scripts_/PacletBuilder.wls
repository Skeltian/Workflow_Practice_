#!/usr/bin/env wolframscript

argv = Rest @ $ScriptCommandLine;
Map[
(
	CreatePacletArchive["./" <> #];
	RenameFile["./" <> # <> "-1.0.0.paclet", "./" <> # <> "/Paclets/" <> # <> "-1.0.0.paclet"];
	PacletManager`BuildPacletSiteFiles["./" <> #]
)&,

argv]
