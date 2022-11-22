with Ada.Integer_Text_IO;
procedure Main is

function F return Integer is
begin
  return 1;
end F;

function F return Float is
begin
  return 1.0;
end F;

begin
  Ada.Integer_Text_IO.Put(F);
  Ada.Integer_Text_IO.Put(Integer(F));
end Main;

