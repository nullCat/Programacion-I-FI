program g3e7;
var
  nombre : string;
  acum_notas, n1,n2,n3, prom, porc_ap : real;
  total_alum, cant_ap: byte;
begin
  acum_notas := 0.0;
  total_alum := 0;
  cant_ap := 0;
  repeat
    writeln('-------------');
    write('Ingrese el nombre del alumno (*** para salir) > '); readln(nombre);
    if(nombre <> '***') then
    begin
      total_alum := total_alum + 1;
      write('Ingrese las 3 notas > '); readln(n1,n2,n3);
      acum_notas := n1 + n2 + n3;
      prom := acum_notas / 3;
      writeln('El promedio del alumno es = ', prom:0:1);
      if(prom >= 4) then
      begin
        writeln('Condicion: Aprobado');
        cant_ap := cant_ap + 1;
      end
      else
        writeln('Condicion: Desaprobado');
    end;
  until(nombre = '***');

  porc_ap := cant_ap * 100 / total_alum;

  writeln('La cantidad de alumnos aprobados es = ', porc_ap:0:1, '%');

  readln;
end.

