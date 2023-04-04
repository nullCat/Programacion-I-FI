program g4e2;
function Factorial(n: Longword): Longword;
var
  i, acum, res : Longword;
begin
  i := n;
  acum := n;
  res := 1;
  while i > 1 do
  begin
   acum := acum * (i - 1);
   res := acum;
   i := i - 1;
  end;
  Factorial := res;
end;
var
  n: Longword;
begin
  write('Ingrese un numero > '); readln(n);
  writeln(n, '! = ', Factorial(n));
  readln;
end.

