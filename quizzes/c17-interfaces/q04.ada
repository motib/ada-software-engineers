with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  type T is task interface;
  type P is protected interface;
  type G is tagged null record;
  type D is new G and T and P with null record;
begin
  null;
end Main;
