program g2e12;
Uses Math;
var
  dia, diaFinal : byte;
  diaNombre : string;
begin
  write('Ingrese un dia > '); readln(dia);
  if(dia <= 31) then
  begin
    diaFinal := dia - ((Ceil(dia / 7) - 1) * 7);

    case diaFinal of
         1: diaNombre := 'Lunes';
         2: diaNombre := 'Martes';
         3: diaNombre := 'Miercoles';
         4: diaNombre := 'Jueves';
         5: diaNombre := 'Viernes';
         6: diaNombre := 'Sabado';
         7: diaNombre := 'Domingo';
    end;

    writeln('El dia ', dia, ' corresponde a el ', diaNombre);
  end;
  readln;
end.

