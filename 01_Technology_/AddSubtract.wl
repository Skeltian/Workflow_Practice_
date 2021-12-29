(* ::Package:: *)

BeginPackage["AddSubtract`"];

cfAdd::usage =
	"USAGE: cfAdd[x, y]\n\n
	Adds two numbers"

Begin["Private`"];

cfAdd[x_, y_]:=
If[NumberQ[x] && NumberQ[y],
	Return[x + y],
	Return["Please give two numbers for addition."]
]

End[];

EndPackage[];
