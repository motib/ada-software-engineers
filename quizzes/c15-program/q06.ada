package P is
  procedure Proc;
end P;

with Ada.Text_IO; use Ada.Text_IO;
package body P is
  procedure Proc is
  begin
    Put_Line("Hi from Proc in the package");
  end Proc;
end P;

with P; use P; 
with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  procedure Proc is
  begin
    Put_Line("Hi from Proc in the main subprogram");
  end Proc;
begin
  Proc;
end Main;

