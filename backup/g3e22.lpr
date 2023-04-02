program g3e22;
var
  c, c_ant: char;
  vocal_cont, vocal_max, i, k, l, cap_cont: byte;
  hay_pal, capicua: boolean;
  palabra_max, palabra, palabra_rev: string;
  arch, arch_salida : text;
begin
  c_ant := ' ';
  palabra := '';
  palabra_max := '';
  vocal_max := 0;
  vocal_cont := 0;
  cap_cont := 0;
  //lectura
  assign(arch, 'g3e22.txt');
  reset(arch);
  //escritura
  assign(arch_salida, 'g3e22_salida.txt');
  rewrite(arch_salida);
  while not eof(arch) do
  begin

    //leer palabras
    read(arch, c);

    //verificar inicio de palabra
    if(c <> ' ') and (c_ant = ' ') then
      hay_pal := true
    else if hay_pal then
    begin
      hay_pal := false;

      l := Length(palabra);

      //inciso a)
      if vocal_cont > vocal_max then
      begin
        vocal_max := vocal_cont;
        palabra_max := palabra;
      end;

      //inciso b)
      palabra_rev := '';
      {verificar si tiene mas de 4 letras}
      if Length(palabra) > 4 then
      begin
        {Guardarla en una variable pero al reves}

        for i := l downto 1 do
        begin
          palabra_rev := palabra_rev + palabra[i];
        end;

        {escribir esta variable en el archivo de texto de salida}
        writeln(arch_salida, palabra_rev);
      end;

      //inciso c)
      capicua := true;
      i := 1; k := l;

      while (i < k) and capicua do
      begin
        capicua := palabra[i] = palabra[k];
        i := i + 1;
        k := k - 1;
      end;

      writeln(palabra, '   => capicua: ', capicua);

      if capicua then
        cap_cont := cap_cont + 1;

      {reiniciar valores}
      palabra := '';
      vocal_cont := 0;

    end;

    //si hay palabra.
    if hay_pal then
    begin
      //inciso a)
      if(Upcase(c) = 'A') or (Upcase(c) = 'E') or (Upcase(c) = 'I') or (Upcase(c) = 'O') or (Upcase(c) = 'U') then
        vocal_cont := vocal_cont + 1;
      {almacenar palabra}
      palabra := palabra + c;
    end;

  end;
  //a)
  writeln('La palabra con mas vocales es: ', palabra_max, ' con: ', vocal_max, ' vocales.');
  //c
  writeln('La cantidad de palabras que son palindromas es: ', cap_cont);
  close(arch_salida);
  close(arch);
  readln;
end.

