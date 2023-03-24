program g3e12;
var
  T: text;
  cad1: string[8];
  cad2, cad3: string[3];
  a,b: word;
  x: real;
  c, inc: char;
begin
  inc := 'a';
  repeat
    cad1 := '-';
    cad2 := '-';
    cad3 := '-';
    a := 0;
    b := 0;
    x := 0;
    c := '-';
    assign(T, 'g3e12.txt');
    reset(T);
    while not eof(T) do
    begin
      case inc of
      'a':
        begin
        //a.
        readln(T, cad2, c, x);
        readln(T, a);
        readln(T, cad1);
        writeln('a) cad1 = ', cad1, ' | cad2 = ', cad2, ' | cad3 = ', cad3, ' | a = ', a, ' | b = ', b, ' | x = ', x:0:1, ' | c = ', c);
        inc := 'b';
        end;
      'b':
        begin
        //b.
        readln(T, cad3, cad2);
        readln(T, x);
        readln(T, a);
        writeln('b) cad1 = ', cad1, ' | cad2 = ', cad2, ' | cad3 = ', cad3, ' | a = ', a, ' | b = ', b, ' | x = ', x:0:1, ' | c = ', c);
        inc := 'c';
        end;
      'c':
        begin
        //c.
        readln(T, cad1, cad3);
        readln(T, c, cad2);
        readln(T, b);
        writeln('c) cad1 = ', cad1, ' | cad2 = ', cad2, ' | cad3 = ', cad3, ' | a = ', a, ' | b = ', b, ' | x = ', x:0:1, ' | c = ', c);
        inc := 'd';
        end;
      'd':
        begin
        //d.
        readln(T, cad2, c, x);
        readln(T, a);
        readln(T, cad1);
        writeln('d) cad1 = ', cad1, ' | cad2 = ', cad2, ' | cad3 = ', cad3, ' | a = ', a, ' | b = ', b, ' | x = ', x:0:1, ' | c = ', c);
        inc := 'e';
        end;
      end;
    end;
    close(T);
  until(inc = 'e');

  readln;
end.

