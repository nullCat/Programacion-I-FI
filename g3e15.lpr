program g3e15;
var
  arch: text;
  c, c_ant, ca, cb: char;
  acum_a, acum_b : word;
  pal, puede_sumar : boolean;
begin
  puede_sumar := true;
  pal := false;
  c := ' ';
  c_ant := ' ';
  assign(arch, 'g3e15.txt');
  reset(arch);
  write('a) ingrese un caracter > '); readln(ca);
  write('b) ingrese otro caracter > '); readln(cb);
  acum_a := 0;
  acum_b := 0;
  while not eof(arch) do
  begin
    //lectura de palabras.
    c_ant := c;
    read(arch,c);

    //inicio de palabra.
    if(c <> ' ') and (c_ant = ' ') then
    begin
      //aprovecho para realizar el inciso a)
      puede_sumar := true;
      pal := true;
      if Upcase(c) = Upcase(ca) then
        acum_a := acum_a + 1;
    end
    //fin de palabra.
    else if((c = ' ') or (c = '.')) and (c_ant <> ' ') then
      pal := false;

    //analizar si no terminó la palabra y si aún no acumulo para b).
    if pal and puede_sumar then
    begin
      if Upcase(c) = Upcase(cb) then
      begin
        acum_b := acum_b + 1;
        puede_sumar := false; //ya verificó en esta palabra.
      end;
    end;

  end;
  close(arch);
  writeln('a) La cantidad de palabras que comienzan con la letra ', ca, ' son ', acum_a);
  writeln('b) La cantidad de palabras que contienen la letra ', cb, ' son ', acum_b);

  readln;
end.

