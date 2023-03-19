program g2e9;
const
  sueldoBasico = 8000;
  comisionVentas = 1.05;
var
  cantidadFaltas : integer;
  sueldo, presentismo, ventas, estimadoVentas : real;
begin
  write('Ingrese monto estimado de ventas > '); readln(estimadoVentas);
  write('Ingrese monto generado en ventas realizadas > '); readln(ventas);
  write('Ingrese cantidad de dias que ha faltado > '); readln(cantidadFaltas);

  sueldo := sueldoBasico + (comisionVentas * ventas);

  if(ventas > estimadoVentas) then
    sueldo := sueldo * 1.03;

  //presentismo calculo.
  if(cantidadFaltas = 0) then
  begin
    if(ventas * 0.02 > 1000) then
      presentismo := ventas * 0.02
    else
      presentismo := 1000;

    sueldo := sueldo + presentismo;
  end
  else if(cantidadFaltas > 2) then
    sueldo := sueldo * 0.93;

  writeln('Sueldo final = $', sueldo:0:1);
  readln;
end.

