program g4e4;
function Power(X,n: integer): real;
var
  acum : real;
  i: integer;
begin
  i := Abs(n);
  acum := 1;
  while i > 0 do
  begin
    i := i - 1;
    acum := acum * X;
  end;

  if n < 0 then
    acum := (1 / acum);
  Power := acum;
end;
var
  X, n: integer;
begin
  write('Ingrese X y n > '); readln(X,n);
  writeln(X, ' ^ ', n, ' = ', Power(X,n):0:3);
  readln;
end.

