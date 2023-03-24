Program g3e8;
Var
 Arch: text;
 A, Sum, Cont : integer;
Begin
 Assign( Arch, 'datos.TXT' );
 Reset ( Arch );
 Sum:=0;
 Cont := 0;
 While NOT eof ( Arch ) do
 Begin
 Read( Arch, A );
 writeln(A);
 If A > 0 then
 begin
 Sum := Sum + A ; Cont := Cont + 1;
 End;
End;
 Close ( Arch );
 If Cont <> 0 then
 Writeln( Sum / Cont:0:1 )
 Else
 Writeln ('no hay numeros positivos');

 readln;
End.

