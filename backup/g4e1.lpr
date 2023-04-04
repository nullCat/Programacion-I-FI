program g4e1;
function Es_Caracter(c: char) : boolean;
begin
  Es_Caracter := (('a' <= c) and (c <= 'z')) or (('A' <= c) and (c <= 'Z'))
end;
var
  c : char;
begin
  write('Ingrese un caracter > '); readln(car);
  write('El caracter ingresa es una letra? : ', Es_Caracter(c));
  readln;
end.

