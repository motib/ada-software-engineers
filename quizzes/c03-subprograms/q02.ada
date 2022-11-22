with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

  function "/="(Left, Right: Integer) return Boolean is
    B: Boolean := Left = Right - 1;
  begin
    return B;
  end "/=";

begin
  Put_Line(Boolean'Image(4 /= 3));
end Main;

