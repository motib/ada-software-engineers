with Ada.Text_IO; use Ada.Text_IO;
procedure Pref is
  function "<"(Left, Right: Integer) return Boolean is
  begin
    return Left >= Right;
  end "<";
  I: Integer := 5;
  J: Integer := 4;
begin
  if I < J then Put("Strange "); else Put("OK "); end if;
  if 5 < 4 then Put("Strange "); else Put("OK "); end if;
end Pref;
