with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Ordered_Maps;
procedure Main is
  package Float_Map is
    new Ada.Containers.Ordered_Maps(Natural, Float);
  V: Float_Map.Map;
  P: Float_Map.Cursor;
  B: Boolean;
begin
  V.Insert(1, 1.0, P, B);
  V.Insert(1, 2.0, P, B);
  V.Insert(1, 3.0);
end Main;
