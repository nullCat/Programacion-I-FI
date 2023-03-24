program g3e14;
var
  Bool : boolean;
  Sum, x : integer;
begin
  Bool:=false ;
  Sum:=0;
  Readln( x );
  while(x <> 0) and not bool do
  begin
    Sum := Sum + x;
    bool := Sum > 100;
    Readln(x);
  end;
  Writeln('Resultado = ', Sum );
  readln;
end.

