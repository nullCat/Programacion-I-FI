program g4e2;
function Factorial(n: Qword): Qword;
var
  i, acum, res : Qword;
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
  n: Qword;
begin
  write('Ingrese un numero > '); readln(n);
  writeln(n, '! = ', Factorial(n));
  readln;
end.

