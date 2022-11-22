with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
  N: Integer;
  procedure P(T: String) is
  begin
    Put(T'Last);
  end P;
begin
  Get(N);
  P((1..N => 'X'));
  P((1..10 => 'X', 11..N => 'Y'));
end Main;
