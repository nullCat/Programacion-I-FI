program g2e4;
Uses math;
var
  dia1, mes1, dia2, mes2: byte;
  anio1, anio2: word;
begin
  write('Ingrese primer fecha (d/m/a) > '); readln(dia1,mes1,anio1);
  write('Ingrese segunda fecha (d/m/a) > '); readln(dia2,mes2,anio2);

  if anio1 > anio2 then
  begin
    writeln('Fecha 2 es mas antigua');
    writeln('Trimestre = ', Ceil(mes2 / 3));
  end
  else if anio1 < anio2 then
  begin
    writeln('Fecha 1 es mas antigua');
    writeln('Trimestre = ', Ceil(mes1 / 3));
  end
  else if mes1 > mes2 then
  begin
    writeln('Fecha 2 es mas antigua');
    writeln('Trimestre = ', Ceil(mes2 / 3));
  end
  else if mes1 < mes2 then
  begin
    writeln('Fecha 1 es mas antigua');
    writeln('Trimestre = ', Ceil(mes1 / 3));
  end
  else if dia1 > dia2 then
  begin
    writeln('Fecha 2 es mas antigua');
    writeln('Trimestre = ', Ceil(mes2 / 3));
  end
  else if dia1 < dia2 then
  begin
    writeln('Fecha 1 es mas antigua');
    writeln('Trimestre = ', Ceil(mes1 / 3));
  end
  else
    writeln('Son misma fecha');

  readln;
end.

