program g2e8;
const
  recargo = 1.05;
  deporteAdicional = 250;
  piletaEscuela = 800;
var
  cantDeportes, edad, diaAbono : integer;
  cuota : real;
  pileta : string;
  paga, adicional : boolean;
begin
  write('Ingrese edad del socio > '); readln(edad);

  paga := true;
  if(edad > 18) then
    cuota := 1800
  else if(edad <= 18) and (edad >= 13) then
    cuota := 1200
  else if(edad >= 5) and (edad <= 12) then
    cuota := 750
  else
    paga := false;

  if(paga) then
  begin
    write('Cuantos deportes realiza? > '); readln(cantDeportes);
    write('Realiza pileta escuela? > '); readln(pileta);
    write('Ingrese dia de abono > '); readln(diaAbono);
    cuota := cuota + deporteAdicional * (cantDeportes - 2);

    //adicional
    if(pileta = 'si') then
      cuota := cuota + piletaEscuela;

    //abono despues del dia 15.
    if(diaAbono > 15) then
      cuota := cuota * recargo;

    //cuota final
    writeln('Cuota final a pagar = $', cuota:0:1);

  end
  else
    writeln('No debe pagar');

  readln;

end.

