program g2e3;
var
  temp: integer;
begin
  readln(temp);
  if temp < 0 then writeln('No salgo de casa')
  else if (temp >= 0) and (temp < 20) then writeln('Hace frio')
  else if (temp >= 20) and (temp < 29) then writeln('Barbaro)
  else writeln('Que calor!');
end.

