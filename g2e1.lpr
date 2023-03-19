program g2e1;
var
  c : char;
begin
  write('Ingrese un caracter > '); readln(c);

  if('A' <= c) and (c <= 'Z') then
    writeln('Es mayus')
  else if('a' <= c) and (c <= 'z') then
    writeln('Es minus')
  else
    writeln('Es otro');

  readln;
end.

