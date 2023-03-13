program g1e3;
const
  //paga por hora
  P = 200;
var
  horas, sueldo_bruto, sueldo_neto : double;
begin
  write('Ingrese la cantidad de horas trabajadas > '); readln(horas);
  sueldo_bruto := horas * P;
  sueldo_neto := sueldo_bruto * (1 - 0.11 - 0.05);
  writeln('Sueldo bruto: $', sueldo_bruto);
  writeln('Sueldo neto: $' , sueldo_neto);
  readln;
end.

