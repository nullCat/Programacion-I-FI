program g4e3;
function Suma_N(N: word): QWord;
var
  acum: QWord;
  i: word;
begin
  acum := 0;
  for i := 1 to N do
  begin
    acum := acum + i;
  end;
  Suma_N := acum;
end;

var
  N: word;
begin
  write('introduce un numero N > '); readln(N);
  writeln('La suma de los primeros ', N, ' Terminos es = ', Suma_N(N));
  readln;
end.

