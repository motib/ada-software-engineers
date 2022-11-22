with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

  type Fixed is delta 0.5 range 0.0 .. 10.1;

begin
  Put_Line(Fixed'Image(10.1));
end Main;

