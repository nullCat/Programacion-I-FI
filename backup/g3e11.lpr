program g3e11;
uses crt;
var
  tipo : char;
  monto, saldo: real;
  arch: text;
  nombre : string[15];
  n1, n2, n3, sum, prom : real;
begin
  //a
  assign(arch,'g3e11_a.txt');
  reset(arch);
  readln(arch,saldo);
  writeln('> Saldo = $', saldo:0:1);
  while not eof(arch) do
  begin
   readln(arch,tipo,monto);
   writeln('------------------------------');
   writeln('> Operacion realizada: ', tipo);
   if tipo = 'D' then
   begin
    writeln('> Se ha depositado $', monto:0:1);
    saldo := saldo + monto;
   end
   else if tipo = 'R' then
   begin
     if monto > saldo then
       writeln('> No puede retirarse saldo')
     else
     begin
      saldo := saldo - monto;
      writeln('> Se ha retirado $', monto:0:1);
     end;
   end;
   writeln('> Saldo = $', saldo:0:1);
  end;
  close(arch);
  ClrScr();
  //b
  sum := 0.0;
  assign(arch,'g3e11_b.txt');
  reset(arch);
  while not eof(arch) do
  begin
   readln(arch,nombre,n1,n2,n3);
   sum := n1 + n2 + n3;
   prom := sum / 3;
   writeln('--------------------------');
   writeln('Nombre alumno: ', nombre);
   writeln('Promedio: ', prom:0:1);
   if prom >= 4 then
     writeln('Condicion: Aprobado')
   else
     writeln('Condicion: Desaprobado');
  end;
  close(arch);
  readln;
end.

