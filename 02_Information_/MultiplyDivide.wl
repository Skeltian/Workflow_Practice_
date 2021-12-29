(* ::Package:: *)

BeginPackage["MultiplyDivide`"];

cfMultiply::usage =
	"USAGE: cfMultiply[x, y]\n\n
	Multiply two numbers"

Begin["Private`"];

cfMultiply[x_, y_]:=
If[NumberQ[x] && NumberQ[y],
	Return[x * y],
	Return["Please give two numbers for addition."]
]

End[];

EndPackage[];
