with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

  type Int is range 0..10_000;

  A: Int := 1_000;
  B: Int := 20;
  C: Int := (A * B) / 5;

begin
  Put_Line( Int'Image(C) );
end Main;

