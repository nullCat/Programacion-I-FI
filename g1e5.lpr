program g1e5;
const
  baldosa = 0.25;
  N_max = 10;
  M_max = 30;
var
  S, S_max, N, M, P : double;
  baldosa_cantidad : integer;
  S_baldosa : double;
begin
  //a
  write('Ingrese N y M > ' ); readln(N,M);
  S := N * M;
  S_max := N_max * M_max;
  P := S * 100 / S_max;
  writeln('La sub-superficie equivale al ', P:0:1, '% del total de la Superficie');

  //b
  S_baldosa := baldosa * baldosa;
  baldosa_cantidad := Round(S / S_baldosa);
  writeln('Si las baldosas miden ', baldosa:0:2, ' x ', baldosa:0:2, ' usted requiere de ', baldosa_cantidad, ' baldosas');
  readln;
end.

