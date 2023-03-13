program g1e4;
Const
  LimInf = 10;
  LimSup = 255;
Var
  X,Y: real;
  N,M: integer;
  Cadena: string;
  Car: char;
  Mayus, Cumple, Ok: boolean;
begin
  Cumple := true;
  N := 20;
  M := 1;
  X := 5.8;
  Y := 12.7;
  car := 'B';
  Cadena := 'asdsadsa';

  //a
  Mayus := Upcase(Car) = Car;
  Cumple := (X >= LimInf) and (X <= LimSup);
  Mayus := ('A' = Car) or ('B' = car);
  Cumple := Length(Cadena) <= LimSup;
  M := Round(N / LimInf);
  Ok := (LimInf < M) and (M < LimSup);
  Ok := Odd(N);

  Cumple := true;
  N := 20;
  M := 1;
  X := 5.8;
  Y := 12.7;
  car := 'B';
  Cadena := 'asdsadsa';

  //b
  Ok := not Cumple or (N < LimInf) and (X <> Y);
  X := N / 3 + M * Y;
  Mayus := Cumple or (car = 'S') and (odd(N));
  N := trunc(X) + LimInf;

  writeln('Ok = ', Ok);
  writeln('X = ', X:0:1);
  writeln('Mayus = ', Mayus);
  writeln('N = ', N);
  readln;
end.

