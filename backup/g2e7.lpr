program g2e7;
const
  H = 1000;
  M = 1200;
  D = 0.95;
  IVA = 1.21;
var
  g, t : char;
  cant : byte;
  total : real;
begin
  write('Ingrese genero (h/m) > '); readln(g);
  write('Ingrese talle > '); readln(t);
  write('Ingrese cantidad a comprar > '); readln(cant);

  //precio base
  if(g = 'h') then
    total := H * cant * IVA;
  else
    total := M * cant * IVA;

  //promocion
  if(t = 'S') and (g = 'h') or (t = 'X') and (g = 'm') then
    total:= total * D;

  if(cant > 12) then
    total := total * 0.93;


  writeln('Su precio final es = ', total:0:1);
  readln;
end.

