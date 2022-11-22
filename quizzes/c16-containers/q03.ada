with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Hashed_Sets;
with Ada.Strings.Hash;
procedure Main is
  subtype Name is String(1..8);
  package Name_Set is 
    new Ada.Containers.Hashed_Sets(
      Name, Ada.Strings.Hash, "=");
  S: Name_Set.Set;
begin
  S.Insert("Goodbye ");
  S.Insert("Earth   ");
  S.Insert("Hello   ");
  S.Insert("World   ");
  Put_Line(Name_Set.Element(S.First));
end Main;
