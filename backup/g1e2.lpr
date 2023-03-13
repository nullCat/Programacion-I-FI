program g1e2;
var
  A, B, k : integer;
begin
  write('Ingrese el termino K-esimo > '); readln(k);
  A := 1 + 3 * (k - 1);
  writeln('El valor de la sucesion en el termino ', k, ' es = ', A);
  B := (1 + 3 * k) - A;
  writeln('La diferencia entre k y (k + 1) es ', B);
end.

