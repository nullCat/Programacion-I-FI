program g3e23;
uses Crt;
var
  arch, arch_salida: text;
  contra, max_falsa_contra: string;
  c, c_ant,extra: char;
  hay_contra, valida, tiene_minus, tiene_mayus, tiene_esp, tiene_digito, unica_verif: boolean;
  cant_digitos, max_digitos, cant_contra, cant_falsa_contra: byte;
  porcentaje_falsa_contra: real;
begin
  hay_contra := false;
  max_digitos := 0;
  max_falsa_contra := '';
  cant_contra := 0;
  unica_verif := true;
  cant_falsa_contra := 0;
  porcentaje_falsa_contra := 0.0;
  c := ' ';
  extra := ' ';
  contra := '';
  cant_digitos := 0;
  tiene_mayus := false;
  tiene_minus := false;
  tiene_digito := false;
  tiene_esp := false;
  c_ant := c;
  assign(arch, 'g3e23.txt');
  reset(arch);
  assign(arch_salida, 'g3e23_salida.txt');
  rewrite(arch_salida);
  while not eof(arch) do
  begin

    {lectura de datos}
    c_ant := c;
    read(arch, c);

    {verificar si hay contraseña}
    if (c <> ' ') and (c_ant = ' ') then
      hay_contra := true
    else if ((c = ' ') and (c_ant <> ' ')) or eof(arch) then
    begin
      tiene_esp := not tiene_mayus and not tiene_minus and not tiene_digito;

      hay_contra := false;
      cant_contra := cant_contra + 1;
      valida := true;

      {procesar validacion de contraseña}
      valida := (Length(contra) >= 8) and (tiene_mayus or tiene_minus) and (cant_digitos = 4) and not tiene_esp;

      {finalizar proceso}
      if valida then
      begin
        {escribir en archivo de salida}
        write(arch_salida,contra,extra);
        TextColor(9);
        write(contra, extra);
      end
      else
      begin
        {si es falsa}
        cant_falsa_contra := cant_falsa_contra + 1;
        if Length(contra) > max_digitos then
        begin
          max_digitos := Length(contra);
          max_falsa_contra := contra;
        end;
        TextColor(4);
        write(contra, extra);
      end;

      {inicializar valores}
      cant_digitos := 0;
      unica_verif := true;
      contra := '';
    end;

    {si hay contraseña}
    if hay_contra then
    begin
      {almacenar contraseña}
      contra := contra + c;
      {verificar ciertas condiciones}
      if unica_verif then
      begin
        tiene_mayus := ('A' <= c) and (c <= 'Z');
        tiene_minus := ('a' <= c) and (c <= 'z');
        unica_verif := false;
      end;

      if('0' <= c) and (c <= '9') then
      begin
        cant_digitos := cant_digitos + 1;
        tiene_digito := true;
      end;
    end;


  end;

  close(arch);
  close(arch_salida);

  {mostrar resultados}
  TextColor(15);
  if cant_contra > 0 then
    porcentaje_falsa_contra := ((cant_falsa_contra * 100) / cant_contra);

  writeln('El % de contrasenias invalidas es ', porcentaje_falsa_contra:0:2);

  if max_falsa_contra <> '' then
    writeln('La longitud de la contrasenia invalida mas larga es de ', max_digitos, ' caracteres')
  else
    writeln('No existen contrasenias invalidas');

  readln;
end.

