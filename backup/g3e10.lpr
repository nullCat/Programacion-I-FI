program g3e10;
var
  num, num_ant : integer;
  frec : word;
  arch: text;
  asc, primer_it: boolean;
begin
  primer_it := true;
  assign(arch, 'g3e10_data.txt');
  reset(arch);
  asc := true;
  frec := 1;
  writeln('Numero       ', 'Frecuencia');
  while not eof(arch) and asc do
  begin
    num_ant := num;
    read(arch, num);

    if not eof(arch) and not primer_it then
    begin
      if num_ant > num then
        asc := false
      else if num_ant < num then
      begin
        writeln(num_ant, '              ', frec);
        frec := 1;
      end
      else if num_ant = num then
        frec := frec + 1;
    end

    if eof(arch) then
      writeln(num_ant, '              ', frec);

    if primer_it then
      primer_it := false;
  end;
  close(arch);
  if not asc then
    writeln('Archivo no ordenado ascendentemente..');
  readln;
end.

