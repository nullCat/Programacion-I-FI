program g3e17;
const
  d = 0.90;
var
  arch: text;
  nombre, nombre_max: string;
  cant_ar, cant_ar_of, max_cant_ar_of, solo_of, i: byte;
  desc_acum: double;
  precio_base, monto_total: real;
  extra, promocion: char;
  compro_solo_of: boolean;
begin
  nombre_max := '';
  nombre := '';
  max_cant_ar_of := 0;
  solo_of := 0;

  assign(arch, 'g3e17.txt');
  reset(arch);
  while not eof(arch) and (nombre <> '*****') do
  begin
    //lee nombre
    readln(arch, nombre);

    //procesa el cliente si es valido
    if(nombre <> '*****') then
    begin
      //inicializa valores
      i := 0;
      monto_total := 0.0;
      desc_acum := 0;
      cant_ar_of := 0;
      compro_solo_of := true;

      //lee cantidad de articulos
      readln(arch, cant_ar);

      //procesa todos los articulos
      repeat
        readln(arch,precio_base,extra,promocion);

        if Upcase(promocion) = 'S' then
        begin
          cant_ar_of := cant_ar_of + 1;
          monto_total := monto_total + (precio_base * d);
          desc_acum := desc_acum + (100 * ( 1 - d ));
        end
        else
        begin
          compro_solo_of := false;
          monto_total := monto_total + precio_base;
        end;

        i := i + 1;
      until(i = cant_ar);

      //b)
      if cant_ar_of > max_cant_ar_of then
      begin
        max_cant_ar_of := cant_ar_of;
        nombre_max := nombre;
      end;

      //c)
      if compro_solo_of then
        solo_of := solo_of + 1;

      //mostrar
      writeln('venta realizada a: ', nombre, ' | monto total de venta = $', monto_total:0:1 , ' | cantidad de descuento acumulado: ', desc_acum:0:1,'%');
    end;

  end;
  writeln('El cliente que compro mas articulos en oferta es: ', nombre_max, ', con, ', max_cant_ar_of, ' articulos.');
  close(arch);
  readln;
end.

