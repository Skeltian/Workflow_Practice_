(* ::Package:: *)

BeginPackage["AddSubtract`"];

cfAdd::usage =
	"USAGE: cfAdd[x, y]\n\n
	Adds two numbers"
cfSubtract::usage =
	"USAGE: cfSubtract[x, y]\n\n
	Subtracts two numbers"

Begin["Private`"];

cfAdd[x_, y_]:=
If[NumberQ[x] && NumberQ[y],
	Return[x + y],
	Return["Please give two numbers for addition."]
]

cfSubtract[x_, y_]:=
If[NumberQ[x] && NumberQ[y],
	Return[x - y],
	Return["Please give two numbers for subtraction."]
]

End[];

EndPackage[];
