with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  subtype Index is Integer range 1..100;
  type Rec(Disc: Index := 100) is
    record
      Data: String(1..Disc);
    end record;

  R1: Rec(100);
  C1: Character renames R1.Data(100);
  R2: Rec;
  C2: Character renames R2.Data(100);
begin
  null;
end Main;

