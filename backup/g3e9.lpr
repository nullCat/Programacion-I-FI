program g3e9;
uses crt;
var
  arch: text;
  num, num_ant: real;
  asc: boolean;
begin
  //leer archivo
  num_ant := -99999;
  num := num_ant;
  assign(arch, 'g3e9_data.txt');
  reset(arch);
  asc := true;
  while not eof(arch) and asc do
  begin
    writeln(num_ant:0:1, ' > ', num:0:1);
    if(num_ant > num) then
    begin
      TextColor(3);
      writeln(num_ant:0:1, ' > ', num:0:1);
      TextColor(12);
      asc := false;
    end;
    num_ant := num;
    read(arch, num);
  end;
  close(arch);

  write('a');
  if asc then
    writeln('ascendente')
  else
    writeln('no ascendente');

  readln;
end.

