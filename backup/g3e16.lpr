program g3e16;
var
  arch: text;
  patente, max_patente: string[5];
  cantidad_viajes, max_viajes: integer;
  total_litros, litros_de_min, km, km_acum, min_km: real;
begin
  max_viajes := -9999;
  min_km := 99999.0;
  cantidad_viajes := 0;
  km_acum := 0;
  assign(arch, 'g3e16.txt');
  reset(arch);
  while not eof(arch) do
  begin
    cantidad_viajes := 0;
    km_acum := 0;
    readln(arch, patente);
    readln(arch, total_litros);
    //viajes
    repeat
      readln(arch, km);
      km_acum := km_acum + km;
      if km <> 0 then
        cantidad_viajes := cantidad_viajes + 1;
    until(km = 0);


    //a
    if km_acum <> 0 then
      writeln('Auto: ', patente, ' | Litros/Km = ', (total_litros / km_acum):0:1)
    else
      writeln('Auto: ', patente, ' | No ha recorrido Km');

    //b
    if cantidad_viajes > max_viajes then
    begin
      max_viajes := cantidad_viajes;
      max_patente := patente;
    end;

    //c
    if km_acum < min_km then
    begin
      min_km := km_acum;
      litros_de_min := total_litros;
    end;
  end;

  close(arch);

  //informe
  writeln('b) La patente del Vehiculo: ', max_patente, ' realizo mas viajes: ', max_viajes);
  writeln('c) Total de litros consumidos: ', litros_de_min:0:1, ' por el auto que hizo menor cantidad de km: ', min_km:0:1);
  readln;
end.

