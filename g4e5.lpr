program g4e5;
function x_lineal(a,b,d,e: integer): real;
begin
  x_lineal := a*e - d*b;
end;
function y_lineal(a,b,c: integer; x: real): real;
begin
  y_lineal := (c - a * x) / b;
end;

var
  a,b,c,d,e,f: integer;
  x,y: real;
begin
  a := 2; b := 3; c:= 5;
  d := 3; e := -2; f:= 1;
  x := x_lineal(a,b,d,e);
  y := y_lineal(a,b,c,x);
  writeln('x = ', x:0:2);
  writeln('y = ', y:0:2);
  readln;
end.

