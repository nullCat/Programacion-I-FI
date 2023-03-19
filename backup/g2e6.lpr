program g2e6;
var
  a,b,c : char;
  min,med,max: char;
begin
  write('Ingrese 3 caracteres > '); readln(a,b,c);

  //a

  //menor
  if(a < b) and (a < c) then
    min := a;
  if(b < a) and (b < c) then
    min := b;
  if(c < a) and (c < b) then
    min := c;

  //mayor
  if(a > b) and (a > c) then
    max := a;
  if(b > a) and (b > c) then
    max := b;
  if(c > a) and (c > b) then
    max := c;

  //intermedio
  if(a > min) and (a < max) then
    med := a;
  if(b > min) and (b < max) then
    med := b;
  if(c > min) and (c > max) then
    med := c;


  readln;
end.

