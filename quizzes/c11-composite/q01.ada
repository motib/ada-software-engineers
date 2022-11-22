with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  type Rec(D: Positive := 100) is
    record
      V: String(1..D);
    end record;
  R: Rec;
begin
  null;
end Main;

