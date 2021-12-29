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
	
	(* Increase the version number (release -> increase the first number) *)
	Module[
	    {lvPacletInfo = InputForm[Import["./" <> # <> "/PacletInfo.m"]], lvVersion, lvNewVersion},
		lvVersion = StringReplace[StringSplit[First[StringCases[ToString[lvPacletInfo], "\"Version\"" ~~ __]], {" -> ", ","}][[2]], "\"" -> ""];
		lvNewVersion = StringRiffle[ReplacePart[StringSplit[lvVersion, "."], {1 -> (Interpreter["Number"][StringSplit[lvVersion, "."][[1]]] + 1), 3 -> 0}], "."];
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
