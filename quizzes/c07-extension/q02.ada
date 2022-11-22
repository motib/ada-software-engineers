package P is
  type T1 is tagged 
    record I: Integer := 0; end record;
  function "="(Left, Right: T1) return Boolean;
  type T2 is new T1 with 
    record N: Integer := 0; end record;
end P;

package body P is
  function "="(Left, Right: T1) return Boolean is
  begin
    return abs(Left.I-Right.I) < 2;
  end "=";
end P;

with P; use P; 
with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  A: T2 := (I => 2, N => 4);
  B: T2 := (I => 3, N => 4);
  C: T2 := (I => 3, N => 4);
  D: T2 := (I => 3, N => 5);
begin
  Put_Line(Boolean'Image(A = B));
  Put_Line(Boolean'Image(C = D));
end Main;

