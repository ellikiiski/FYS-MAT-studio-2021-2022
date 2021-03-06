(* ::Package:: *)

(* ::Input:: *)
(*Series[Sin[x],{x,0,3}]*)


(* ::Input:: *)
(*Normal[Series[Sin[x],{x,0,3}]]*)


(* ::Input:: *)
(*N[Pi,20]*)


(* ::Input:: *)
(*f[x_] = x^2+3*x-5;*)
(*Solve[f[x]==0,x]*)


(* ::Input:: *)
(*Normal[Series[Sin[x], {x,0,5}]];*)
(*Plot[{Sin[x],%},{x,-2*Pi,2*Pi}, PlotLegends->{"sin(x)","Taylor"}, GridLines->Automatic]*)


(* ::Input:: *)
(*ClearAll["Global`*"]*)
(*Ctot[q_] = a*(d/q)+b*(q/2)*)
(*der = D[Ctot[q],q]*)


(* ::Input:: *)
(*Solve[der == 0, q]*)
(*qq = %[[2,1,2]]*)


(* ::Input:: *)
(*a*(d/qq)+b*(qq/2)*)


(* ::Input:: *)
(*ClearAll["Global`*"]*)
(*f[x_,y_] = 100*(y-x^2)^2+(a-x)^2;*)
(*grad = D[f[x,y],{{x,y}}];*)
(*min = Solve[grad=={0,0},{x,y}]*)
(*f[x,y] /. {x->min[[1,1,2]],y->min[[1,2,2]]}*)


(* ::Input:: *)
(*a = 1;*)
(*pic = Plot3D[f[x,y], {x,0,2},{y,0,2}]*)


(* ::Input:: *)
(*ClearAll["Global`*"]*)
(*f[a_,b_]=(a*b)/(a+b);*)
(*grad = D[f[a,b],{{a,b}}];*)
(*agrad = Abs[grad];*)
(*errorAB = {da, db};*)
(*errorF = Simplify[agrad.errorAB]*)
(*a = 85;*)
(*da = 1;*)
(*b = 196;*)
(*db = 2;*)
(*F = f[a,b]*)
(*N[%]*)
(*{F-errorF,F+errorF}*)
(*N[%]*)


(* ::Input:: *)
(*ClearAll["Global`*"]*)
(*A[r_,p_] = (1/2)*p*r^2;*)
(*grad = D[A[r,p], {{r,p}}];*)
(*agrad = Abs[grad];*)
(*errorRP = {dr,dp};*)
(*errorA=Simplify[agrad.errorRP]*)
(*deltaR=Solve[errorA==dA,dr]*)
(*deltaR /. {dA->(1/2), dp->(1/100)*(2*Pi/360)};*)
(*Expand[%];*)
(*Simplify[%]*)
(*deltaR /. {dA-> (1/2), r-> 50, p-> 2*Pi/3,*)
(*dp-> (1/100)*(2*Pi/360)};*)
(*Simplify[%]*)
(*N[%]*)



