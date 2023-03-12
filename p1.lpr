program g1;
uses Sysutils, Crt;
const
  k = 60;
type
  W = array[1..k] of integer;
  IntervaloSimple = record
    primerValor : integer;
    ultimoValor : integer;
  end;
procedure Blank_Space(space : integer);
var
  i : integer;
begin
 if(space > 0) then
   for i := 1 to space do
     writeln;
end;
function Respuesta(chara: string): boolean;
begin
 LowerCase(chara);
 case(chara) of
    'si': Respuesta := true;
    'yes': Respuesta := true;
    'y': Respuesta := true;
    's': Respuesta := true;
    'no': Respuesta := false;
    'n': Respuesta := false;
 end;
end;
function Integer_Aleatorio(min,max : integer) : integer;
begin
 //genera un numero integer aleatorio entre 0 y max.
 //se divide este valor aleatorio por max para dar
 //un coeficiente float entre [0,1] que funciona como un "porcentaje".
 //se multiplica por el rango entre max y min.
 //siendo el rango, r = max - min
 //como resultado da un valor comprendido entre [0,r] / r < max.
 //por ultimo se le suma el min, para que el valor quede
 //comprendido entre [min, r + min] => [min, (max - min) + min] => [min, max].
 //devolviendo un valor aleatorio integer entre [min, max].
 Integer_Aleatorio := Round(((Random(max) / max) * (max - min) + min));
end;
procedure Mostrar_conjunto_simple(X : W; N : integer);
var
  i : integer;
begin
 //mostrar conjunto X
 write('X = {');
 for i := 1 to N do
 begin
   write(X[i]);
   if(i < N) then
     write(',');
 end;
 writeln('}');
end;
procedure Definir_conjunto_simple(var X : W; var N : integer);
var
  i, min, max : integer;
  entrada : integer;
  random: string;
begin
 i := 1;
 TextColor(14);
 //conjunto X
 write('> Generar elementos del conjunto X de manera aleatoria?: ');
 readln(random);

 //Cantidad de Elementos.
 write('> Ingrese la cantidad de elementos de X: ');
 readln(N);

 if(Respuesta(random)) then
 begin

   //Generación aleatoria.
   repeat
     write('> Ingrese el valor minimo a generar: ');
     readln(min);
     write('> Ingrese el valor maximo a generar: ');
     readln(max);
   until(min < max);

   //Generando conjunto X:
   for i := 1 to N do
   begin
     x[i] := Integer_Aleatorio(min,max);
   end;

 end
 else
 begin

   //Generación seleccionada.
   //para cada elemento Xi del Conjunto
   while(i <= N) do
   begin
     write('> Ingrese el elemento X', i, ': ');
     readln(entrada);
     if(entrada > 0) then
     begin
       X[i] := entrada;
       i := i + 1;
     end
     else
     begin
       TextColor(4);
       writeln('> Error, ingrese un valor natural');
       TextColor(14);
     end;
   end;

 end;

end;
function Definir_intervalo_simple() : IntervaloSimple;
var
  gamma : IntervaloSimple;
  min,max: integer;
begin
 //inicializar gamma a null
 gamma.primerValor := 0;
 gamma.ultimoValor := 0;

 //Entrada de datos.
 repeat
   write('Ingrese [min,max] / min < max : ');
   readln(min,max);
 until(min < max);

 if(min > max) or (min = max) then
   Definir_intervalo_simple := gamma
 else
 begin
   gamma.primerValor := min;
   gamma.ultimoValor := max;
   Definir_intervalo_simple := gamma;
 end;
end;
function Definir_intervalo_simple(min,max: integer) : IntervaloSimple;
var
  gamma : IntervaloSimple;
begin
 //inicializar gamma a null
 gamma.primerValor := 0;
 gamma.ultimoValor := 0;

 if(min < max) or (min = max) then
   Definir_intervalo_simple := gamma
 else
 begin
   gamma.primerValor := min;
   gamma.ultimoValor := max;
   Definir_intervalo_simple := gamma;
 end;
end;
procedure Mostrar_intervalo_simple(gamma : IntervaloSimple);
begin
  //mostrar intervalo
  writeln('[', gamma.primerValor, ';', gamma.ultimoValor, ']');
end;
function Int_intervalo_simple(alpha, beta: IntervaloSimple): IntervaloSimple;
var
  gamma : IntervaloSimple;
  new_max, new_min: integer;
begin
 //caso nulo
 gamma.primerValor := 0;
 gamma.ultimoValor := 0;

 //caso 1
 if((alpha.ultimoValor > beta.primerValor) and (beta.ultimoValor > alpha.primerValor)) then
 begin

   if(alpha.ultimoValor > beta.ultimoValor) then
     new_max := alpha.ultimoValor
   else
     new_max := beta.ultimoValor;

   if(alpha.primerValor > beta.primerValor) then
     new_min := alpha.primerValor
   else
     new_min := beta.primerValor;

 end

 //caso 2
 else if(alpha.ultimoValor > beta.primerValor) then
 begin
   new_max := alpha.ultimoValor;
   new_min := beta.primerValor;
 end

 //caso 3
 else if(beta.ultimoValor > alpha.primerValor) then
 begin
   new_max := beta.ultimoValor;
   new_min := alpha.primerValor;
 end;

 gamma.primerValor := new_min;
 gamma.ultimoValor := new_max;

 Blank_Space(1);
 writeln('[', alpha.primerValor, ';', alpha.ultimoValor, '] INT [', beta.primerValor, ';', beta.ultimoValor, '] = ', '[', gamma.primerValor, ';', gamma.ultimoValor, ']');
 Blank_Space(1);

 Int_intervalo_simple := gamma;
