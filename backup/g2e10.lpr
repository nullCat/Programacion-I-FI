program g2e10;
const
  cableBase = 1350;
  peliculas = 200;
  deportes = 270;
  internetBase = 800;
  grabar = 150;
var
  cable, internet, paquetePeliculas, paqueteDeportes, grabarProgramas: string;
  planInternet, mes: byte;
  precioFinal : real;
begin
  write('Cable? > '); readln(cable);
  if(cable = 'si') then
  begin
    precioFinal := cableBase;
    write('Paquete peliculas > '); readln(paquetePeliculas);

    if(paquetePeliculas = 'si') then
      precioFinal := precioFinal + peliculas;

    write('Paquete deportes > '); readln(paqueteDeportes);

    if(paqueteDeportes = 'si') then
      precioFinal := precioFinal + deportes;
  end;

  write('Internet? > '); readln(internet);
  if(internet = 'si') then
  begin
    writeln('Plan 1 = 6MB | Plan 2 = 10MB y WIFI > '); readln(planInternet);

    if(planInternet <> 2) then
      precioFinal := precioFinal + internetBase
    else
      precioFinal := precioFinal + internetBase * 1.20;

    write('Grabar Peliculas? > '); readln(grabarPeliculas);

    if(grabarPeliculas = 'si') then
      precioFinal := precioFinal + grabar;
  end;

  //bonificacion extra
  if(internet = 'si') and (cable = 'si') then
    precioFinal := precioFinal - precioFinal * 0.25;

  //meses
  write('Meses de contratacion > '); readln(mes);

  writeln('El precio final es de; por mes = $', precioFinal:0:1, ' | en total = $', (precioFinal * mes):0:1);

  readln;
end.

