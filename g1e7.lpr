program g1e7;
type
  Carta = record
    color : String;
    palo : Char;
    numero : integer;
    peso : byte;
  end;
var
  carta_A, carta_B : Carta;
  a, b, c, d, e, f, g, h : boolean;
begin
 //ejemplos logicos.
 a := (carta_A.palo = 'C') and (carta_A.numero = 1);
 b := (carta_A.color = 'Rojo');
 c := (carta_A.palo = carta_B.palo) and (carta_A.numero = carta_B.numero) and (carta_A.palo <> carta_B.palo);
 d := (carta_A.palo = carta_B.palo) and (Abs(carta_A.numero - carta_B.numero) = 1);
 e := (carta_A.palo <> carta_B.palo) and (carta_A.color <> carta_B.color) and (carta_A.numero + carta_B.numero = 12);
 f := (carta_A.numero = carta_B.numero) and (carta_A.palo = carta_B.palo) and (carta_A.color = carta_B.color);
 g := (carta_A.numero <> carta_B.numero) and (carta_A.palo = carta_B.palo) and (carta_A.color = carta_B.color);
 h := (carta_A.color = 'Rojo') and (carta_B.color = 'Azul') or ((carta_A.color = carta_B.color) and ((carta_A.palo = 'O') and (carta_B.palo <> 'O') or (carta_A.numero > carta_B.numero)));
 readln;
end.

