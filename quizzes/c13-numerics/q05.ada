with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  type M is mod 23;
  X1: M := 21;
  X2: M := 10;
begin
  Put_Line( M'Image( X1 xor X2 ) );
end Main;

