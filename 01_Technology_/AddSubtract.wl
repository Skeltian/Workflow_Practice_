(* ::Package:: *)

BeginPackage["AddSubtract`"];

cfAdd::usage =
	"\!\(\*
StyleBox[\"Usage\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\":\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"cfAdd\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"[\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"x\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"y\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"]\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"\\\\n\",\nFontWeight->\"Plain\"]\)\!\(\*
StyleBox[\"\\\\n\",\nFontWeight->\"Plain\"]\)\!\(\*
StyleBox[\"\\\\n\",\nFontWeight->\"Plain\"]\)	\!\(\*
StyleBox[\"Adds\",\nFontWeight->\"Plain\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Plain\"]\)\!\(\*
StyleBox[\"two\",\nFontWeight->\"Plain\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Plain\"]\)\!\(\*
StyleBox[\"numbers\",\nFontWeight->\"Plain\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Plain\"]\)\!\(\*
StyleBox[\"together\",\nFontWeight->\"Plain\"]\)"

Begin["Private`"];

cfAdd[x_, y_]:=
If[NumberQ[x] && NumberQ[y],
	Return[x + y],
	Return["Please give two numbers for addition."]
]

End[];

EndPackage[];
