program g2e2;
var
  a,b : boolean;
begin
//a
if a and b then
  writeln('1');
if not (a and b) then
  writeln('2');

//b
if a or b then
  writeln('1');
if not (a or b) then
  writeln('2');

readln;

end.

