program g1e1;
const
  B = 9.5;
  W = 4.5;
var
  N, M, X: double;
begin
  write('a) Ingrese litros de pintura Blanca > '); readln(N);
  X := N * B / W;
  writeln('Usted requiere ', X, ' litros de pintura blanca');
  write('b) Ingrese litros de pintura Negra > '); readln(M);
  X := M * W / B;
  writeln('Usted requiere ', X, ' litros de pintura negra');
  readln;
end.

