with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
  procedure Proc(X: in Integer; Y: in Integer := 2) is
  begin
    Put(X*Y);
  end Proc;
  procedure Proc(Z: in Integer; Y: in Float := 3.0) is
  begin
    Put(Z*Integer(Y));
  end Proc;
  procedure Proc(X: in out Integer) is
  begin
    Put(X);
  end Proc;
begin
  Proc(Z => 4);
  Proc(X => 5);
end Main;