end;
procedure Ejercicio_1();
var
  prom, i, N, sum, C : integer;
  X : W;
begin
 TextColor(4);
 writeln('1) Dado N numeros naturales, determinar cuantos superan el promedio.');
 i := 1;
 sum := 0;
 C := 0;
 N := 0;

 //definir conjunto X.
 Definir_conjunto_simple(X, N);
 Mostrar_conjunto_simple(X, N);
 Blank_Space(1);

 //definir promedio.
 for i := 1 to N do
   sum := sum + X[i];
 prom := sum div N;

 //definir cuantos superan el promedio.
 for i := 1 to N do
 begin
   if(X[i] > prom) then
     C := C + 1;
 end;

 //resultado.
 TextColor(14);
 writeln('=========================');
 writeln('SOLUCION:');
 writeln('*Promedio = ', prom);
 writeln('*La cantidad de Numeros del Conjunto X que superan el Promedio son: ',
 C);
 writeln('=========================');
 Blank_Space(2);
end;
procedure Ejercicio_2();
var
  alpha, beta, omega: IntervaloSimple;
  X : W;
  N, N_alpha, N_beta, N_gamma, N_omega : integer;
  p_alpha, p_beta, p_gamma, p_omega : double;
  i : byte;
begin
 //consigna.
 TextColor(4);
 writeln('2) Dado un conjunto de N numeros reales y dos intervalos [A,B] y [C,D], donde A <> C y B <> D, encontrar: ');
 writeln('a) Porcentaje de numeros que pertenecen al intervalo [A,B]');
 writeln('b) Porcentaje de numeros que pertenecen al intervalo [C,D]');
 writeln('c) Cuantos numeros pertenecen a [A,B] U [C,D]');
 writeln('d) Cuantos numeros pertenecen a [A,B] INT [C,D]. Determinar si existe un ejemplo donde: ');
 writeln('- Respuesta = 0');
 writeln('- Respuesta = N');

 //inicialización
 N := 0;
 N_alpha := 0;
 N_beta := 0;
 N_gamma := 0;
 N_omega := 0;

 //entrada de datos de los intervalos y conjuntos.
 repeat
   alpha := Definir_intervalo_simple();
   Mostrar_intervalo_simple(alpha);
   beta := Definir_intervalo_simple();
   Mostrar_intervalo_simple(beta);
 until((alpha.primerValor <> beta.primerValor) and (alpha.ultimoValor <> beta.ultimoValor));

 //definir conjunto X.
 Definir_conjunto_simple(X, N);
 Mostrar_conjunto_simple(X, N);
 Blank_Space(2);


 //inciso a)
 for i := 1 to N do
 begin
  if((X[i] >= alpha.primerValor) and (X[i] <= alpha.ultimoValor)) then
    N_alpha := N_alpha + 1;
 end;
 p_alpha := (N_alpha * 100 / N);

 //inciso b)
 for i := 1 to N do
 begin
  if((X[i] >= beta.primerValor) and (X[i] <= beta.ultimoValor)) then
    N_beta := N_beta + 1;
 end;
 p_beta := (N_beta * 100 / N);

 //inciso c)
 for i := 1 to N do
 begin
  if(((X[i] >= beta.primerValor) and (X[i] <= beta.ultimoValor)) or ((X[i] >= alpha.primerValor) and (X[i] <= alpha.ultimoValor))) then
    N_gamma := N_gamma + 1;
 end;
 p_gamma := (N_gamma * 100 / N);

 //inciso d)
 omega := Int_intervalo_simple(alpha,beta);

 //Escribir respuesta.
 TextColor(14);
 writeln('> Solucion inciso a): ');
 writeln('El porcentaje del conjunto [', alpha.primerValor, ';', alpha.ultimoValor, '] = ', p_alpha:0:2, '%');
 Blank_Space(1);
 writeln('> Solucion inciso b): ');
 writeln('El porcentaje del conjunto [', beta.primerValor, ';', beta.ultimoValor, '] = ', p_beta:0:2, '%');
 Blank_Space(1);
 writeln('> Solucion inciso c): ');
 writeln('El porcentaje del conjunto [', alpha.primerValor, ';', alpha.ultimoValor, '] U [', beta.primerValor, ';', beta.ultimoValor, '] = ', p_gamma:0:2, '%');

end;
procedure Ejercicio_3();
begin

end;
procedure Ejercicio_4();
begin

end;
procedure Interfaz();
var
  opcion : integer;
begin
  repeat
    TextColor(5);
    writeln('=== Menu de Opciones ===');
    writeln('1- Soluciones Ejercicio 1');
    writeln('2- Soluciones Ejercicio 2');
    writeln('3- Soluciones Ejercicio 3');
    writeln('4- Soluciones Ejercicio 4');
    writeln('5- Limpiar Consola.');
    writeln('6- Salir.');
    writeln('=========================');
    write('Selecciona una opcion > '); readln(opcion);
    Blank_Space(4);
    //Selección según la solución.
    case(opcion) of
       1 : Ejercicio_1();
       2 : Ejercicio_2();
       3 : Ejercicio_3();
       4 : Ejercicio_4();
       5 : ClrScr;
       6 : writeln('Saliendo...');
    end;
  until(opcion = 6);
end;
begin
  //interfaz
  Interfaz();
  readln;
end.

