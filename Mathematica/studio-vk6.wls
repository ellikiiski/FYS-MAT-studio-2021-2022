#!/usr/bin/env wolframscript
(* ::Package:: *)

ClearAll["Global`*"]
y[k_] = a*Sqrt[k];
i[s_, k_]=s*y[k];
d[k_] =p*k;
a=1.2;
p=0.03;
Manipulate[Plot[{y[k],i[s,k],d[k]},{k,0,1000}, AxesLabel->{"p\[ADoubleDot]\[ADoubleDot]oma", "tuotanto"}, PlotLegends->{"kokonaistuotanto","investoinnit","poistot"}],{s,0.1,1}]


ksol[s_]=Solve[i[s,k]==d[k],{k}][[2,1,2]];
Manipulate[Plot[{y[k],i[s,k],d[k]},{k,0,1000}, GridLines->{{ksol[s]},{}}, AxesLabel->{"p\[ADoubleDot]\[ADoubleDot]oma", "tuotanto"}, PlotLegends->{"kokonaistuotanto","investoinnit","poistot"}],{s,0.1,1}]


DynamicModule[{s=0.5`},Plot[{y[k],i[s,k],d[k]},{k,0,1000},GridLines->{{ksol[s]},{}},AxesLabel->{"p\[ADoubleDot]\[ADoubleDot]oma","tuotanto"},PlotLegends->{"kokonaistuotanto","investoinnit","poistot"}]]


kv[s_]=y[ksol[s]]-d[ksol[s]];
D[kv[s],s];
Solve[%==0,s];
smax = %[[2,1,2]]


ClearAll["Global`*"]
p[t_]=0.004;
DSolve[{k'[t]==c*p[t]-c*k[t],k[0]==0.0025},k[t],t];
rat[c_]=%[[1,1,2]];
Solve[{rat[c]==0.0027/.{t->1}},c];
cee=%[[1,1,2]];
k[t_]=rat[cee]
Solve[k[t]==0.0035,t,Reals]
Limit[k[t],t->Infinity]


ClearAll["Global`*"]
a=2;
b=0.2;
p=3;
q=0.1;
s=NDSolve[{x'[t]==a*x[t]-b*x[t]*y[t], y'[t]==-p*y[t]+q*x[t]*y[t],x[0]==5,y[0]==2},{x[t],y[t]},{t,0,10}];
ParametricPlot[{x[t],y[t]}/.s,{t,0,10},PlotLabel->"Peto-saalis-malli", AxesLabel->{"saaliit", "pedot"}]


x[t_]=x[t]/.s;
y[t_]=y[t]/.s;
tasap=Solve[{a*x[t]-b*x[t]*y[t]==0,-p*y[t]+q*x[t]*y[t]==0},t];
x[tasap[[1,1,2]]]
y[tasap[[1,1,2]]]


ClearAll["Global`*"]
Integrate[1/300*(p*Min[d,z*q]-c*z*q),{z,0,1}];
inte= Integrate[%,{d,0,300}];
e1[q_] = inte[[1,3,1]];
e2[q_] = inte[[1,2,1]];
e[q_]=Piecewise[{{e1[q],q<=300},{e2[q],q>300}}];
der1[q_]=D[e1[q]]
der2[q_]=D[e2[q]]
c=30;
p=120;
der[q_]=Piecewise[{{der1[q],q<=300},{der2[q],q>300}}]
Solve[der[q]==0,q]
Plot[Piecewise[{{yk[q],q<300},{kak[q],q>300}}],{q,0,500}];
Plot[kok[q], {q,0,500}];


ClearAll["Global`*"]
Integrate[1/300*(p*Min[d,z*q]-c*z*q),{z,0,1}];
inte= Integrate[%,{d,0,300}];
e1[q_] = inte[[1,3,1]];
e2[q_] = inte[[1,2,1]];
e[q_]=Piecewise[{{e1[q],q<=300},{e2[q],q>300}}];
der1[q_]=D[e1[q],q];
der2[q_]=D[e2[q],q];
der[q_]=Piecewise[{{der1[q],q<=300},{der2[q],q>300}}];
qStar[q_] = Solve[der[q]==0,q, Reals]
c=30;
p=120;
qStar[q]
Plot[e[q],{q,0,500},GridLines->{{%[[1,1,2]]},{}},AxesLabel->{"tilausm\[ADoubleDot]\[ADoubleDot]r\[ADoubleDot]","tuoton odotusarvo"}]



