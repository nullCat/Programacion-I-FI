program g2e5;
var
  a,b,c : integer;
begin
  write('Ingrese 3 numeros enteros > '); readln(a,b,c);

  //a
  if(a > b) and (a > c) then
    writeln(a, ' es mayor');
  if(b > a) and (b > c) then
    writeln(b, ' es mayor');
  if(c > a) and (c > b) then
    writeln(c, ' es mayor');
  if(a = b) and (b = c) then
    writeln('No hay un maximo unico');

  //b
  if(a > b) and (a > c) then
    writeln(a, ' es mayor')
  else if(b > a) and (b > c) then
    writeln(b, ' es mayor')
  else if(c > a) and (c > b) then
    writeln(c, ' es mayor')
  else
    writeln('Son todos iguales');

  //c
  if a > b then
  begin
    if a > c then
      writeln(a, ' es mayor')
  end
  else if b > c then
  begin
    if b > a then
      writeln(b, ' es mayor')
  end
  else if c > a then
  begin
    if c > b then
      writeln(c, ' es mayor')
  end
  else
    writeln('No hay un maximo unico');


  readln;
end.

