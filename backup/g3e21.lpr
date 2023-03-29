program g3e21;
var
  arch: text;
  sub, max_cant, max_cant_sub, cant, cierre: byte;
  num, acum, max : integer;
  salir : boolean;
begin
  acum := 0;
  salir := false;
  cierre := 0;
  max := -1;
  max_cant := 0;
  max_cant_sub := 0;
  cant := 0;
  sub := 1;
  assign(arch, 'g3e21.txt');
  reset(arch);
  writeln('subconjunto  Maximo');
  while not eof(arch) and not salir do
  begin
    read(arch, num);
    if num = 0 then
    begin

      cierre := cierre + 1;

      //dos ceros consecutivos?
      if cierre = 2 then
        salir := true
      else
      begin
        //informa posibles datos
        writeln(sub, ' | ', max);

        //determina si la cantidad de elementos es maxima
        if cant > max_cant then
        begin
          max_cant := cant;
          max_cant_sub := sub;
        end;

        //nuevo subconjunto
        sub := sub + 1;
        max := -1;
        cant := 0;
      end;

    end
    else
    begin

      cierre := 0;
      cant := cant + 1;
      //busca maximo
      if num > max then
        max := num;

    end;
  end;
  close(arch);
  writeln('El subconjunto con mas elementos es: ', max_cant_sub);
  readln;
end.

