program g3e20;
var
  acum, cant, x, a: integer;
  arch: text;
  prom : real;
begin
  acum := 0;
  cant := 0;
  a := 0;
  assign(arch, 'g3e20.txt');
  reset(arch);
  while not eof(arch) do
  begin
    //leer hasta encontrar un negativo.
    read(arch, x);
    //writeln('{',x,'}');
    if x > 0 then
    begin
      acum := acum + x;
      cant := cant + 1;
      //writeln(acum, ' | ', cant);
    end
    else
    begin

      //guarda valor 'a', para determinar que ya existe un primer negativo..
      if a < 0 then
      begin
        //si 'a' es negativo, entonces este otro valor negativo es el cierre.
        //mostrar el promedio del subconjunto
        if cant > 0 then
        begin
          prom := (acum / cant);
          writeln(prom:0:1, ' ');
        end
        else
        prom := 0;
        acum := 0;
        cant := 0;
        a := x;
      end
      else
      begin
        prom := 0;
        acum := 0;
        cant := 0;
        a := x;
      end;

    end;

  end;
  close(arch);
  readln;
end.
