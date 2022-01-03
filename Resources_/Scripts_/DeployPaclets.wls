#!/usr/bin/env wolframscript
(* ::Package:: *)

argt = $ScriptCommandLine[[2]];
argv = $ScriptCommandLine[[3 ;; ]];
Map[
Module[{lvNewPaclet, lvOldPaclets = FileNames["./" <> # <> "/Paclets/*.paclet"]},
(
	(* Delete the old paclet(s) *)
	If[Length[lvOldPaclets] > 0,
		Map[DeleteFile[#]&, lvOldPaclets]
	];
	
	(* Increase the version number (release -> increase the first number) *)
	Module[
	    {lvPacletInfo = InputForm[Import["./" <> # <> "/PacletInfo.m"]], lvVersion, lvNewVersion},
		lvVersion = StringReplace[StringSplit[First[StringCases[ToString[lvPacletInfo], "\"Version\"" ~~ __]], {" -> ", ","}][[2]], "\"" -> ""];
		lvNewVersion = 
			Which[
			StringMatchQ[argt, "major", IgnoreCase->True], 
				StringRiffle[ReplacePart[StringSplit[lvVersion, "."], {1 -> (Interpreter["Number"][StringSplit[lvVersion, "."][[1]]] + 1), 2 -> 0, 3 -> 0}], "."], 
			StringMatchQ[argt, "minor", IgnoreCase->True], 
				StringRiffle[ReplacePart[StringSplit[lvVersion, "."], {2 -> (Interpreter["Number"][StringSplit[lvVersion, "."][[2]]] + 1), 3 -> 0}], "."], 
			StringMatchQ[argt, "patch", IgnoreCase->True], 
				StringRiffle[ReplacePart[StringSplit[lvVersion, "."], {3 -> (Interpreter["Number"][StringSplit[lvVersion, "."][[3]]] + 1)}], "."], 
			True, 
				Print["No valid version conversion indicated (must be \"major\", \"minor\", or \"patch\")"]; 
				Return[$Failed]
			];
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
