with Ada.Text_IO;
procedure Main is
  S: String := "Hello world";
begin
  S(2..5) := S(1..4);
  Ada.Text_IO.Put(S);
end Main;

