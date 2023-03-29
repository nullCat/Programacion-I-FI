program g3e19;
var
  max, x, a: integer;
  arch: text;
begin
  max := -1;
  a := 0;
  assign(arch, 'g3e19.txt');
  reset(arch);
  while not eof(arch) do
  begin
    //leer hasta encontrar un negativo.
    read(arch, x);
    //writeln('{',x,'}');
    if x >= 0 then
    begin
      if x > max then
        max := x;
    end
    else
    begin

      //guarda valor 'a', para determinar que ya existe un primer negativo..
      if a < 0 then
      begin
        //si 'a' es negativo, entonces este otro valor negativo es el cierre.
        //mostrar maximo del subconjunto
        write(max, ' ');
        max := -1;
        a := x;
      end
      else
      begin
        a := x;
      end;

    end;

  end;
  close(arch);
  readln;
end.

