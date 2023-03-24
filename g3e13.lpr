program g3e13;
var
  tipo : char;
  precio : real;
begin
  {P=panadería, F=fiambrería, A=almacén}
  readln(precio);
  repeat
    Readln(tipo); Tipo := Upcase(tipo);
  until (tipo = 'P') or (tipo = 'F') or (tipo = 'A');
  readln;
end.

