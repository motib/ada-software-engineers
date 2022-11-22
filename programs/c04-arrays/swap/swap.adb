--
-- Swap halves of a string.
--
with Ada.Text_IO; use Ada.Text_IO;
procedure Swap is
  S: String := "HelloWorld";
  Temp: String := S(1..S'Length/2);
begin
  S(1..S'Length/2) := S(S'Length/2+1..S'Length);
  S(S'Length/2+1..S'Length) := Temp;
  Put_Line(S);
end Swap;

