#!/usr/bin/env wolframscript

argv = Rest @ $ScriptCommandLine;
Map[
Module[{lvNewPaclet, lvOldPaclets = FileNames["./" <> # <> "/Paclets/*.paclet"]},
(
	(* Move the old paclets to Archived_/ *)
	If[Length[lvOldPaclets] > 0,
		Map[
		RenameFile[#, "./" <> StringSplit[#, "\\"][[2]] <> "/Archived_/" <> Last[StringSplit[#, "\\"]], OverwriteTarget -> True]&,
		
		lvOldPaclets]
	];
	
	(* Increase the version number *)
	Module[
	    {lvPacletInfo = InputForm[Import["./" <> # <> "/PacletInfo.m"]], lvVersion, lvNewVersion},
		lvVersion = StringReplace[StringSplit[First[StringCases[ToString[lvPacletInfo], "\"Version\"" ~~ __]], {" -> ", ","}][[2]], "\"" -> ""];
		lvNewVersion = StringRiffle[ReplacePart[StringSplit[lvVersion, "."], 3 -> (Interpreter["Number"][StringSplit[lvVersion, "."][[3]]] + 1)], "."];
		Put[ToExpression[StringReplace[ToString[lvPacletInfo], lvVersion -> lvNewVersion]], ("./" <> # <> "/PacletInfo.m")]
	];
	
	(* Create the Paclet *)
	CreatePacletArchive["./" <> #];
	
	(* Move the .paclet file to Paclets/ *)
	lvNewPaclet = First[FileNames["*.paclet"]];
	RenameFile[lvNewPaclet, "./" <> # <> "/Paclets/" <> lvNewPaclet, OverwriteTarget -> True];
	
	(* Build the Paclet Site files *)
	PacletManager`BuildPacletSiteFiles["./" <> #]
)
]&,

argv]
