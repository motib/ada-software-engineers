with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  type T is new Integer;
  function "="(Left, Right: T) return Boolean is
  begin
    return Integer(Left) /= Integer(Right);
  end "=";

  type Vector is array(1..2) of T;
  
  A: Vector := (1, 2);
  B: Vector := (3, 4);

begin
  Put_Line(Boolean'Image(A(1) = B(1)));
  Put_Line(Boolean'Image(A = B)); 
end Main;

