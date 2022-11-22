package P is
  Mode: Integer;
end P;

package body P is
begin
  Mode := 777;
end P;

with P; use P; 
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
begin
  Put(Mode);
end Main;

