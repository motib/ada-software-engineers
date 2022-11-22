package P is
  procedure Proc;
end P;

package body P is
  Inner: exception;
  procedure Proc is
  begin
    raise Inner;
  end Proc;
end P;

with P; use P; 
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;
procedure Main is
begin
  Proc;
exception
  when E: others => Put(Ada.Exceptions.Exception_Name(E));
end Main;

