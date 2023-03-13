program g1e6;
var
  N, UltimasCifras, Centenas: integer;
begin
  write('Ingrese un numero entero mayor a 999: ');
  readln(N);

  //a) Extraer las tres ultimas cifras
  UltimasCifras := N mod 1000;

  writeln('Las tres ultimas cifras de ', N, ' son ', UltimasCifras);

  //b) Extraer centenas.
  Centenas := (N div 100) mod 10;

  writeln('Las centenas de ', N, ' son ', Centenas);

  readln;
end.

