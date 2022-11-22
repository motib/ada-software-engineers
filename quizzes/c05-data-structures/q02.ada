with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  type T1 is null record;
  X, Y: T1 := (null record);
begin
  Put(Boolean'Image( X = Y ));
end Main;
  
