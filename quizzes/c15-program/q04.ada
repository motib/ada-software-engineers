with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
  N: Integer := 5;
  procedure Proc is
    N: Integer := 10;
  begin
    Put(N);
    Put(Main.N);
  end Proc;
begin
  Proc;
end Main;

