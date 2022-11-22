with Ada.Text_IO; use Ada.Text_IO;
procedure Main is

  type My_Boolean is new Boolean;

  function "="(Left, Right: Integer) return My_Boolean is
    B: Boolean := Left = Right + 1;
  begin
    return My_Boolean(B);
  end "=";

  function "/="(Left, Right: Integer) return My_Boolean is
    B: Boolean := Left = Right - 1;
  begin
    return My_Boolean(B);
  end "/=";

  M1: My_Boolean := 4 = 3;
  M2: My_Boolean := 3 /= 4;

begin
  Put_Line(My_Boolean'Image(M1));
  Put_Line(My_Boolean'Image(M2));
end Main;

