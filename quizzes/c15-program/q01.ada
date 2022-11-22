with Ada.Integer_Text_IO;
procedure Main is

procedure Proc1(I: in Integer) is
begin
  Ada.Integer_Text_IO.Put(I);
end Proc1;

procedure Proc2(I: in Positive) renames Proc1;

begin
  Proc2(0);  
end Main;

