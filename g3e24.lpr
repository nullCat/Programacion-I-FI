program g3e24;
var
  arch, arch_salida: text;
  c, c_ant, extra: char;
  n, i: integer;
  pal, new_pal: string;
  hay_pal, hubo_par: boolean;
begin
  c := ' ';
  extra := ' ';
  pal := '';
  c_ant := c;
  hubo_par := false;
  assign(arch, 'g3e24.txt');
  reset(arch);
  assign(arch_salida, 'g3e24_salida.txt');
  rewrite(arch_salida);

  while not eof(arch) do
  begin
   {leer}
   c_ant := c;
   read(arch, c);

   {inicio de palabra}
   if (c <> ' ') and (c_ant = ' ') then
   begin
     pal := ''; //reiniciar valor
     new_pal := '';
     hay_pal := true;
   end
   {fin de palabra}
   else if ((c = ' ') or (c = '.')) and (c_ant <> ' ') then
   begin
     {almacenar ultimo caracter}
     new_pal := new_pal + c_ant;

     if hay_pal then
       writeln(pal, ' -----> ', new_pal);
     hay_pal := false;

     {escribo new_pal en el archivo de salida}
     write(arch_salida, new_pal);
     {si no termino el archivo entonces realizar un espacio}
     if c <> '.' then
       write(arch_salida, extra);
   end;

   if hay_pal then
   begin
     pal := pal + c;
   end;

   {si el anterior a c es minuscula y c es un digito}
   if (('0' <= c) and (c <= '9')) and (('a' <= c_ant) and (c_ant <= 'z')) then
   begin
     hubo_par := true;
     Val(c, n);
     i := 0;
     {iterar n - 1 veces pues ya ha almacenado c una vez}
     while i < n do
     begin
       i := i + 1;
       new_pal := new_pal + c_ant;
     end;
   end
   else
   begin
     {hay_pal es la unica forma de saber que en la anterior iteracion
     hubo un par}
     if hay_pal and (c_ant <> ' ') and not hubo_par then
       new_pal := new_pal + c_ant;

     if hubo_par then
       hubo_par := false;
   end;

  end;
  close(arch);
  close(arch_salida);
  readln;
end.

