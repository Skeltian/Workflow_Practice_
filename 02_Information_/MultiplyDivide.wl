(* ::Package:: *)

BeginPackage["MultiplyDivide`"];

cfMultiply::usage =
	"USAGE: cfMultiply[x, y]\n\n
	Multiply two numbers"
cfDivide::usage =
	"USAGE: cfDivide[x, y]\n\n
	Divide two numbers"

Begin["Private`"];

cfMultiply[x_, y_]:=
If[NumberQ[x] && NumberQ[y],
	Return[x * y],
	Return["Please give two numbers for addition."]
]

cfDivide[x_, y_]:=
Which[y == 0,
	Return["Cannot divide by 0."],
NumberQ[x] && NumberQ[y],
	Return[x / y],
True,
	Return["Please give two numbers for subtraction."]
]

End[];

EndPackage[];
